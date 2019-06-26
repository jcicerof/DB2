/*REXX****************************************************************/
 /* XMPACCOX ..: Retrieve recommendations to help you maintain        */
 /*              DB2 V9 z/OS databases using DSNACCOX stored procedure*/
 /*-------------------------------------------------------------------*/
 /* CALLED BY..: IKJEFT01   - TSO Batch oder Online                   */
 /* ARGUMENTS..: SSID       - Local/Home Subsystem                    */
 /*              CRITERIA   - Criteria for DSNACCOX's recommendations */
 /* CALLS......: DSNREXX  M - DB2/REXX Interface                      */
 /*              XMPABND  M - Abend U0001 (Non-ISPF)                  */
 /*-------------------------------------------------------------------*/
 /* COMMENTS...: Verify that SDSNLOAD ist part of LINKLIST or already */
 /*              allocated to TSO session. If not, you need to        */
 /*              dynamically allocate. (See STEPLIBX in code below!)  */
 /*-------------------------------------------------------------------*/
 /* FUNCTION...: Calls DSNACOXX stored procedure to determine objects */
 /*              which need maintenance (copy, runstats, reorg, all). */
 /*-------------------------------------------------------------------*/
 /* HISTORY....: 19.08.10/G.Ruban - V2R0 adapted from DSNACCOR->COX   */
 /*********************************************************************/
 /* https://ruban.de/codezos/rexx-script-xmpaccox-execute-db2-v9-zos-databases-using-dsnaccox-stored-procedure/ */


 x = MSG("OFF")

 /*********************************************************************/
 /* process arguments passed to procedure                             */
 /*********************************************************************/
 parse upper arg arglist
 ver = "2.0"
 Numeric Digits 12

 if pos("DEBUG",arglist)>0
 then do
      debug = "DEBUG"
      TRACE ?I
      SQLTRACE = "TRACE"
 end

 /*********************************************************************/
 /* Some environment information and initialzations                   */
 /*********************************************************************/
 PARSE SOURCE,
    source_host_env,
    source_call_type,
    source_uc_exec_name,
    source_hostdd,
    source_hostdsn,
    source_nf_exec_name,
    source_initial_cmd_env,
    source_asid_name

 jobnamestep   = Get_Jobname()
 sysvar_sysuid = SYSVAR("SYSUID")
 sysvar_sysenv = SYSVAR("SYSENV")

 /*********************************************************************/
 /* Header                                                            */
 /*********************************************************************/
 "CLRSCRN"
 say copies("#",79)
 say "# XMPACCOX V"ver" - Recommendations to maintain DB2 objects ",
     " "date("O")" "time()" #";
 say copies("#",79)
 say ""

 /*********************************************************************/
 /* Cechk required environment                                        */
 /*********************************************************************/
 if (source_host_env ^= "TSO") then do
   Say "Wrong host environment" source_host_env
   signal error
 end

 parse var arglist ssid CRITERIA
 if debug = "DEBUG"
 then do
      i = pos("DEBUG",ssid)
      if i>0 then ssid = delstr(ssid,i,5)
      i = wordpos("DEBUG",CIRTERIA)
      if i>9 then CRITERIA = delword(CRITERIA,i,1)
 end

 if ssid = "" ! ssid = "DEBUG"
 then do
      say "Executing without arguments,",
          "setting default DB2 subsystem id and criteria."
      ssid     = "DB2T"
      CRITERIA = "DBNAME LIKE 'DSN%'",          /* WHERE CLAUSE 4096 */
                 "AND NAME LIKE '%'"
 end
 CRITERIA_IND = 0

 say "XMPACCOX ...: Following values have been set for DSNACCOX"
 say "DB2 SSID ...:" ssid
 say "CHKLVL .....: Use the chklvl parameter to cause dsnaccox to"
 say "              check for related table spaces when processing"
 say "              index spaces, and delete recommendation for"
 say "              indexspaces when an action (such as reorg) on the"
 say "              table space will also cause the action to be done"
 say "              on the index space. (CHKLVL=64) "
 say "CRITERIA ...:" CRITERIA
 say "              Use the criteria parameter to cause DSNACCOX to "
 say "              make recommendations only for objects in databases"
 say "              you want to."
 say "Other parms : Following parameter values have been set, which are"
 say "              lower than the defaults:"
 say "              CRUPDATEDPAGESPCT  4          RRIAPPENDINSERTPCT 5"
 say "              CRCHANGESPCT       2          SRTINSDELUPDPCT    5"
 say "              RRTINSERTPCT       2          SRIINSDELPCT       5"
 say "              RRTUNCLUSTINSPCT   5          EXTENTLIMIT        3"
 say "              RRTDISORGLOBPCT    5"
 say "              Excluded the checking for these criteria by set the"
 say "              following values to a negative value:"
 say "              RRTMASSDELLIMIT    -1         RRIMASSDELLIMIT    -1"
 say ""

 /*********************************************************************/
 /* If DB2 Load Library is not part of z/OS LINKLIST:                 */
 /* Allocate SDSNLOAD using CA TSOPLUS (or any other which adds the   */
 /* DB2 load libray dynamically to the STEPLIB).                      */
 /*********************************************************************/
  address TSO
  "FREE  FI(STEPLIBX) DA('SAMPLE."ssid".SDSNLOAD')"
  "ALLOC FI(STEPLIBX) DA('SAMPLE."ssid".SDSNLOAD') SHR REUSE"
  if rc <> 0
  then do
       say "DB2 SDSNLOAD library for SSID="ssid" is not available!"
       say "Check z/OS LINKLIST or allocate to STEPLIB in advance!"
       signal error
  end

  ADDRESS TSO "SUBCOM DSNREXX"
  if rc <> 0
  then do
       cc = RXSUBCOM("ADD","DSNREXX","DSNREXX")
       if cc
       then do
            say "DB2 SDSNLOAD library not available!"
            say "Check z/OS LINKLIST or allocate to STEPLIB in advance!"
            signal error
       end
  end

 /*********************************************************************/
 /* Setup utility name and utility statement variables:               */
 /*********************************************************************/
 QUERYTYPE          = "ALL";      QUERYTYPE_IND             = 0 ;
 OBJECTTYPE         = "ALL";      OBJECTTYPE_IND            = 0 ;
 ICTYPE             = "B";        ICTYPE_IND                = 0 ;
 CATLGSCHEMA        = "SYSIBM";   CATLGSCHEMA_IND           = 0 ;
 LOCALSCHEMA        = "DSNACC";   LOCALSCHEMA_IND           = 0 ;
 CHKLVL             = 64;         CHKLVL_IND                = 0 ;
 UNUSED             = "";         UNUSED_IND                = -1;
 CRUPDATEDPAGESPCT  = 0 ;         CRUPDATEDPAGESPCT_IND     = -1;
 CRUPDATEDPAGESABS  = 0 ;         CRUPDATEDPAGESABS_IND     = -1;
 CRCHANGESPCT       = 0 ;         CRCHANGESPCT_IND          = -1;
 CRDAYSNCLASTCOPY   = 0 ;         CRDAYSNCLASTCOPY_IND      = -1;
 ICRUPDATEDPAGESPCT = 0 ;         ICRUPDATEDPAGESPCT_IND    = -1;
 ICRUPDATEDPAGESABS = 0 ;         ICRUPDATEDPAGESABS_IND    = -1;
 ICRCHANGESPCT      = 0 ;         ICRCHANGESPCT_IND         = -1;
 CRINDEXSIZE        = 0 ;         CRINDEXSIZE_IND           = -1;
 RRTINSERTSPCT      = 0 ;         RRTINSERTSPCT_IND         = -1;
 RRTINSERTSABS      = 0 ;         RRTINSERTSABS_IND         = -1;
 RRTDELETESPCT      = 0 ;         RRTDELETESPCT_IND         = -1;
 RRTDELETESABS      = 0 ;         RRTDELETESABS_IND         = -1;
 RRTUNCLUSTINSPCT   = 0 ;         RRTUNCLUSTINSPCT_IND      = -1;
 RRTDISORGLOBPCT    = 0 ;         RRTDISORGLOBPCT_IND       = -1;
 RRTDATASPACERAT    = 0 ;         RRTDATASPACERAT_IND       = -1;
 RRTMASSDELLIMIT    = 0 ;         RRTMASSDELLIMIT_IND       = -1;
 RRTINDREFLIMIT     = 0 ;         RRTINDREFLIMIT_IND        = -1;
 RRIINSERTSPCT      = 0 ;         RRIINSERTSPCT_IND         = -1;
 RRIINSERTSABS      = 0 ;         RRIINSERTSABS_IND         = -1;
 RRIDELETESPCT      = 0 ;         RRIDELETESPCT_IND         = -1;
 RRIDELETESABS      = 0 ;         RRIDELETESABS_IND         = -1;
 RRIAPPENDINSERTPCT = 0 ;         RRIAPPENDINSERTPCT_IND    = -1;
 RRIPSEUDODELETEPCT = 0 ;         RRIPSEUDODELETEPCT_IND    = -1;
 RRIMASSDELLIMIT    = 0 ;         RRIMASSDELLIMIT_IND       = -1;
 RRILEAFLIMIT       = 0 ;         RRILEAFLIMIT_IND          = -1;
 RRINUMLEVELSLIMIT  = 0 ;         RRINUMLEVELSLIMIT_IND     = -1;
 SRTINSDELUPDPCT    = 0 ;         SRTINSDELUPDPCT_IND       = -1;
 SRTINSDELUPDABS    = 0 ;         SRTINSDELUPDABS_IND       = -1;
 SRTMASSDELLIMIT    = 0 ;         SRTMASSDELLIMIT_IND       = -1;
 SRIINSDELUPDPCT    = 0 ;         SRIINSDELUPDPCT_IND       = -1;
 SRIINSDELUPDABS    = 0 ;         SRIINSDELUPDABS_IND       = -1;
 SRIMASSDELLIMIT    = 0 ;         SRIMASSDELLIMIT_IND       = -1;
 EXTENTLIMIT        = 0 ;         EXTENTLIMIT_IND           = -1;
 LASTSTATEMENT      = 0 ;         LASTSTATEMENT_IND         = -1;
 RETURNCODE         = 0 ;         RETURNCODE_IND            = -1;
 ERRORMSG           = 0 ;         ERRORMSG_IND              = -1;
 IFCARETCODE        = 0 ;         IFCARETCODE_IND           = -1;
 IFCARESCODE        = 0 ;         IFCARESCODE_IND           = -1;
 XSBYTES            = 0 ;         XSBYTES_IND               = -1;

 /*********************************************************************/
 /* Set the indicator variables to 0 for non-null input parameters    */
 /* (parameters for which you do not want DSNACCOX to use default     */
 /* values) and for output parameters.                                */
 /*********************************************************************/
 CRUPDATEDPAGESPCT  = 4 ;         CRUPDATEDPAGESPCT_IND     = 0 ;
 CRCHANGESPCT       = 2 ;         CRCHANGESPCT_IND          = 0 ;
 RRTINSDELUPDPCT    = 2 ;         RRTINSDELUPDPCT_IND       = 0 ;
 RRTUNCLUSTINSPCT   = 5 ;         RRTUNCLUSTINSPCT_IND      = 0 ;
 RRTDISORGLOBPCT    = 5 ;         RRTDISORGLOBPCT_IND       = 0 ;
 RRIAPPENDINSERTPCT = 5 ;         RRIAPPENDINSERTPCT_IND    = 0 ;
 SRTINSDELUPDPCT    = 5 ;         SRTINSDELUPDPCT_IND       = 0 ;
 SRIINSDELPCT       = 5 ;         SRIINSDELPCT_IND          = 0 ;
 EXTENTLIMIT        = 3 ;         EXTENTLIMIT_IND           = 0 ;
 RRTMASSDELLIMIT    = 0 ;         RRTMASSDELLIMIT_IND       = -1 ;
 RRIMASSDELLIMIT    = 0 ;         RRIMASSDELLIMIT_IND       = -1 ;

 LASTSTATEMENT      = COPIES("",8012);
                                  LASTSTATEMENT_IND         = 0;
 RETURNCODE         = 0;          RETURNCODE_IND            = 0;
 ERRORMSG           = COPIES("",1331);
                                  ERRORMSG_IND              = 0;
 IFCARETCODE        = 0;          IFCARETCODE_IND           = 0;
 IFCARESCODE        = 0;          IFCARESCODE_IND           = 0;
 XSBYTES            = 0;          XSBYTES_IND               = 0;

 /*********************************************************************/
 /* call DB2 stored procedure                                         */
 /*********************************************************************/
 sqlstmt = "CALL SYSPROC.DSNACCOX",
              "(:QUERYTYPE          :QUERYTYPE_IND, " ,
              " :OBJECTTYPE         :OBJECTTYPE_IND, " ,
              " :ICTYPE             :ICTYPE_IND, " ,
              " :CATLGSCHEMA        :CATLGSCHEMA_IND, " ,
              " :LOCALSCHEMA        :LOCALSCHEMA_IND, " ,
              " :CHKLVL             :CHKLVL_IND, " ,
              " :CRITERIA           :CRITERIA_IND, " ,
              " :UNUSED             :UNUSED_IND, " ,
              " :CRUPDATEDPAGESPCT  :CRUPDATEDPAGESPCT_IND, " ,
              " :CRUPDATEDPAGESABS  :CRUPDATEDPAGESABS_IND, " ,
              " :CRCHANGESPCT       :CRCHANGESPCT_IND, " ,
              " :CRDAYSNCLASTCOPY   :CRDAYSNCLASTCOPY_IND, " ,
              " :ICRUPDATEDPAGESPCT :ICRUPDATEDPAGESPCT_IND, " ,
              " :ICRUPDATEDPAGESABS :ICRUPDATEDPAGESABS_IND, " ,
              " :ICRCHANGESPCT      :ICRCHANGESPCT_IND, " ,
              " :CRINDEXSIZE        :CRINDEXSIZE_IND, " ,
              " :RRTINSERTSPCT      :RRTINSERTSPCT_IND, " ,
              " :RRTINSERTSABS      :RRTINSERTSABS_IND, " ,
              " :RRTDELETESPCT      :RRTDELETESPCT_IND, " ,
              " :RRTDELETESABS      :RRTDELETESABS_IND, " ,
              " :RRTUNCLUSTINSPCT   :RRTUNCLUSTINSPCT_IND, " ,
              " :RRTDISORGLOBPCT    :RRTDISORGLOBPCT_IND, " ,
              " :RRTDATASPACERAT    :RRTDATASPACERAT_IND, " ,
              " :RRTMASSDELLIMIT    :RRTMASSDELLIMIT_IND, " ,
              " :RRTINDREFLIMIT     :RRTINDREFLIMIT_IND, " ,
              " :RRIINSERTSPCT      :RRIINSERTSPCT_IND, " ,
              " :RRIINSERTSABS      :RRIINSERTSABS_IND, " ,
              " :RRIDELETESPCT      :RRIDELETESPCT_IND, " ,
              " :RRIDELETESABS      :RRIDELETESABS_IND, " ,
              " :RRIAPPENDINSERTPCT :RRIAPPENDINSERTPCT_IND, " ,
              " :RRIPSEUDODELETEPCT :RRIPSEUDODELETEPCT_IND, " ,
              " :RRIMASSDELLIMIT    :RRIMASSDELLIMIT_IND, " ,
              " :RRILEAFLIMIT       :RRILEAFLIMIT_IND, " ,
              " :RRINUMLEVELSLIMIT  :RRINUMLEVELSLIMIT_IND, " ,
              " :SRTINSDELUPDPCT    :SRTINSDELUPDPCT_IND, " ,
              " :SRTINSDELUPDABS    :SRTINSDELUPDABS_IND, " ,
              " :SRTMASSDELLIMIT    :SRTMASSDELLIMIT_IND, " ,
              " :SRIINSDELUPDPCT    :SRIINSDELUPDPCT_IND, " ,
              " :SRIINSDELUPDABS    :SRIINSDELUPDABS_IND, " ,
              " :SRIMASSDELLIMIT    :SRIMASSDELLIMIT_IND, " ,
              " :EXTENTLIMIT        :EXTENTLIMIT_IND, " ,
              " :LASTSTATEMENT      :LASTSTATEMENT_IND, " ,
              " :RETURNCODE         :RETURNCODE_IND, " ,
              " :ERRORMSG           :ERRORMSG_IND, " ,
              " :IFCARETCODE        :IFCARETCODE_IND, " ,
              " :IFCARESCODE        :IFCARESCODE_IND, " ,
              " :XSBYTES            :XSBYTES_IND)";

 ADDRESS DSNREXX "CONNECT" ssid
 call Code 0

 address DSNREXX "EXECSQL" sqlstmt
 call Code 0 466                        /* +466 = more rows to fetch */

 if returncode = 0
 then do
   /* say copies("=",79) */
   /* say "Approximate "space(delword(errormsg,1,1)),              */
   /*     "of the total number of objects in the subsystem that", */
   /*     "have information in the real-time statistics tables." */
   /* say copies("=",79) */
   /* say ""             */
      say "Recommendations: You should watch ..."
      say copies("-",79)
 end
 else do
      if returncode =  4
      then Say "DSNACCOX completed, but with incompatible parms."
      if returncode =  8
      then say "DSNACCOX terminated with errors."
      if returncode = 12
      then say "DSNACCOX terminated with severe errors."
      if returncode = 14
      then say "You need to create the RTS tables or grant access."
      if returncode = 16
      then say "You need to create a TEMP database and tablespaces."
      say "Error Message......: "errormsg
      say "IFCA Return Code...: "IFCARetCode
      say "IFCA Reseas Code...: "IFCAResCode
      say "Last Statement.....: "laststatement
      signal error
 end
 /*********************************************************************/
 /* Combine two locators with the stored procedure                    */
 /*********************************************************************/
 LOC1 = d2x(0)
 LOC2 = d2x(0)
 sqlstmt = "ASSOCIATE LOCATORS (:LOC1, :LOC2)",
           "WITH PROCEDURE SYSPROC.DSNACCOX"
 address DSNREXX "EXECSQL" sqlstmt;
 call code 0

 /*********************************************************************/
 /* Allocate and process cursor-driven                                */
 /*********************************************************************/
 sqlstmt = "ALLOCATE C101 CURSOR FOR RESULT SET :LOC1"
 address DSNREXX "EXECSQL" sqlstmt;
 do while sqlcode = 0
   call code 0
   sqlstmt = "FETCH C101 INTO :RS_SEQ, :RS_DATA"
   Address DSNREXX "EXECSQL" sqlstmt;
   /*say RS_SEQ RS_DATA*/
 end
 call code 0 100

 sqlstmt = "CLOSE C101"
 ADDRESS DSNREXX "EXECSQL "sqlstmt;
 call code 0 100

 /*********************************************************************/
 /* Allocate and process cursor-driven                                */
 /*********************************************************************/
 sqlstmt = "ALLOCATE C102 CURSOR FOR RESULT SET :LOC2"
 address DSNREXX "EXECSQL" sqlstmt;
 call Code 0

 /*********************************************************************/
 /* Fetch all messages via the cursor                                 */
 /*********************************************************************/
 sqlstmt = "FETCH C102 INTO ",
                  ":DBNAME             :DBNAME_IND           ,",
                  ":NAME               :NAME_IND             ,",
                  ":PARTITION          :PARTITION_IND        ,",
                  ":INSTANCE           :INSTANCE_IND         ,",
                  ":CLONE              :CLONE_IND            ,",
                  ":OBJECTTYPE         :OBJECTTYPE_IND       ,",
                  ":INDEXSPACE         :INDEXSPACE_IND       ,",
                  ":CREATOR            :CREATOR_IND          ,",
                  ":OBJECTSTATUS       :OBJECTSTATUS_IND     ,",
                  ":IMAGECOPY          :IMAGECOPY_IND        ,",
                  ":RUNSTATS           :RUNSTATS_IND         ,",
                  ":EXTENTS            :EXTENTS_IND          ,",
                  ":REORG              :REORG_IND            ,",
                  ":INEXCEPTTABLE      :INEXCEPTTABLE_IND    ,",
                  ":ASSOCIATEDTS       :ASSOCIATEDTS_IND     ,",
                  ":COPYLASTTIME       :COPYLASTTIME_IND     ,",
                  ":LOADRLASTTIME      :LOADRLASTTIME_IND    ,",
                  ":REBUILDLASTTIME    :REBUILDLASTTIME_IND  ,",
                  ":CRUPDPGSPCT        :CRUPDPGSPCT_IND      ,",
                  ":CRUPDPGSABS        :CRUPDPGSABS_IND      ,",
                  ":CRCPYCHGPCT        :CRCPYCHGPCT_IND      ,",
                  ":CRDAYSCELSTCPY     :CRDAYSCELSTCPY_IND   ,",
                  ":CRINDEXSIZE        :CRINDEXSIZE_IND      ,",
                  ":REORGLASTTIME      :REORGLASTTIME_IND    ,",
                  ":RRTINSERTSPCT      :RRTINSERTSPCT_IND    ,",
                  ":RRTINSERTSABS      :RRTINSERTSABS_IND    ,",
                  ":RRTDELETESPCT      :RRTDELETESPCT_IND    ,",
                  ":RRTDELETESABS      :RRTDELETESABS_IND    ,",
                  ":RRTUNCINSPCT       :RRTUNCINSPCT_IND     ,",
                  ":RRTDISORGLOBPCT    :RRTDISORGLOBPCT_IND  ,",
                  ":RRTDATASPACERAT    :RRTDATASPACERAT_IND  ,",
                  ":RRTMASSDELETE      :RRTMASSDELETE_IND    ,",
                  ":RRTINDREF          :RRTINDREF_IND        ,",
                  ":RRIINSERTPCT       :RRIINSERTPCT_IND     ,",
                  ":RRIINSERTABS       :RRIINSERTABS_IND     ,",
                  ":RRIDELETEPCT       :RRIDELETEPCT_IND     ,",
                  ":RRIDELETABS        :RRIDELETABS_IND      ,",
                  ":RRIAPPINSPCT       :RRIAPPINSPCT_IND     ,",
                  ":RRIPSDDELPCT       :RRIPSDDELPCT_IND     ,",
                  ":RRIMASSDELETE      :RRIMASSDELETE_IND    ,",
                  ":RRILEAF            :RRILEAF_IND          ,",
                  ":RRINUMLEVELS       :RRINUMLEVELS_IND     ,",
                  ":STATSLASTTIME      :STATSLASTTIME_IND    ,",
                  ":SRTINSDELUPDPCT    :SRTINSDELUPDPCT_IND  ,",
                  ":SRTINSDELUPDABS    :SRTINSDELUPDABS_IND  ,",
                  ":SRTMASSDELETE      :SRTMASSDELETE_IND    ,",
                  ":SRIINSDELPCT       :SRIINSDELPCT_IND     ,",
                  ":SRIINSDELABS       :SRIINSDELABS_IND     ,",
                  ":SRIMASSDELETE      :SRIMASSDELETE_IND    ,",
                  ":TOTALEXTENTS       :TOTALEXTENTS_IND     ";
 do while sqlcode = 0
    if OBJECTTYPE <> "ALL"
    then do
         Say "DATABASE: "DBNAME" SPACENAME: "NAME "("OBJECTTYPE")"
         if IMAGECOPY <> "NO"
         then do
              if COPYLASTTIME_IND = -1 then COPYLASTTIME = "NEVER"
              say "- Imagecopy ...: "IMAGECOPY", last done "COPYLASTTIME
              call Line(CRUPDPGSPCT "% updated pages")
              call Line(CRCPYCHGPCT "% rows INS/DEL/UPD")
              call Line(CRDAYSCELSTCPY "day(s) since last COPY")
         end
         if RUNSTATS <> "NO"
         then do
              if STATSLASTTIME_IND = -1 then STATSLASTTIME = "NEVER"
              say "- Runstats ....: "RUNSTATS", last done "STATSLASTTIME
              call Line(SRTMASSDELETE "mass deleted")
              call Line(SRTINSDELUPDPCT "% rows INS/DEL/UPD")
         end
         if REORG <> "NO"
         then do
              if REORGLASTTIME_IND = -1 then REORGLASTTIME = "NEVER"
              say "- Reorg .......: "REORG", last done "REORGLASTTIME
              call Line(RRTMASSDELETE "mass deleted")
              call Line(RRTINSERTSPCT "% rows INS/DEL/UPD")
              call line(RRTUNCINSPCT "% rows unclustered INSERT's")
              call line(RRTINDREF "% overflowed records")
         end
         if EXTENTS <> "NO"
         then do
              say "- Extents .....: "EXTENTS", "TOTALEXTENTS" extent(s)"
         end
    end
    Address DSNREXX "EXECSQL" SQLSTMT
 end
 call code 0 100

 sqlstmt = "CLOSE C102"
 address DSNREXX "EXECSQL "sqlstmt;
 call code 0 100

 say "*** end ***"

/*********************************************************************/
/* Disconnect vom Subsystem                                          */
/*********************************************************************/
Disconnect:
    ADDRESS DSNREXX "DISCONNECT"
    cc = RXSUBCOM("DELETE","DSNREXX","DSNREXX")
return
/*********************************************************************/
/* Error processing and termination                                  */
/*********************************************************************/
SYNTAX:
      say "XMPACCOX: Syntax error."
      say "          [TSO] XMPACCOX ssid options"
      say "          ssid .......: DB2 Subsystem ID"
      say "          criteria ...: criteria for DSNACCOX"
ERROR:
      say ""
      say "Current enviroment:" jobnamestep source_host_env,
          source_call_type source_uc_exec_name source_hostdd,
          source_hostdsn source_nf_exec_name source_initial_cmd_env
      If Sysvar(SYSISPF) = "NOT ACTIVE"
      then do
           say "REXX procedure XMPACCOX ends with U0001."
           address ATTACH "XMPABND"
           exit 0
      end
      say "REXX procedure XMPACCOX ends with RC=20."
exit 20

/*********************************************************************/
/* Check SQLCODE's allowed                                           */
/*********************************************************************/
Code:
   arg codes
   allowed = "NO"
   do ci=1 to words(codes)
      if sqlcode = word(codes,ci)
      then allowed = "YES"
   end
   if allowed = "NO"
   then do
        say "CONNECT: SQL Error with SQLCODE="sqlcode
        call TIAR sqlcode
        say "         "sqlstmt
        call Disconnect
        signal error
   end
return

/*********************************************************************/
/* process line output, hide if value contains no information        */
/*********************************************************************/
Line: arg lval ltext
      lval = trunc(lval)
      if lval > 0
      then say right(lval,20)" "ltext
return

/*********************************************************************/
/* Retrieve some internal information from z/OS control blocks       */
/*********************************************************************/
GET_JOBNAME: Procedure
   /* all fields are part of general use prog'ing interface */
   PSATOLD  = '21C'X
   TCB      = C2D(STORAGE(C2X(PSATOLD),4))
   TIOT     = C2D(STORAGE(D2X(TCB+12),4))
   TIOCNJOB = STRIP(STORAGE(D2X(TIOT),8))
   TIOCSTEP = STRIP(STORAGE(D2X(TIOT+8),8))
Return TIOCNJOB TIOCSTEP

/*********************************************************************/
/* Display SQL Commmunication area using DSNTIAR                     */
/*********************************************************************/
TIAR: arg sqlcode
      sqlc = d2x(sqlcode,8)
      sqlc = x2c(sqlc)

      sqlca = 'sqlca   '
      sqlca = sqlca !!  x2c(00000088)
      sqlca = sqlca !!  sqlc
      sqlca = sqlca !!  x2c(0000)
      sqlca = sqlca !!  copies(' ',78)
      sqlca = sqlca !!  copies(x2c(00),24)
      sqlca = sqlca !!  copies(' ',16)
      tiar_msg = x2c(0190)copies(' ',400)
      text_len = x2c(00000050) ;
      /***************************************************************/
      /* Extract Message from Return Area                            */
      /***************************************************************/
      ADDRESS ATTCHPGM 'DSNTIAR SQLCA TIAR_MSG TEXT_LEN'
      say substr(tiar_msg,4,400);
      /***************************************************************/
      /* Extract Message from Return Area                            */
      /***************************************************************/
      len = c2d(substr(rtrnarea,5,2))
      /***************************************************************/
      /* Extract Message from Return Area                            */
      /***************************************************************/
      say "          SQLCODE="sqlcode
      say "          SQLERRMC="sqlerrmc
      say "          SQLWARN5="sqlwarn.5
      say "          SQLERRP ="sqlerrp
      say "          SQLSTATE="sqlstate
return
