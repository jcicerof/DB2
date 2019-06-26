/* REXX **************************************************************/
/*                                                                   */
/*        LISTEXTS - THIS PROGRAM REVIEWS THE MVS USER CATALOG       */
/*                   CONTAINING THE HLQ SPECIFIED IN THE ARGUMENT    */
/*                   PASSED FROM THE JCL. REPORTS ANY DATASETS THAT  */
/*                   ARE GREATER THAN ARG EXTENTS OR GIGSIZE         */
/*                   THIS PROGRAM REQUIRES DB2 V6 FOR THE REXX TO SQL*/
/*                                                                   */
/*********************************************************************/
/*              INSTRUCTS FOR INPUT PARAMETERS                       */
/*              ==============================                       */
/* 1. //SYSTSIN  DD *                                                */
/*      ISPSTART CMD(%LISTEXTS CUSTOMER,LN_MGR_2,DEPT,DIVISION,      */
/*                   ENVIR_TYP,SERV_OFF,RPTFLAG                      */
/*                                                                   */
/*  %LISTEXTS  = NAME OF REXX CLIST TO BE RUN                        */
/*  CUSTOMER   = CUSTOMER NAME - MAX 12 BYTES                        */
/*  LN_MGR_2   = 2ND LINE MANAGER - MAX 14 BYTES                     */
/*  DEPT       = IBM DEPARMENT - MAX 6 BYTES                         */
/*  DIVISION   = IBM DIVISION - MAX 5 BYTES                          */
/*  ENVIR_TYP  = ENVIRONMENT TYPE (PROD,TEST,DEV,QA,STAGING,OTHER)- 8*/
/*  SERV_OFF   = SERVICE OFFERING (STD, CUSTOM, ONDEMAND, OTHER) - 9 */
/*  RPTFLAG   = 'Y' OR 'N' CREATE REORG STATS/RPT FROM DB2 CATLG INFO*/
/*                                                                   */
/* 2. //INDB2SYS  DD  * (USE COMMA BETWEEN ARGUMENT FIELDS)          */
/*      SSID, EXTLIM, DB2HLQ       EXAMPLE:  P2KF,40,IADBPD88        */
/*  SSID   = DB2 SUBSYSTEM ID                                        */
/*  EXTLIM = EXTENT THRESHHOLD RPT LIMIT FOR "DSNHLQ" DATASETS       */
/*           SUGGESTED VALUE FOR MOST ENVIRONMENTS =>  40            */
/*  DB2HLQ = HLQ OF DB2 DATASET    EXAMPLE: VCAT.DSNDBD.**           */
/*                                                                   */
/*  THERE MUST BE A VCAT ENTRY LISTED FOR EVERY VCAT ENTRY THAT WAS  */
/*  IN THE LISTCAT STEP - SYSIN DD STMT  (IN THE EXACT SAME ORDER)   */
/*                                                                   */
/*********************************************************************/
/*=================== MAINTENANCE LOG ===============================*/
/* MMDDYY VER     UPDATED BY    REASON                               */
/* 042501 01.00  A.FARAGHER  NEW VERSION OF PROGRAM                  */
/* 030802 01.01  A.FARAGHER  UPDATED                                 */
/* 082004 01.02  A.FARAGHER  ADDED HANDLING FOR MIGRATED DATASETS    */
/* 022005 01.04  A.FARAGHER  CHANGED TO MAX 72 BYTES IN CODE SO IT   */
/*                    CAN BE SAVED IN STANDARD 80 BYTE EXEC DATASET. */
/*                    ADDED DSG ON DETAIL LINE FOR METRICS.          */
/* 022805 01.04  A.FARAGHER  ADDED TRACE_PROB - WHEN SET THE YES IT  */
/*                           WILL OUTPUT EACH LISTCAT DSN.  IT IS    */
/*                           LOOKING FOR EITHER A BROKEN CATALOG     */
/*                           ENTRY OR AN OS SEQUENTIAL FILE IN THE   */
/*                           VSAM LISTCAT GROUP OF DATASETS.         */
/*                           LOOKING FOR EITHER A BROKEN CATALOG     */
/*                           ENTRY OR AN OS SEQUENTIAL FILE IN THE   */
/*                           VSAM LISTCAT GROUP OF DATASETS.         */
/* 041105 01.04  A.FARAGHER  ADDED CUSTOMER NAME TO THE INPUT PARM   */
/*                           AND TO THE DETAIL LINES IN THE MASTER   */
/*                           OUTPUT REPORT.                          */
/* 042805 01.05  A.FARAGHER  MODIFIED THE SQLSTMT1 - 5. TO ADD THE   */
/*                           SPACE ¬= -1 FOR SAP TS/IX DEFINE NO.    */
/* 050205 01.05  A.FARAGHER  REWORKED SELECT #1 TO INCLUDE MORE DATA */
/*                           AND THEN DELETED SELECT #4 FOR          */
/*                           EFFICIENCY - LESS MEMORY/REGION.        */
/*                           ADDED CODING TO REPLACE USER() HLQ WITH */
/*                           THE 1ST TWO HLQ FOR DD RPTMSTR FOR      */
/*                           THE TEMPORARY HLIST DATASET.            */
/* 051105 01.06  A.FARAGHER  ADDED TO THE PARM THE FOLLOWING         */
/*                           LN_MGR_2 DEPT, IBM_DIV, ENVIR_TYP &     */
/*                           SERV_OFF.  ADDED THESE PLUS DEFAULT     */
/*                           VALUES 'MF' AND 'DB2UDB' TO THE         */
/*                           OUTPUT RECORDS.  INCREASED OUTPUT       */
/*                           RECORD FROM 150 TO 200 BYTES.           */
/* 052305 01.06  A.FARAGHER  ADDED NEW EYE CATCHER FOR CRITICAL      */
/*                           PROBLEMS. EYE CATCHER = '!!!'           */
/*                           REMOVED SPECIAL MAP6 REPORT PROCESSING. */
/*********************************************************************/
ARG PARM
PARSE UPPER VAR PARM CUSTOMER ',' LN_MGR_2 ',' DEPT ',' IBM_DIV ',' ,
      ENVIR_TYP ',' SERV_OFF ',' RPTFLAG ',' TRACE_PROB

lparnm = MVSVAR('SYSNAME')

customer  = strip(customer)
ln_mgr_2  = strip(ln_mgr_2)
dept      = strip(dept)
ibm_div   = strip(ibm_div)
envir_typ = strip(envir_typ)
serv_off  = strip(serv_off)
lparnm    = strip(lparnm)
rptflag   = strip(rptflag)

currdate = date('S')
cdate    = substr(currdate,1,4) || '-' ||,
           substr(currdate,5,2) || '-' ||,
           substr(currdate,7,2)

If customer = '' Then Do
   Say 'Customer is required in the input parm ' customer
   zispfrc = 16
   ADDRESS ISPEXEC 'VPUT (zispfrc)'
   Exit(16)
End

If lparnm = '' Then Do
   Say 'MVS Host Name is required in the input parm ' lparnm
   zispfrc = 16
   ADDRESS ISPEXEC 'VPUT (zispfrc)'
   Exit
End

If rptflag ¬= 'Y' Then
   rptflag = 'N'

CALL READ_INDB2SYS
CALL READ_VSAMLIST
IF DD1IN.0 > 0  THEN DO
   CALL GET_MIGRATED_DS
   CALL PROCESS_VSAMLIST
   CALL OUT_MSTR_RPT
   IF m = 0 Then Do
      Say 'No requested datasets contain extents  >= requested'
      Say '-OR- no requested dsns over gig limit - .3'
   END
END


/* CREATE CLUSTER RATIO, ETC. TYPE MAINT REPORTS IF REQUESTED         */
/* DO THIS OF EACH DB2 SUBSYSTEM REQUESTED IN THE PARM                */
If rptflag = 'Y' Then Do
  db2sysck = db2sys.1
  If db2sysck ¬= '' Then Do
     CALL GET_MAINT_INFO
    End

  Do ie = 2 to dd0in.0
  ic = ie - 1
  If db2sys.ie ¬= '' Then
     If db2sys.ic ¬= db2sys.ie Then Do
        db2sysck = db2sys.ie
        If db2sysck ¬= '' Then Do
           CALL GET_MAINT_INFO
        End
     End
  End

END /* end for rptflag */
zispfrc = 0
ADDRESS ISPEXEC 'VPUT (zispfrc)'
Exit

read_indb2sys:
/****************************************************************/
/* READS THE RECORDS INTO AN ARRAY AND CLOSES THE FILE.         */
/****************************************************************/
ADDRESS MVS "EXECIO * DISKR "INDB2SYS" (STEM DD0IN. FINIS "
IF RC ¬= 0  THEN DO
   Say "File I/O error on DD INDATA"
   zispfrc = 16
   ADDRESS ISPEXEC 'VPUT (zispfrc)'
   Exit
END

IF DD0IN.0 = 0  THEN DO
   Say "INDB2SYS Dataset/SYSIN is empty "
END

Do i = 1 to dd0in.0
   inrec = dd0in.i
   Parse upper var inrec db2sys.i ',' dsnext.i ',' dsnhlq.i
   db2sys.i = strip(db2sys.i)
   dsnhlq.i = strip(dsnhlq.i)
   If db2sys.i ¬= '' Then,
      If datatype(dsnext.i,w) = 0 Then Do
      Say 'Invalid Extents # in PARM, must be a whole number ' dsnext.i
        zispfrc = 16
         ADDRESS ISPEXEC 'VPUT (zispfrc)'
         Exit
      End
End

If db2sys.1 = '' Then Do
   Say 'Invalid DB2SYS.1 is required ' db2sys.1
   zispfrc = 16
   ADDRESS ISPEXEC 'VPUT (zispfrc)'
   Exit
End
If datatype(dsnext.1,w) = 0 Then Do
   Say 'Invalid dsnext.1, must be a whole number ' dsnext.1
   zispfrc = 16
   ADDRESS ISPEXEC 'VPUT (zispfrc)'
   Exit
End
If dsnhlq.1 = '' Then Do
   Say 'Invalid dsnhlq.1 is required ' dsnhlq.1
   zispfrc = 16
   ADDRESS ISPEXEC 'VPUT (zispfrc)'
   Exit
End

Return(0)

read_vsamlist:
/****************************************************************/
/* READS THE RECORDS INTO AN ARRAY AND CLOSES THE FILE.         */
/****************************************************************/
ADDRESS MVS "EXECIO * DISKR "VSAMLIST" (STEM DD1IN. FINIS "
IF RC ¬= 0  THEN DO
   Say "File I/O error on DD VSAMLIST"
   zispfrc = 16
   ADDRESS ISPEXEC 'VPUT (zispfrc)'
   Exit
END

IF DD1IN.0 = 0  THEN DO
   Say "VSAMLIST Dataset is empty "
END
/****************************************************************/
/* build report heading for sysprint & master report            */
/* output report heading for sysrint                            */
/****************************************************************/
CALL BUILD_MSTR_RPT
Say '          EXCESSIVE EXTENTS / EXCESSIVE GIG REPORT        '||DATE()
Do i = 2 to MSTRPT.0
  SAY MSTRPT.i
END
Return(0)

/****************************************************************/
/* PROCESSES THE ARRAY CONTAINING THE LISTCAT ENTRIES           */
/****************************************************************/
process_vsamlist:
migrat = 'n'
DSN = ''
CDSN = ''
NDSN = ''
EXTENTS = 0
HIALLOC = 0
HIUSED = 0
TRKS = 0
m = 0
lastdb2 = '1st'

DO i=1 to DD1IN.0
   /* PROCESS MIGRATED DATASETS */
   IF  'NONVSAM -' = substr(dd1in.i,2,9) THEN DO
       migrat = 'y'
       cdsn = substr(dd1in.i,18,44)
       cdsn = substr(cdsn,1,10)||'C'||substr(cdsn,12,33)
       cdsn = strip(cdsn)
       dsn = cdsn
       call get_ndsn
       ii = i + 1                        /*   read next line          */
       IF  'VOLSER------------MIGRAT' ¬= substr(dd1in.ii,9,24) THEN DO
           i = i + 1
           migrat = 'n'                    /* bypass seq file on DASD */
           dsn = ''
           cdsn = ''
           ndsn = ''
           pdsg = ''
           EXTENTS = 0
           HIALLOC = 0
           HIUSED = 0
           TRKS = 0
       END
       IF  'VOLSER------------MIGRAT' = substr(dd1in.ii,9,24) THEN DO
           /* process current DSN and info */
           CALL READ_HLIST_LINE
           CALL GIG_EXT_LIMIT
           i = i + 1
           migrat = 'n'
             /* initialize for next DSN */
             dsn = ''
             cdsn = ''
             ndsn = ''
             pdsg = ''
             EXTENTS = 0
             HIALLOC = 0
             HIUSED = 0
             TRKS = 0
       End
   END /* NONVSAM LOOP */

   /* PROCESS THE VSAM RECORDS                                        */
   IF  'CLUSTER--' = substr(dd1in.i,9,9) THEN DO
       cdsn = substr(dd1in.i,18,44)
       cdsn = strip(cdsn)
       If trace_prob = 'PROB' Then say 'Current DSN =' cdsn
       dsn = cdsn
       call get_ndsn
       ii = i + 1
       Do ii = ii to dd1in.0
          IF  'CLUSTER--' = substr(dd1in.ii,9,9) | ,
              'NONVSAM -' = substr(dd1in.ii,2,9) THEN DO
               /* process current DSN and info */
               /* say 'dsn is ' dsn          */
               /* say 'ext is ' extents      */
               /* say 'hi-a-rba is ' hialloc */
               /* say 'hi-u-rba is ' hiused  */
               /* say 'trks is ' trks        */

               CALL GIG_EXT_LIMIT
               /* initialize for next DSN */
               dsn = ''
               cdsn = ''
               ndsn = ''
               pdsg = ''
               EXTENTS = 0
               HIALLOC = 0
               HIUSED = 0
               TRKS = 0
               i = ii - 1
               leave
          END
          IF  'EXTENTS--' = substr(dd1in.ii,67,9) THEN DO
              EXTENTS = substr(dd1in.ii,87,4)
              EXTENTS = STRIP(EXTENTS,L,'-')
              iterate
          END
          IF  'HI-A-RBA--' = substr(dd1in.ii,38,10) THEN DO
              HIALLOC = substr(dd1in.ii,48,14)
              HIALLOC = STRIP(HIALLOC,L,'-')
              iterate
          END
          IF  'HI-U-RBA--' = substr(dd1in.ii,38,10) THEN DO
              HIUSED = substr(dd1in.ii,48,14)
              HIUSED = STRIP(HIUSED,L,'-')
              iterate
          END
          IF  'TRACKS--' = substr(dd1in.ii,67,8) THEN DO
              tracks = substr(dd1in.ii,80,11)
              tracks = STRIP(tracks,L,'-')
              trks = trks + tracks
              iterate
          END
       END /* DO II */
       IF ii > dd1in.0 THEN
          CALL GIG_EXT_LIMIT                 /* print the last record */
   END /* VSAM LOOP */
END /* MAIN DO LOOP */

Return(0)

/****************************************************************/
/* Read the next DSN in the input file                          */
/****************************************************************/
get_ndsn:

ndsn = ''
Do iin = i + 1  to DD1IN.0
   /* PROCESS MIGRATED DATASETS */
   IF  'NONVSAM -' = substr(dd1in.iin,2,9) THEN Do
       ndsn = substr(dd1in.iin,18,44)
       ndsn = substr(ndsn,1,10)||'C'||substr(ndsn,12,33)
       leave
   End

   /* PROCESS THE VSAM RECORDS */
   IF  'CLUSTER--' = substr(dd1in.iin,9,9) THEN Do
       ndsn = substr(dd1in.iin,18,44)
       ndsn = strip(ndsn)
       leave
   End
End

Return(0)

/****************************************************************/
/* For each HLQ it is gets the migrated datasets and reads      */
/* these records in to the hlinein. stem                        */
/* It obtains the 1st two HLQ's for the RPTMST dataset and      */
/* uses the same two HLQ's for the temporary dataset.           */
/* It adds a random number to the end if the dataset so several */
/* jobs on the same LPAR can run at the same time.              */
/* It then reads hlinein. stem and selects the valid records    */
/* to load into hline. stem.  Upon completion of the load       */
/* the stem hlinein. is dropped to release memory.              */
/****************************************************************/
GET_MIGRATED_DS:

hlq_2_nodes = ''
rptdd = listdsi("RPTMSTR" "FILE")
findper1 = pos('.',sysdsname)
IF findper1 > 0 Then Do
   hlq_2_nodes = substr(sysdsname,findper1+1,8)
   findper2 = pos('.',hlq_2_nodes)
   If findper2 > 0 Then Do
      hlq_2_nodes = substr(sysdsname,1, findper1 + findper2)
   End
End

rnum = random(1,9999)
udsn = hlq_2_nodes||'TEMP.R'||rnum
hlist = 'n'
x = msg(OFF)
"delete '"udsn"'"
x = msg(x)
"alloc da('"udsn"') new space(5,5) dsorg(ps)",
"recfm(f b a) lrecl(121) cylinders blksize(0)"
If rc ¬= 0 Then Do
   Say 'error allocating file for HLIST'
   zispfrc = 16
   ADDRESS ISPEXEC 'VPUT (zispfrc)'
   exit
End

Call bubble_sort
Do i = 1 to srthlq.0          /* for each HLQ - get migrated datasets */
  "HLIST DSN LEVEL("srthlq.i".DSNDBC) outdataset('"udsn"')"
   WAIT_PARM = '00000010'X
   ADDRESS LINKPGM "ILBOWAT0 WAIT_PARM"   /* give it time to complete */
End

"alloc fi(TMPHLST) da('"udsn"') shr reuse"
"execio * diskr TMPHLST (stem hlinein. finis)"
If rc ¬= 0 Then Do
   Say 'error reading file for TMPHLST'
   zispfrc = 16
   ADDRESS ISPEXEC 'VPUT (zispfrc)'
   exit
End
x = msg(OFF)
"delete '"udsn"'"
"free fi(TMPHLST)"
x = msg(x)


ii = 0
DO i = 1 to hlinein.0                        /* remove headings etc */
   dsndbc_chk = pos('.DSNDBC.',hlinein.i)
   If dsndbc_chk > 0 Then Do
      ii = ii + 1
      hline.ii = hlinein.i               /* load only valid records */
      hline.0  = ii
   END
END

DROP hlinein.                                        /* free memory */

RETURN(0)

/* --------------------------------------- */
/* Bubble sort the stem                    */
/* --------------------------------------- */
bubble_sort:
ix = 0
Do i = 1 to dd0in.0                                /* loads the array */
   If dsnhlq.i ¬= '' Then Do
      ix = ix + 1
      srthlq.ix = dsnhlq.i
      srthlq.0 = ix
   End
End

Do i = 1 to srthlq.0                               /* sorts the array */
   Do si = i+1 to srthlq.0
   If srthlq.i > srthlq.si Then Do
      holdcard = srthlq.si
      srthlq.si     = srthlq.i
      srthlq.i     = holdcard
      End
   End
End

Return

/****************************************************************/
/* READS THE HLIST INFO LINE FROM THE ARRAY                     */
/****************************************************************/
READ_HLIST_LINE:

/* initialize the values */
trks = 0
HIALLOC = 0
HIUSED = 0
TRKSPCTU = ?
EXTENTS = ?
TRKSUSED = 0

Stem = 'hline.'                           /* set up for Binary Search */
Find = cdsn
If hline.0 > 0 Then
   If migrat = 'y' Then DO
     IF DATATYPE(ARG(3),"N") THEN  Min=Arg(3); Else; Min= 1
     IF DATATYPE(ARG(4),"N") THEN  Max=Arg(4); Else; Max= VALUE(Stem"0")
     DO FOREVER
       Try = (Max + Min) % 2  /* start in middle */
       Now = VALUE(Stem||Try)
       If  '.DSNDBC.' = SUBSTR(hline.try,6,8) THEN DO
           mdsn = SUBSTR(hline.try,2,44)
           Now = strip(mdsn)
           IF Now = Find THEN Do
              trks = substr(hline.try,75,7)
              trks = strip(trks,l,0)
              leave
           End
       End
       IF Now > Find THEN    /* this cuts the range in 1/2   */
          Max = (Try - 1)
       Else
          Min = (Try + 1)

       IF Max < Min THEN
          return "0 "
     END
   END
RETURN(0)

/**********************************************************************/
/** Get Partitions for tablespace from sysibm catalog                 */
/**********************************************************************/
GIG_EXT_LIMIT:


pdsg = cdsg                                              /* prior DSG */
Parse var dsn hlq '.' data '.' cdbname '.' dsname '.' irest '.' arest
cdsg = hlq||'.'||data||'.'||cdbname||'.'||dsname'.'irest
cdbnmck = substr(cdbname,1,3)

/* BYPASS DSN - DB2 SYSTEM DATASETS*/
IF cdbnmck = 'DSN' | cdbnmck = 'DSQ' | cdbnmck = 'BMC' Then Do
   Return(0)
End

Parse var ndsn nhlq '.' ndata '.' ndbname '.' ndsname '.' nirest '.' ,
  narest
ndsg = nhlq||'.'||ndata||'.'||ndbname||'.'||ndsname'.'nirest

db2sys = ''
Do ie = 1 to dd0in.0
   If hlq = dsnhlq.ie Then Do
      db2sys = db2sys.ie
      dsnext = dsnext.ie
      End
      IF db2sys ¬ = '' Then leave
End

IF db2sys = '' Then Do
   Say "VSAMLIST - "||DSN ||' - NOT PART OF ANY DB2-SYSTEM REQUESTED'
   Return(0)
End

If db2sys ¬= lastdb2 Then Do         /* Only load internal tables when*/
   lastdb2 = ''                      /* if blank triggers a connect   */
   CALL CON_DISCON_DB2               /* HANDLE CONNECT/DISCONNECTS    */
   lastdb2 = db2sys                  /* DB2 system changes            */
   call get_sys_ixpart       /* load the dbname/tsname/tname/creator  */
                             /* and the max(parts)                    */
   call get_sys_ts           /* load the ts info to table             */
/* call get_sys_tspart          load the tsname/ixname to table       */
   call get_sys_tables       /* load the tsname, name, creator        */
   ADDRESS DSNREXX "DISCONNECT"
End

cylinders  = 0.0
gigs       = 0

/* compute cylinders                                                 */
If trks > 0 Then Do
   cylinders = TRUNC((trks/15),3)
   cylinders = FORMAT(cylinders,,1)
End

/**********************************************************/
/* get number of partitions to determine gig size limits  */
/**********************************************************/
/* check to see if dsn name is for index and get # of     */
/* partitions. If not found, check sysibm.systablespace.  */
IF hlq = lasthlq &  cdbname = lastdbnm & dsname = lastdsnm THEN
   NOP                       /* SKIP DB2 CALLS OF SAME DB AND TS/IX  */
ELSE
   DO
     index_flag = 'N'
     i1_fnd_flag = 'N'              /* IXSPACE found */
     i2_fnd_flag = 'N'              /* Tablespace found and NTABLES */
  /* i3_fnd_flag = 'N' */
     i4_fnd_flag = 'N'              /* table for IX found */
     i5_fnd_flag = 'N'              /* tablespace for IX found */
     TYPE = 'N'
     partitions = 0
     giglimit   = 2
     ntables = ''
     call check_sys_ixpart_tb     /* get the index/ts names and parts */
     lasthlq  = hlq
     lastdbnm = cdbname
     lastdsnm = dsname
  END

/* Else giglimit = 2                                                 */
/* Check Extents / giglimit                                          */
/* tracks for gigs                                                   */
   gig1 = 21840                                 /* 1 gigs is 1456 cyl*/
   gig2 = 43695                                 /* 2 gigs is 2913 cyl*/
   gig4 = 87390                                 /* 4 gigs is 5826 cyl*/
If giglimit = 1 then
   gigck = (21840 - 6552)                        /* 1 gig - .3 gig   */
If giglimit = 2 then
   gigck = (43695 - 6552)                        /* 3 gig - .3 gig   */
If giglimit = 4 then
   gigck = (87390 - 6552)                        /* 4 gig - .3 gig   */

If migrat = 'y' Then Do                   /* no datset info           */
    cylsused = ?
    gigused = ?
    overaloc = ' '
End

If migrat = 'n' Then Do                   /* only for active datasets */
/* compute % trks used of allocated                                   */
   hia = hialloc
   hiu = hiused
   trkspctu = TRUNC((hiu / (hia / 100)),3)
   trkspctu = FORMAT(trkspctu,,1)

   /* compute actual trks used of allocated                           */
   If hiu = hia Then
      trksused = trks
   else
      trksused = TRUNC(((hiu / hia) * trks),1)

   cylsused = 0
   If 1 = datatype(trksused,n) Then do
      If trksused > 0 Then Do
         cylsused = TRUNC((trksused/15),3)
         cylsused = FORMAT(cylsused,,1)
      end
   end

   overaloc = ' '
   If 1 = DATATYPE(TRKSPCTU,N) Then
      If CYLINDERS >= 200 Then
         If TRKSPCTU <= 50 Then
            overaloc = '@'

   /* compute % of gigslimit used                                    */
   /* a 3390 blk is 56664 bytes however DB2 will only use            */
   /* 12 4k blks or 12 * 4096 = 49152 bytes of use able space        */
   IF 1 = DATATYPE(TRKSUSED,N) THEN Do
      gigused = TRUNC(((trksused * 49152)/1073741824),3)
      gigused = FORMAT(gigused,,2)
   End
End

prnt = 'N'
skipprt = 'N'
z = ''
m = m + 1
y = left(dsn,43) || overaloc ||right(cylinders,8) || right(extents,4),
    || right(cylsused,8) || right(trkspctu,6) || right(gigused,6) ||,
    right(giglimit,2)

Parse var dsn hlq '.' data '.' dbd '.' spname '.' inum '.' anum
    ixpartno = strip(ixpartno)
    IF ixpartno = 0 Then
       iy = '--             '
    ELSE DO
       iy = '--IX Parts: '||left(ixpartno,3)
       END
    IF ctsname = spname Then
       iy = iy ||'             '
    ELSE DO
       iy = iy ||' TS: '||left(ctsname,8)
       END

    tspartno = strip(tspartno)
    IF type = 'N' & tspartno = 0 then
       Z = iy
    IF type = 'N' & tspartno > 0 then
       Z = iy ||'                TS parts: '||tspartno
    IF type = 'L' & tspartno = 0 then
       Z = iy ||' Type: Large'
    IF type = 'L' & tspartno > 0 then
       Z = iy ||'   Type: Large    TS parts: '||tspartno

    DSGROUP  = ''
    If index_flag = 'N' Then Do                /* THIS IS A TS       */
       If tspartno > 0 Then                    /* PARTITIONED TS     */
          If trksused >= gigck | extents > 225 Then
             z = substr(z,1,76) || '!!!'
       If tspartno = 0 Then Do                 /* NON PARTITIONED TS */
          If cdsg = pdsg Then Do               /* PRINT MUTLI DGS ON */
             Z = z ||'   TS in DSG'
             DSGROUP  = 'DSG'
             /* New eye catcher for critical problems */
             If extents > 225 Then
                z = substr(z,1,76) || '!!!'
          End
          If cdsg = ndsg Then Do                /* PRINT MUTLI DGS ON */
             Z = z ||'   TS in DSG'
             DSGROUP  = 'DSG'
          End

          If cdsg = pdsg | cdsg = ndsg Then   /* already been handled */
             nop
          Else
             /* New eye catcher for critical problems */
             /* REALLY NEED TO READ THE NEXT DSN AND SEE IF IT IS     */
             /* PART OF A DSG - THEN DON'T REPORT                     */
             If extents > 225 Then
                z = substr(z,1,76) || '!!!'
       End
    End

    If index_flag = 'Y' Then Do                /* THIS IS A IX       */
       If ixpartno > 0 Then                    /* PARTITIONED IX     */
          /* New eye catcher for critical problems */
          If trksused >= gigck | extents > 225 Then
             z = substr(z,1,76) || '!!!'

       If ixpartno = 0 Then Do                 /* NON PARTITIONED IX */
          If cdsg = pdsg Then Do               /* PRINT MUTLI DGS ON */
             Z = z ||'   IX in DSG'
             DSGROUP  = 'DSG'
             /* New eye catcher for critical problems */
             If extents > 225 Then
                z = substr(z,1,76) || '!!!'
          End
          If cdsg = ndsg Then Do                /* PRINT MUTLI DGS ON */
             Z = z ||'   IX in DSG'
             DSGROUP  = 'DSG'
           End

          If cdsg = pdsg | cdsg = ndsg Then   /* already been handled */
             nop
          Else
             /* New eye catcher for critical problems */
             If extents > 225 Then
                z = substr(z,1,76) || '!!!'
       End
    End

/* produce the full master report                                     */
    If index_flag = 'N' THEN                    /* THIS IS A TS       */
       stype ='TS'
    Else
       stype ='IX'

/** BYPASS THE MASTER REPORT FOR ORPHANS **/
If i1_fnd_flag = 'N' & i2_fnd_flag = 'N' Then
   Do
      z = '-- This DB/TS not found in the DB2 Catalog- '||,
          'check for orphaned/obsolete VSAM dataset'
      prnt = 'Y'
   End
ELSE
   Do
      r = r+1
      If stype ¬= 'TS' Then ntables = ''
      If stype = 'TS' Then Do
         If anum ¬= 'A001' Then ntables = ''
      End

      MSTRPT.r = y || '  ' ||left(lparnm,9) ||left(db2sys,5) ||,
      left(dbd,9) || left(spname,9) || left(stype,4) || left(cdate,11),
      || right(ntables,4) || right(dsgroup,4) ||' '|| left(customer,12),
      || left(ln_mgr_2,14) || left(dept,6) || left(ibm_div,5),
      || left(envir_typ,8) || left(serv_off,9) || 'MF ' || 'DB2UDB '

      MSTRPT.0 = r

      If z ¬= '' Then Do        /* if blank - skip priniting the line */
         r = r+1
         MSTRPT.r = Z
         MSTRPT.0 = r
      End
   End
/* produce the exception report                                       */
/* compare the current record to the next record looking for a DSG    */
/* DSG is a dataset group - mutilple Datasets for a TS or IX          */

If index_flag = 'N' THEN                        /* THIS IS A TS       */
   If tspartno = 0 Then                       /* NON PARTITIONED TS   */
      If cdsg = ndsg then skipprt = 'Y'       /* skip the dsn in DSG  */

If index_flag = 'Y' THEN                        /* THIS IS A IX       */
   If ixpartno = 0 Then                       /* NON PARTITIONED IX   */
      If cdsg = ndsg then skipprt = 'Y'       /* skip the dsn in DSG  */

If extents >= dsnext then
   prnt = 'Y'
ELSE
   DO
     If index_flag = 'N' THEN DO                /* THIS IS A TS     */
        If tspartno > 0 THEN                    /* PARTITIONED TS   */
           If trksused >= gigck THEN
              prnt = 'Y'
     End
     ELSE DO                                    /* THIS IS A IX     */
       If ixpartno > 0 THEN                     /* PARTITIONED IX   */
          If trksused >= gigck THEN
             prnt = 'Y'
       End
   End

If skipprt = 'N'  & prnt = 'Y' then do
   SAY y
   SAY z
   If trksused >= gigck Then
      SAY '-- !! The above dataset needs immediate attention due to' ||,
          ' gig limit !!'
   If extents > 225 Then
      SAY '-- !! The above dataset needs immediate attention due to' ||,
          ' extents !!'
   prnt = 'N'
   skipprt = 'N'
End

RETURN(0)
/**********************************************************************/
/*  Get NUMBER OF Partitions for indexspace from sysibm catalog       */
/**********************************************************************/
/*  Builds arrays or tables by using stems.  This done so the DB2     */
/*  Catalog is read only once instead of thousands of times.          */
/*                                                                    */
/*  If dataset name not found on sysibm.sysindexpart catalog tbl,     */
/*  then see if name is for tablespace                                */
/*  ELSE see if name is on systablepart to determine tablespace       */
/*  name for index.   The space ¬= -1 is for SAP TS/IX define NO.     */
/**********************************************************************/
get_sys_ixpart:
sqlstmt1 = "SELECT B.DBNAME, B.TBNAME, B.TBCREATOR, B.INDEXSPACE,"||,
           " MAX(A.PARTITION)"||,
           " FROM SYSIBM.SYSINDEXPART A, SYSIBM.SYSINDEXES B"||,
           " WHERE DBNAME NOT LIKE 'DSN%'"||,
           " AND A.IXNAME = B.NAME"||,
           " AND A.SPACE ¬= -1"||,
           " GROUP BY B.DBNAME, B.TBNAME, B.TBCREATOR, B.INDEXSPACE"||,
           " ORDER BY B.DBNAME, B.INDEXSPACE WITH UR"

ADDRESS DSNREXX "EXECSQL DECLARE C1 CURSOR FOR S1"
If sqlcode \= 0 then
   call prtsqlca "DECLARE C1 FOR S1"

ADDRESS DSNREXX "EXECSQL PREPARE S1 FROM :SQLSTMT1"
If sqlcode \= 0 then
  call prtsqlca "PREPARE S1 FROM :SQLSTMT1"

ADDRESS DSNREXX "EXECSQL OPEN C1"
If sqlcode \= 0 then
   call prtsqlca "OPEN C1"

i1 = 0
Do Until sqlcode \= 0
 ADDRESS DSNREXX "EXECSQL FETCH C1 INTO :dbname, :tbname,"||,
                 " :tbcreator, :ixspace, :partition"
  If SQLCODE¬=100 Then Do
     i1 = i1 +1
     dbname1.i1 = strip(dbname)
     dbname1.0 = i1
     tbname1.i1 = strip(tbname)
     tbname1.0 = i1
     tbcreator1.i1 = strip(tbcreator)
     tbcreator1.0 = i1
     ixspace1.i1 = strip(ixspace)
     ixspace1.0 = i1
     ixpart1.i1 = strip(partition)
     ixpart1.0 = i1
  END
END

If SQLCODE=0 | SQLCODE=100 Then Do              /* PROCESSED ALL ROWS */
     nop
   End
ELSE call prtsqlca "FETCH ERROR ON - C1"

ADDRESS DSNREXX "EXECSQL CLOSE C1"
If SQLCODE\=0 Then call prtsqlca "CLOSE C1"

Return(0)

/**********************************************************************/
/*  Get NUMBER OF Partitions for indexspace from internal tables      */
/*  This data has been put into a REXX table                          */
/*  dbname1.i1  - dbname                                              */
/*  tbname1.i1  - tbname                                              */
/*  tbcreator1.i1  - tbcreator                                        */
/*  ixspace1.i1 - actual index space name (8 bytes) - in VSAM DSN name*/
/*  ixpart1.i1  - max parts                                           */
/*  If dataset name not found on sysibm.sysindexpart catalog tbl,     */
/*  then see if name is for tablespace                                */
/*  ELSE see if name is on systablepart to determine tablespace       */
/*  name for index.                                                   */
/**********************************************************************/
check_sys_ixpart_tb:

ctsname  = '        '
type = 'N'
ixpartno = 0
tspartno = 0
i1_fnd_flag = 'N'

Stem2a = 'dbname1.'                 /* set up and call Binary Search */
Find2a = cdbname
Stem2b = 'ixspace1.'
Find2b = dsname
Call Bsearch2    /* match dbname1.i1 = cdbname & ixspace1.i1 = dsname */

If result = 1 Then
     Do
       i1_fnd_flag = 'Y'
       ixpartno = ixpart1.try
       TYPE = 'N'
    /* call check_sys_tspart_tb       arf 08/17/03 */
       call check_sys_index_tb
       call check_sys_ts_tb
     End

If i1_fnd_flag = 'N' Then
   Do
     giglimit = 2
     ctsname = dsname
     call check_sys_ts_tb                            /* see if ts     */
   End

Return(0)

/**********************************************************************/
/*  Get Partitions for tablespace from sysibm catalog                 */
/*  Builds arrays or tables by using stems.  This is done so the DB2  */
/*  Catalog is read only once instead of thousands of times.          */
/**********************************************************************/
/*  If tablespace not found, then gig limit = 2. This can happen      */
/*  when index name is > 8 characters on catalog (sysindexpart).      */
/*  for example data propogator indexes can be 14 bytes long          */
/*  The space ¬= -1 is for SAP TS/IX define NO.                       */
/**********************************************************************/
get_sys_ts:

/* sqlstmt2 = "SELECT DBNAME, NAME, PARTITIONS, NTABLES, TYPE "||,    */
/*           " FROM SYSIBM.SYSTABLESPACE "||,                         */
/*           " WHERE DBNAME NOT LIKE 'DSN%'"||,                       */
/*           " ORDER BY DBNAME, NAME, PARTITIONS WITH UR"             */

sqlstmt2 = "SELECT DBNAME, NAME, PARTITIONS, NTABLES, TYPE"||,
           " FROM SYSIBM.SYSTABLESPACE"||,
           " WHERE DBNAME IN (SELECT DBNAME FROM SYSIBM.SYSTABLEPART"||,
           " WHERE SPACE ¬= -1 AND DBNAME NOT LIKE 'DSN%')"||,
           " ORDER BY DBNAME, NAME, PARTITIONS WITH UR"

ADDRESS DSNREXX "EXECSQL DECLARE C2 CURSOR FOR S2"
If sqlcode \= 0 then
   call prtsqlca "DECLARE C2 FOR S2"

ADDRESS DSNREXX "EXECSQL PREPARE S2 FROM :SQLSTMT2"
If sqlcode \= 0 then
  call prtsqlca "PREPARE S2 FROM :SQLSTMT2"

ADDRESS DSNREXX "EXECSQL OPEN C2"
If sqlcode \= 0 then
   call prtsqlca "OPEN C2"

i2 = 0
Do Until sqlcode \= 0
 ADDRESS DSNREXX "EXECSQL FETCH C2 INTO :ts_dbname, :ts_name, "||,
                 ":partitions, :ntables, :type"
  If SQLCODE¬=100 Then Do
     i2 = i2 +1
     dbname2.i2 = strip(ts_dbname)
     dbname2.0 = i2
     tsname2.i2 = strip(ts_name)
     tsname2.0 = i2
     part2.i2 = strip(partitions)
     part2.0 = i2
     ntables2.i2 = strip(ntables)
     ntables2.0 = i2
     type2.i2 = strip(type)
     type2.0 = i2
  END
END

If SQLCODE=0 | SQLCODE=100 Then Do              /* PROCESSED ALL ROWS */
     nop
   End
ELSE call prtsqlca "FETCH ERROR ON - C2"

ADDRESS DSNREXX "EXECSQL CLOSE C2"
If SQLCODE\=0 Then call prtsqlca "CLOSE C2"

Return(0)
/**********************************************************************/
/*  Get Partitions for tablespace from internal tables.               */
/*  If tablespace not found, then gig limit = 2. This can happen      */
/*  when index name is > 8 characters on catalog (sysindexpart).      */
/*  for example data propogator indexes can be 14 bytes long          */
/**********************************************************************/
check_sys_ts_tb:

i2_fnd_flag = 'N'


Stem2a = 'dbname2.'                 /* set up and call Binary Search */
Find2a = cdbname
Stem2b = 'tsname2.'
Find2b = ctsname
Call Bsearch2    /* match dbname2.i2 = cdbname & tsname2.i2 = ctsname */
If result = 1 Then
   Do
     i2_fnd_flag ='Y'
   End


If i2_fnd_flag = 'N' then
     giglimit = 2                                          /* default */
   Else
      Do /* process match             */
        tspartno = part2.try
        ntables = ntables2.try
        TYPE = type2.try
        IF TYPE ¬= 'L' THEN TYPE = 'N'
        /***************************************************/
        /*** Check Gig Limits                            ***/
        /*** TYPE 'L' (LARGE TS) 4 GIG dataset size limit***/
        /*** 1 partition = 2 Gig dataset size limit      ***/
        /*** 1-16 partitions = 4 Gig dataset size limit  ***/
        /*** 17-32 partitions = 2 Gig dataset size limit ***/
        /*** 33-64 partitions = 1 Gig dataset size limit ***/
        /***************************************************/
        IF index_flag = 'N' THEN DO
            SELECT
              WHEN TYPE = 'L' THEN GIGLIMIT = 4
              WHEN tspartno = 0  then giglimit = 2
              WHEN tspartno < 17 then giglimit = 4
              WHEN tspartno < 33 then giglimit = 2
              WHEN tspartno < 65 then giglimit = 1
              OTHERWISE giglimit = 2
            END
           END
         ELSE
           DO
           SELECT
             WHEN TYPE = 'L' THEN GIGLIMIT = 4
             WHEN ixpartno = 0  then giglimit = 2
             WHEN ixpartno < 17 then giglimit = 4
             WHEN ixpartno < 33 then giglimit = 2
             WHEN ixpartno < 65 then giglimit = 1
             OTHERWISE giglimit = 2
           END
           END
      END

Return(0)
/**********************************************************************/
/*  Get tablespace name from sysibm.systablepart                      */
/**********************************************************************/
/*  Builds arrays or tables by using stems.  This done so the DB2     */
/*  Catalog is read only once instead of thousands of times.          */
/**********************************************************************/
/*  If dataset name not found on sysibm.systablepart catalog tbl,     */
/*  then index is non partitioned. find index tablespace name by      */
/*  by reading sysindexes to get index tabl name. read systables      */
/*  using tablname to get tablespace name.                            */
/*  The space ¬= -1 is for SAP TS/IX define NO.                       */
/**********************************************************************/
get_sys_tspart:

sqlstmt3 = "SELECT DISTINCT(TSNAME) FROM SYSIBM.SYSTABLEPART"||,
           " WHERE DBNAME NOT LIKE 'DSN%'"||,
           " AND IXNAME ¬= ''"||,
           " AND   SPACE ¬= -1"||,
           " ORDER BY TSNAME WITH UR"

ADDRESS DSNREXX "EXECSQL DECLARE C3 CURSOR FOR S3"
If sqlcode \= 0 then
   call prtsqlca "DECLARE C3 FOR S3"

ADDRESS DSNREXX "EXECSQL PREPARE S3 FROM :SQLSTMT3"
If sqlcode \= 0 then
  call prtsqlca "PREPARE S3 FROM :SQLSTMT3"

ADDRESS DSNREXX "EXECSQL OPEN C3"
If sqlcode \= 0 then
   call prtsqlca "OPEN C3"

i3 = 0
Do Until sqlcode \= 0
 ADDRESS DSNREXX "EXECSQL FETCH C3 INTO :tsname "
  If SQLCODE¬=100 Then Do
     i3 = i3 + 1
     tsname3.i3 = strip(tsname)
     tsname3.0 = i3
 /*  ixname3.i3 = strip(ixname) */
 /*  ixname3.0 = i3 */
  END
END

If SQLCODE=0 | SQLCODE=100 Then Do              /* PROCESSED ALL ROWS */
     nop
   End
ELSE call prtsqlca "FETCH ERROR ON - C3"

ADDRESS DSNREXX "EXECSQL CLOSE C3"
If SQLCODE\=0 Then call prtsqlca "CLOSE C3"

Return(0)

/**********************************************************************/
/*  Get tablespace name from sysibm.systablepart- now in internal tbl */
/*  If dataset name not found on sysibm.systablepart catalog tbl,     */
/*  then index is non partitioned. find index tablespace name by      */
/*  by reading sysindexes to get index tabl name. read systables      */
/*  using tablname to get tablespace name.                            */
/**********************************************************************/
check_sys_tspart_tb:

i3_fnd_flag = 'N'


Stem = 'tsname3.'                    /* set up and call Binary Search */
Find = ctsname
Call Bsearch                         /* match tsname3.i3 = ctsname    */
If result = 1 Then
   Do
     i3_fnd_flag = 'Y'
   End

If i3_fnd_flag = 'N' Then
   call check_sys_index_tb

/**********************************************************************/
/*  call sysibm.systablespace for indexes and ts datasets to deter-   */
/*  mine if ts is large designation. all partition on large ts        */
/*  automatically have four gig limit.                                */
/**********************************************************************/
call check_sys_ts_tb

Return(0)

/**********************************************************************/
/*  GET TABLENAME FOR INDEX FROM SYSINDEXES TABLE - now internal table*/
/*  If dataset name not found severe error.                           */
/*  ELSE use table name to get to tablespace name for index.          */
/**********************************************************************/
CHECK_SYS_INDEX_TB:

i4_fnd_flag = 'N'


Stem2a = 'dbname1.'                 /* set up and call Binary Search */
Find2a = cdbname
Stem2b = 'ixspace1.'
Find2b = dsname
Call Bsearch2    /* match dbname1.i1 = cdbname & ixspace1.i1 = dsname */
If result = 1 Then
     Do
       i4_fnd_flag = 'Y'
       index_flag = 'Y'
       tbname = tbname1.try
       tbcreator = tbcreator1.try
     End

If i4_fnd_flag = 'N' Then
   SAY 'NO SYSINDEX ROW FOUND FOR INDEXPART:' DSNAME cdbname
/*  call sysibm.systables to get tablespace name for index         */
    call check_sys_tables_tb

Return(0)

/**********************************************************************/
/*  GET TABLESPACE NAME FOR INDEX FROM SYSTABLES                      */
/*  Builds arrays or tables by using stems.  This done so the DB2     */
/*  Catalog is read only once instead of thousands of times.          */
/**********************************************************************/
/*  If TABLE name not found then error msg                            */
/*  ELSE SET VARIABLE FOR TSNAME                                      */
/*  The space ¬= -1 is for SAP TS/IX define NO.                       */
/**********************************************************************/
GET_SYS_TABLES:

/*sqlstmt5 = "SELECT TSNAME, NAME, CREATOR FROM SYSIBM.SYSTABLES "||, */
/*           "WHERE DBNAME NOT LIKE 'DSN%' "||,                       */
/*           "ORDER BY NAME, CREATOR WITH UR"                         */

sqlstmt5 = "SELECT TSNAME, NAME, CREATOR"||,
           " FROM SYSIBM.SYSTABLES"||,
           " WHERE DBNAME IN (SELECT DBNAME FROM SYSIBM.SYSTABLEPART"||,
           " WHERE SPACE ¬= -1 AND DBNAME NOT LIKE 'DSN%')"||,
           " ORDER BY NAME, CREATOR WITH UR"

ADDRESS DSNREXX "EXECSQL DECLARE C5 CURSOR FOR S5"
If sqlcode \= 0 then
   call prtsqlca "DECLARE C5 FOR S5"

ADDRESS DSNREXX "EXECSQL PREPARE S5 FROM :SQLSTMT5"
If sqlcode \= 0 then
  call prtsqlca "PREPARE S5 FROM :SQLSTMT5"

ADDRESS DSNREXX "EXECSQL OPEN C5"
If sqlcode \= 0 then
   call prtsqlca "OPEN C5"

i5 = 0
Do Until sqlcode \= 0
 ADDRESS DSNREXX "EXECSQL FETCH C5 INTO :tsname, :name, :creator"
  If SQLCODE¬=100 Then Do
     i5 = i5 + 1
     tsname5.i5 = strip(tsname)
     tsname5.0 = i5
     name5.i5 = strip(name)
     name5.0 = i5
     creator5.i5 = strip(creator)
     creator5.0 = i5
  END
END

If SQLCODE=0 | SQLCODE=100 Then Do              /* PROCESSED ALL ROWS */
     nop
   End
ELSE call prtsqlca "FETCH ERROR ON - C5"

ADDRESS DSNREXX "EXECSQL CLOSE C5"
If SQLCODE\=0 Then call prtsqlca "CLOSE C5"

Return(0)

/**********************************************************************/
/*  GET TABLESPACE NAME FOR INDEX FROM SYSTABLES                      */
/*  If TABLE name not found then error msg                            */
/*  ELSE SET VARIABLE FOR TSNAME                                      */
/**********************************************************************/
check_sys_tables_tb:

i5_fnd_flag = 'N'

Stem2a = 'name5.'                   /* set up and call Binary Search */
Find2a = tbname
Stem2b = 'creator5.'
Find2b = tbcreator
Call Bsearch2   /* match name5.i5 = tbname & creator5.i5 = tbcreator */

If result = 1 Then
     Do
       i5_fnd_flag = 'Y'
       ctsname=tsname5.try
     End

If i5_fnd_flag = 'N' Then
   SAY 'NO SYSTABLES ROW FOUND FOR INDEXED TABLE:' TBNAME

Return(0)

Bsearch: /* procedure expose Gl. */
/**********************************************************************/
/* Binary search a stem. Stem MUST be sorted                          */
/* Stem = Arg(1)  - Stem to look at                                   */
/* Find = Arg(2)  - What to look for                                  */
/* From = Arg(3)  - Where to start (default 1)                        */
/* To   = Arg(4)  - Where to stop  (default Stem.0)                   */
/*                                                                    */
/* Returns a string:                                                  */
/* Found Where Passes                                                 */
/* Found - 0/1 Did we find it?                                        */
/* Where - Where in the stem did we find it?                          */
/* Passes - How many passes (Remove this for speed, just for          */
/* demonstration)                                                     */
/*                                                                    */
/* This routine was ported from a QuickBasic Function by Ethan Winer  */
/* in his book "Basic Techniques an Utilities" ISBN 1-56276-008-4     */
/**********************************************************************/
IF DATATYPE(ARG(3),"N") THEN   Min = Arg(3) ; Else ; Min = 1
IF DATATYPE(ARG(4),"N") THEN   Max = Arg(4) ; Else ; Max= VALUE(Stem"0")
DO FOREVER
  Try = (Max + Min) % 2  /* start in middle */
  Now = VALUE(Stem||Try)
  IF Now = Find THEN
     return "1 "
  IF Now > Find THEN    /* this cuts the range in 1/2   */
     Max = (Try - 1)
  Else
     Min = (Try + 1)

  IF Max < Min THEN
     return "0 "
END
Return

Bsearch2: /* procedure expose Gl. */
/**********************************************************************/
/* Binary search a stem. Stem MUST be sorted                          */
/* Stem = Arg(1)  - Stem to look at                                   */
/* Stem = Arg(1a) - Stem2b to look at                                 */
/* Find = Arg(2)  - What to look for                                  */
/* Find = Arg(2a) - What to look for                                  */
/* From = Arg(3)  - Where to start (default 1)                        */
/* To   = Arg(4)  - Where to stop  (default Stem.0)                   */
/*                                                                    */
/* Returns a string:                                                  */
/* Found Where Passes                                                 */
/* Found - 0/1 Did we find it?                                        */
/* Where - Where in the stem did we find it?                          */
/* Passes - How many passes (Remove this for speed, just for          */
/* demonstration)                                                     */
/*                                                                    */
/* This routine was ported from a QuickBasic Function by Ethan Winer  */
/* in his book "Basic Techniques an Utilities" ISBN 1-56276-008-4     */
/**********************************************************************/
IF DATATYPE(ARG(3),"N") THEN   Min = Arg(3); Else; Min = 1
IF DATATYPE(ARG(4),"N") THEN   Max = Arg(4); Else; Max= VALUE(Stem2a"0")
DO FOREVER
  Try = (Max + Min) % 2  /* start in middle */
  Now2a = VALUE(Stem2a||Try)
  Now2b = VALUE(Stem2b||Try)
  IF Now2a = Find2a & Now2b = Find2b THEN
     return "1 "
  IF Now2a > Find2a  THEN    /* this cuts the range in 1/2   */
     Max = (Try - 1)
  IF Now2a < Find2a  THEN    /* this cuts the range in 1/2   */
     Min = (Try + 1)
  IF Now2a = Find2a Then     /* this cuts the range in 1/2   */
     If Now2b > Find2b Then
        Max = (Try - 1)
     Else
        Min = (Try + 1)

  IF Max < Min THEN
     return "0 "
END
Return

BUILD_MSTR_RPT:
/****************************************************************/
/* output master report heading                                 */
/****************************************************************/
MSTRPT.1  = '             FULL EXTENTS / GIG REPORT           '||DATE()
MSTRPT.2  = ' '
MSTRPT.3  = '*******************************************************'
MSTRPT.4  = '* Check Gig Limits, Report Logic Flow:                *'
MSTRPT.5  = '*                                                     *'
MSTRPT.6  = '* Retrieve underlying VSAMs for Tablespace/Indexspace *'
MSTRPT.7  = '* from MVS catalog and use to drive program           *'
MSTRPT.8  = '* computations for DB2 size limitations on report.    *'
MSTRPT.9  = '*                                                     *'
MSTRPT.10 = '*  o  Print DSNs where extents >= extent limit parm   *'
MSTRPT.11 = '*  o  Print DSNs where space used >= giglimit - .3    *'
MSTRPT.12 = '*     for TS/IX that are partitioned                  *'
MSTRPT.13 = '*  o  TS/IX that are NOT partitioned will not be      *'
MSTRPT.14 = '*     reported on gig due DB2 being able to allocate  *'
MSTRPT.15 = '*     another DS.  It will be reported TS/IX in DSG   *'
MSTRPT.16 = '*                                                     *'
MSTRPT.17 = '* IF THE DATASET IS MIGRATED THEN THE EXTENTS = ?     *'
MSTRPT.18 = '* AND CYLINDERS USED = ? - INFO IS UNAVAILABLE.       *'
MSTRPT.19 = '*                                                     *'
MSTRPT.20 = '* AN @ IN COLUMN 44 INDICATES THAT THE DATASET IS     *'
MSTRPT.21 = '* PROBABLY GROSSLY OVER ALLOCATED -                   *'
MSTRPT.22 = '* TRKS % USED <= 50% AND CYLINDERS > 200              *'
MSTRPT.23 = '*                                                     *'
MSTRPT.24 = '* AN !!! IN COLUMN 77 IS INTENDED TO BE AN EYE CATCHER*'
MSTRPT.25 = '* FOR CRITICAL PROBLEMS THAT NEED ATTENTION NOW!      *'
MSTRPT.26 = '*   Partitioned space used is >= gig limit - .3       *'
MSTRPT.27 = '*   or extents > 225                                  *'
MSTRPT.28 = '*                                                     *'
MSTRPT.29 = '* Establish gig limit for DSN based on these scenarios*'
MSTRPT.30 = '* (in order of precedence):                           *'
MSTRPT.31 = '*                                                     *'
MSTRPT.32 = '* 1) Indexspace built on LARGE Tablespace Designation *'
MSTRPT.33 = '*    (4 Gig Limit)                                    *'
MSTRPT.34 = '* 2) Indexspace Non-Partitioned on Partitioned TS     *'
MSTRPT.35 = '*    (Use Partition Gig Limit Range below)            *'
MSTRPT.36 = '* 3) Indexspace Partitioned on Partitioned TS         *'
MSTRPT.37 = '*    (Use Partition Gig Limit Range below)            *'
MSTRPT.38 = '* 4) Indexspace Non-partitioned on Non-partitioned TS *'
MSTRPT.39 = '*    (2 Gig Limit)                                    *'
MSTRPT.40 = '*                                                     *'
MSTRPT.41 = '* 5) Tablespace w/LARGE Tablespace Designation        *'
MSTRPT.42 = '*    (4 Gig Limit)                                    *'
MSTRPT.43 = '* 6) Tablespace Non-Partitioned                       *'
MSTRPT.44 = '*    (2 Gig Limit)                                    *'
MSTRPT.45 = '* 7) Tablespace Partitioned                           *'
MSTRPT.46 = '*    (Use Partition Gig Limit Range below)            *'
MSTRPT.47 = '* 8) No Indexspace/Tablespace found (indexname>8 char)*'
MSTRPT.48 = '*    (2 Gig Limit)                                    *'
MSTRPT.49 = '*                                                     *'
MSTRPT.50 = '* Only print when                                     *'
MSTRPT.51 = '*   IX Part: > 0                                      *'
MSTRPT.52 = '*   TS Part: > 0                                      *'
MSTRPT.53 = '* On a non partitioned TX/IX with multiple DS.        *'
MSTRPT.54 = '*   TS in DSG                                         *'
MSTRPT.55 = '*   IX in DSG                                         *'
MSTRPT.56 = '* TS name added under each index                      *'
MSTRPT.57 = '*                                                     *'
MSTRPT.58 = '*   -------- PARTITION GIG LIMIT RANGES ---------     *'
MSTRPT.59 = '*   -- from SQL Reference, Appendix DB2 Limits --     *'
MSTRPT.60 = '*                                                     *'
MSTRPT.61 = '*   Type=L (LARGE TS)   4 Gig DS size limit           *'
MSTRPT.62 = '*   Non (0) partition   2 Gig DS size limit           *'
MSTRPT.63 = '*                                                     *'
MSTRPT.64 = '* The following means all parts 1-16 limited to 4 GIG *'
MSTRPT.65 = '*   1-16 partitions     4 Gig DS size limit           *'
MSTRPT.66 = '* The following means all parts 1-32 limited to 2 GIG *'
MSTRPT.67 = '*   17-32 partitions    2 Gig DS size limit           *'
MSTRPT.68 = '* The following means all parts 1-64 limited to 1 GIG *'
MSTRPT.69 = '*   33-64 partitions    1 Gig DS size limit           *'
MSTRPT.70 = '*******************************************************'
MSTRPT.71 = '*                                                     *'
MSTRPT.72 = '* Exception Report is only produced when TS/IX        *'
MSTRPT.73 = '* partitioned and space used is >= gig limit - .3 or  *'
   r = 73
IF dsnext1 ¬ = '' Then Do
   r = r+1
   MSTRPT.r  = '* FOR HLQ of 'left(dsnhlq.1,4)'                      ',
   '              *'
   r = r+1
   MSTRPT.r  = '*   Extents > 'left(dsnext.1,4)'                     ',
   '              *'
END
Do ie = 2 to DD0IN.0
   IF dsnext2 ¬ = '' Then Do
      r = r+1
      MSTRPT.r  = '* FOR HLQ of 'left(dsnhlq.ie,4)'                  ',
      '                  *'
      r = r+1
      MSTRPT.r  = '*   Extents > 'left(dsnext.ie,4)'                 ',
      '                  *'
   End
End

r = r+1
MSTRPT.r  = '*******************************************************'
r = r+1
MSTRPT.r  = ' '
r = r+1
MSTRPT.r  = '---------------------------------------------------------',
            ||'----------------------'
r = r+1
MSTRPT.r  = 'DATASET NAME                                  ALLOC      ',
            ' CYLS   %   %GIGS GIG'
r = r+1
MSTRPT.r  = '                                              CYLS   EXTS',
            ' USED  USED  USED LMT'
r = r+1
MSTRPT.r  = '---------------------------------------------------------',
            ||'----------------------'
MSTRPT.0 = r

Return(0)

/****************************************************************/
/* ALLOCATES AND WRITE OUT THE MASTER REPORT FILE               */
/****************************************************************/
OUT_MSTR_RPT:
If m = 0 Then Do
   r = r+1
   MSTRPT.r = 'No requested datasets contain extents  >= requested'
   r = r+1
   MSTRPT.r = '-OR- no requested dsns over gig limit - .3'
   MSTRPT.0 = r
END

ADDRESS MVS "EXECIO "r" DISKW "RPTMSTR" (STEM MSTRPT. FINIS "
IF RC ¬= 0  THEN DO
   Say "File I/O error on DD RPTMSTR"
   zispfrc = 16
   ADDRESS ISPEXEC 'VPUT (zispfrc)'
   Exit
END

Return(0)

/**********************************************************************/
/* gets the maint info depending on the DB2 subsystem                 */
/**********************************************************************/
get_maint_info:

db2sys = db2sysck
lastdb2 = ''                         /* if blank triggers a connect   */
CALL CON_DISCON_DB2                  /* HANDLE CONNECT/DISCONNECTS    */
call get_reorg_tb_generic
ADDRESS DSNREXX "DISCONNECT"

Return(0)

/**********************************************************************/
/* REORG TABLESPACES-                                                 */
/**********************************************************************/
/* MONITOR CLUSTERING LEVEL- NON-CLUSTERED DATA FOR CLUSTERING IX     */
/* NOTE: CLUSTERRATIO < 80 % SEQUENTIAL PREFETCH IS NOT USED TO       */
/*       ACCESS THE DATA PAGES, TARGETING < 90.                       */
/* NOTE: IBM RECCOMMENDATION REORG IF < 90%                           */
/**********************************************************************/
get_reorg_tb_generic:

s1 = "SELECT T.DBNAME, T.TSNAME, I.CREATOR, I.NAME,"
s2 = " I.CLUSTERED, I.CLUSTERING, I.CLUSTERRATIO, T.CARD,"
s3 = " I.NLEAF, I.NLEVELS, DATE(I.STATSTIME)"
s4 = " FROM SYSIBM.SYSINDEXES I, SYSIBM.SYSTABLES T"
s5 = " WHERE I.CLUSTERING = 'Y' AND I.CLUSTERED = 'N'"
s6 = " AND I.CLUSTERRATIO < 80 AND CLUSTERRATIO > 0"
s7 = " AND I.TBCREATOR = T.CREATOR AND I.TBNAME = T.NAME"
s8 = " AND T.CREATOR NOT IN ('SYSIBM') AND T.DBNAME NOT IN ('PLANDB')"
s9 = " AND T.DBNAME NOT LIKE 'BMC%'"
s10 = " ORDER BY I.CREATOR, T.DBNAME, T.TSNAME WITH UR"

sqlstmt10 = s1||s2||s3||s4||s5||s6||s7||s8||s9||s10
ADDRESS DSNREXX "EXECSQL DECLARE C10 CURSOR FOR S10"
If sqlcode \= 0 then
   call prtsqlca "DECLARE C10 FOR S10"

ADDRESS DSNREXX "EXECSQL PREPARE S10 FROM :sqlstmt10"

If sqlcode \= 0 then
  call prtsqlca "PREPARE S10 FROM :sqlstmt10"

ADDRESS DSNREXX "EXECSQL OPEN C10"
If sqlcode \= 0 then
   call prtsqlca "OPEN C10"

/* WRITE REPORT HEADING                                               */
say ''
say ''
say s1
say s2
say s3
say s4
say s5
say s6
say s7
say s8
say sgs
say s9
say ''
say '******************************************************************'
say 'REORG TABLESPACES                                                 '
say '**generic*********************************************************'
say ''
say "                                     "||db2sysck||"   ",
|| "                    "||DATE()
say "------------------------------------------------------",
||"-------------------------"
say "                 |                |CLUSTER  |         ",
||"|         | N |           "
say "      TS         |   CLUST_IX     |R% ED ING|  CARD   ",
||"|  NLEAF  |LVL|STATSDATE "
say "------------------------------------------------------",
||"-------------------------"
/* END REPORT HEADING                                                 */

cnt = 0
Do Until sqlcode \= 0
 ADDRESS DSNREXX "EXECSQL FETCH C10 INTO :DBNAME, :TSNAME, :CREATOR,"||,
     ":NAME, :CLUSTERED, :CLUSTERING, :CLUSTERRATIO, :CARD,"||,
     ":NLEAF, :NLEVELS, :STATSDATE"


  /* WRITE REPORT                                                     */
  If SQLCODE¬=100 Then Do
    cnt = cnt + 1
    ts = strip(DBNAME)||'.'||strip(TSNAME)
    ix = strip(CREATOR)||'.'||strip(NAME)
    card = format(CARD,10,0,)
    y = left(ts,18) || left(ix,17) || right(CLUSTERRATIO,3) ||,
    right(CLUSTERED,2)  || right(CLUSTERING,3) ||,
    right(CARD,11)  || right(NLEAF,10) ||,
    right(NLEVELS,3) || right(STATSDATE,12)
    say y
  END
END

If SQLCODE=0 | SQLCODE=100 Then                 /* PROCESSED ALL ROWS */
   say ' row count = ' cnt
ELSE call prtsqlca "ERROR ON - C10"

ADDRESS DSNREXX "EXECSQL CLOSE C10"
If SQLCODE\=0 Then call prtsqlca "CLOSE C10"

Return(0)

/**********************************************************************/
/* handles the connecting and disconnecting to DB2                    */
/**********************************************************************/
con_discon_db2:

If lastdb2 = '' Then Do
   call connect_rexx_sql
   lastdb2 = db2sys
   End
ELSE DO
   ADDRESS DSNREXX "DISCONNECT"
   CALL CONNECT_REXX_SQL
End

Return(0)

/**********************************************************************/
/* Set up REXX/SQL environment                                        */
/**********************************************************************/
connect_rexx_sql:
ADDRESS TSO "SUBCOM DSNREXX"
If rc =1 Then
   S_RC = RXSUBCOM('ADD','DSNREXX','DSNREXX')     /* ADD HOST CMD ENV */
Else
  If rc = 0 Then
     nop
  Else Do
    Say 'Can not access DB2 Rexx Function.  Ending...rc =' rc
    zispfrc = 99
    ADDRESS ISPEXEC 'VPUT (zispfrc)'
    Exit
  End

ADDRESS DSNREXX "CONNECT" DB2SYS
If sqlcode \= 0 then call prtsqlca 'connect'

Return(0)

/* PRINT ERROR                                                        */
PRTSQLCA:

TRACE O
say '** Error SQL statement - ' arg(1)
say 'SQLCODE ='SQLCODE
say 'SQLERRMC ='SQLERRMC
say 'SQLERRP ='SQLERRP
say 'SQLERRD ='SQLERRD.1',',
            || SQLERRD.2',',
            || SQLERRD.3',',
            || SQLERRD.4',',
            || SQLERRD.5',',
            || SQLERRD.6

say 'SQLWARN ='SQLWARN.0',',
            || SQLWARN.1',',
            || SQLWARN.2',',
            || SQLWARN.3',',
            || SQLWARN.4',',
            || SQLWARN.5',',
            || SQLWARN.6',',
            || SQLWARN.7',',
            || SQLWARN.8',',
            || SQLWARN.9',',
            || SQLWARN.10
say 'SQLSTATE='SQLSTATE

zispfrc = 99
ADDRESS ISPEXEC 'VPUT (zispfrc)'
exit
/* END OF LISTEXTS PROGRAM */
