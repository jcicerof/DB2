/* REXX **************************************************************/
/*                                                                   */
/*        DMETRICS - THIS PROGRAM READS THE SORTED DB2 DASD RPTS     */
/*                   INTO AN ARRAY.  IT ALSO READS A DB EXCLUDE      */
/*                   FILE IN TO AN ARRAY.  THIS PGM CREATES A DB2    */
/*                   METRICS RPT BY DB2 SYSTEM, LPAR, CUSTOMER       */
/*                   AND DEPARMENT.  IT EXCLUDES ANY MATCHING        */
/*                   CUSTOMER, LPAR, DB2SYS AND DATABASE NAMES IN    */
/*                   THE EXCLUDE FILE.                               */
/*                   THIS EXEC CREATES 2 OUTPUT FILES: 1) A SUMMARY  */
/*                   METRICS REPORT FOR EACH DBS SYSTEM WITH A ROLL  */
/*                   UP.  2) A SUMMARY AT THE CUSTOMER LEVEL THAT    */
/*                   CAN BE FTP'ED TO A CENTRAL REPORTING GROUP.     */
/*********************************************************************/
/*********************************************************************/
/*              INSTRUCTS FOR INPUT PARAMETERS                       */
/*              ==============================                       */
/* 1. //SYSTSIN  DD *                                                */
/*      ISPSTART CMD(%DMETRICS )                                     */
/*                                                                   */
/* 2. //DEXCLUDE DD *                                                */
/*    * COLUMN 1 MEANS COMMENT                                       */
/*    * CUSTOMER COL 3 - 13 CHAR MAX                                 */
/*    * LPAR     COL 17 - 9 CHAR MAX                                 */
/*    * DB2SYS   COL 27 - 5 CHAR MAX                                 */
/*    * DBNAME   COL 35 - 8 CHAR MAX                                 */
/*                                                                   */
/*  DBNAME    = NAME OF DATABASE TO EXCLUDE FROM METRICS TOTALS      */
/*********************************************************************/
/*=================== MAINTENANCE LOG ===============================*/
/* DATE  VERSION  UPDATED BY   REASON                                */
/* 022505 01.00   A.FARAGHER   NEW VERSION OF PROGRAM                */
/*********************************************************************/
/* PARSE UPPER ARG                                                   */

dd2ine.0 = 0
r1 = 0
s1 = 0
currdate = date('S')
cdate    = substr(currdate,1,4) || '-' ||,
           substr(currdate,5,2) || '-' ||,
           substr(currdate,7,2)

call read_detail_records
call read_db_excludes
call process_detail_records
call output_metrics_rpt
call output_metrics_summary

Return(0)

read_detail_records:
/**********************************************************************/
/* READS THE DASD MASTER DETAIL REPORT RECORDS                        */
/* AND CLOSES THE FILE.                                               */
/**********************************************************************/
ADDRESS MVS "EXECIO * DISKR "DBMSTR" (STEM DD1IN. FINIS "
IF RC ¬= 0  THEN DO
   Say "File I/O error on DD DBMSTR"
   Exit(16)
END

IF DD1IN.0 = 0  THEN DO
   Say "DASD MASTER DETAIL REPORT dataset is empty "
   Exit(16)
END

Return

read_db_excludes:
/**********************************************************************/
/* READS THE DB EXCLUDE RECORDS INTO AN ARRAY                         */
/* AND CLOSES THE FILE.                                               */
/**********************************************************************/
ADDRESS MVS "EXECIO * DISKR DEXCLUDE (STEM DD2INE. FINIS "
IF RC ¬= 0  THEN DO
   Say "File I/O error on DD DEXCLUDE"
   Exit(16)
END

IF DD2INE.0 = 0  THEN DO
   Say "DB exclude list Dataset is empty "
END

Return

process_detail_records:
/**********************************************************************/
/* process the detail records                                         */
/**********************************************************************/
db2sys_head_flag = 'N'
prev_dbnm    = ''
p_lpar       = ''
p_db2_sys    = ''
db_sys_tot_dbs       = 0
db_sys_tot_alloc_cyl = 0
db_sys_gig_wrk       = 0
db_sys_tot_no_tables = 0
db_sys_tot_ts_spaces = 0
db_sys_tot_ix_spaces = 0
db_sys_tot_datasets  = 0
lpar_db2_sys       = 0
lpar_tot_dbs       = 0
lpar_tot_alloc_cyl = 0
lpar_gig_wrk       = 0
lpar_tot_no_tables = 0
lpar_tot_ts_spaces = 0
lpar_tot_ix_spaces = 0
lpar_tot_datasets  = 0
cust_db2_sys       = 0
cust_tot_dbs       = 0
cust_tot_alloc_cyl = 0
cust_gig_wrk       = 0
cust_tot_no_tables = 0
cust_tot_ts_spaces = 0
cust_tot_ix_spaces = 0
cust_tot_datasets  = 0
gt_db2_sys         = 0
gt_tot_dbs         = 0
gt_tot_alloc_cyl   = 0
gt_gig_wrk         = 0
gt_tot_no_tables   = 0
gt_tot_ts_spaces   = 0
gt_tot_ix_spaces   = 0
gt_tot_datasets    = 0

ii = 0
Do i = 1 to dd1in.0              /* table all cust, lpars and db2_sys */
   If ' ' = substr(dd1in.i,1,1) Then iterate                /* Bypass */
   If '*' = substr(dd1in.i,1,1) Then iterate                /* Bypass */
   If '-' = substr(dd1in.i,1,1) Then iterate                /* Bypass */
   If 'DATASET' = substr(dd1in.i,1,7) Then iterate          /* Bypass */

   cust     = substr(dd1in.i,136,12)
   cust     = strip(cust)
   lpar     = substr(dd1in.i,81,9)
   lpar     = strip(lpar)
   db2_sys  = substr(dd1in.i,90,5)
   db2_sys  = strip(db2_sys)
   If p_cust = cust & p_lpar = lpar & p_db2_sys = db2_sys Then iterate

   ii = ii +1
   g_cust.ii = cust
   g_cust.0 = ii
   g_lpar.ii = lpar
   g_sys.ii  = db2_sys
   p_cust = cust
   p_lpar = lpar
   p_db2_sys = db2_sys
End


call rpt_heading
ii = 1
p_db2_sys = ''
Do i = 1 to dd1in.0
   If ' ' = substr(dd1in.i,1,1) Then iterate                /* Bypass */
   If '*' = substr(dd1in.i,1,1) Then iterate                /* Bypass */
   If '-' = substr(dd1in.i,1,1) Then iterate                /* Bypass */
   If 'DATASET' = substr(dd1in.i,1,7) Then iterate          /* Bypass */

   bypass = 'N'        /* BYPASS selected lines based on exclude file */
   Do ix = 1 to dd2ine.0
      If  '*' = substr(dd2ine.ix,1,1) Then iterate
      ex_cust   = substr(dd2ine.ix,3,12)
      ex_cust   = strip(ex_cust)
      ex_lpar   = substr(dd2ine.ix,17,9)
      ex_lpar   = strip(ex_lpar)
      ex_db2_sys = substr(dd2ine.ix,27,5)
      ex_db2_sys = strip(ex_db2_sys)
      ex_dbnm   = substr(dd2ine.ix,35,8)
      ex_dbnm   = strip(ex_dbnm)
      cust      = substr(dd1in.i,136,12)
      cust      = strip(cust)
      lpar      = substr(dd1in.i,81,9)
      lpar      = strip(lpar)
      db2_sys   = substr(dd1in.i,90,5)
      db2_sys   = strip(db2_sys)
      db2_dbnm  = substr(dd1in.i,95,8)
      db2_dbnm  = strip(db2_dbnm)
      If  ex_dbnm = '' Then iterate
      If ex_cust = cust Then
         If ex_lpar = lpar Then
            If ex_db2_sys = db2_sys Then
               If db2_dbnm = ex_dbnm Then Do
                  bypass = 'Y'
                  leave
               End
   End


   If bypass = 'N' Then Do
      p_ln_mgr_2 = ln_mgr_2
      p_dept     = dept
      p_ibm_div  = ibm_div
      p_c_mf     = c_mf
      p_c_db2udb = c_db2udb

      dsname         = substr(dd1in.i,1,44)
      dsname         = strip(dsname)
      alloc_cyl      = substr(dd1in.i,47,6)
      alloc_cyl      = strip(alloc_cyl)
      alloc_exts     = substr(dd1in.i,54,3)
      alloc_exts     = strip(alloc_exts)
      cyls_used      = substr(dd1in.i,59,6)
      cyls_used      = strip(cyls_used)
      percent_used   = substr(dd1in.i,66,5)
      percent_used   = strip(percent_used)
      percent_g_used = substr(dd1in.i,72,5)
      percent_g_used = strip(percent_g_used)
      gig_limit      = substr(dd1in.i,78,1)
      gig_limit      = strip(gig_limit)
      lpar           = substr(dd1in.i,81,9)
      lpar           = strip(lpar)
      db2_sys        = substr(dd1in.i,90,5)
      db2_sys        = strip(db2_sys)
      db2_dbnm       = substr(dd1in.i,95,8)
      db2_dbnm       = strip(db2_dbnm)
      db2_tsnm       = substr(dd1in.i,104,8)
      db2_tsnm       = strip(db2_tsnm)
      type_space     = substr(dd1in.i,113,2)
      type_space     = strip(type_space)
      run_dt         = substr(dd1in.i,117,10)
      run_dt         = strip(run_dt)
      no_tables      = substr(dd1in.i,128,4)
      no_tables      = strip(no_tables)
      part_dsg       = substr(dd1in.i,133,3)
      part_dsg       = strip(part_dsg)
      cust           = substr(dd1in.i,137,12)
      cust           = strip(cust)
      ln_mgr_2       = substr(dd1in.i,149,14)
      ln_mgr_2       = strip(ln_mgr_2)
      dept           = substr(dd1in.i,163,6)
      dept           = strip(dept)
      ibm_div        = substr(dd1in.i,169,5)
      ibm_div        = strip(ibm_div)
      envir_typ      = substr(dd1in.i,174,8)
      envir_typ      = strip(envir_typ)
      ser_off        = substr(dd1in.i,182,9)
      ser_off        = strip(ser_off)
      c_mf           = substr(dd1in.i,191,2)
      c_mf           = strip(c_mf)
      c_db2udb       = substr(dd1in.i,194,6)
      c_db2udb       = strip(c_db2udb)

      If cust ¬= '' Then
         If g_cust.ii ¬= cust Then Do
            call db2sys_break
            call lpar_break
            call cust_break
            ii = ii +1
         End

   If g_lpar.ii = lpar Then
      If p_db2_sys ¬= db2_sys Then Do
         lpar_db2_sys = lpar_db2_sys + 1
         p_db2_sys = db2_sys
      End

   If g_lpar.ii = lpar Then
      If g_sys.ii ¬= db2_sys Then Do
         call db2sys_break
         ii = ii +1
      End

     If g_lpar.ii ¬= lpar Then Do
        call db2sys_break
        call lpar_break
        ii = ii +1
     End

      If prev_dbnm ¬= db2_dbnm Then Do
         db_sys_tot_dbs = db_sys_tot_dbs + 1
         prev_dbnm = db2_dbnm
      End

      db_sys_tot_alloc_cyl = db_sys_tot_alloc_cyl + alloc_cyl

      If type_space = 'TS' Then
         If no_tables ¬ = '' Then Do
            db_sys_tot_no_tables = db_sys_tot_no_tables + no_tables
         End

      If part_dsg = 'DSG' Then Do
      Parse var dsname hlq '.' data '.' dbd '.' spname '.' inum '.' anum
         If anum = 'A001' Then Do
            If type_space = 'TS' Then
               db_sys_tot_ts_spaces = db_sys_tot_ts_spaces + 1
            If type_space = 'IX' Then
               db_sys_tot_ix_spaces = db_sys_tot_ix_spaces + 1
         End
      End

      If part_dsg ¬= 'DSG' Then Do
         If type_space = 'TS' Then
            db_sys_tot_ts_spaces = db_sys_tot_ts_spaces + 1
         If type_space = 'IX' Then
            db_sys_tot_ix_spaces = db_sys_tot_ix_spaces + 1
      End

      db_sys_tot_datasets  = db_sys_tot_datasets  + 1
   End
End

call db2sys_break
call lpar_break
call cust_break
call gt_totals
Return

rpt_heading:
/**********************************************************************/
/* PROCESS THE REPORT HEADING                                         */
/**********************************************************************/
r1 = r1 + 1
mrpt.r1 = '                      DB2 METRICS REPORTS                ',
  ' '||cdate

/* Return */

/* db2sys_heading: */
/**********************************************************************/
/* system break heading                                               */
/**********************************************************************/
r1 = r1 + 1
mrpt.r1 = ' '
r1 = r1 + 1
mrpt.r1 = '  CUSTOMER     LPAR    #DB2  SSID    DB        ',
          'CYL         GIG     TBLS      TS      IX       DS  '
r1 = r1 + 1
mrpt.r1 = '------------ --------- ---- ------ -------',
          '------------- -------- -------- -------- -------- --------'
mrpt.0 = r1

db2sys_head_flag = 'Y'
Return

db2sys_break:
/**********************************************************************/
/* print the sub-system break totals                                  */
/**********************************************************************/
/* If db2sys_head_flag ¬= 'Y' Then call db2sys_heading */

/* gigs = cyl * 15 tracks * 56664 bytes per trk / 1073741824)  */
db_sys_gig_wrk = ,
       trunc((db_sys_tot_alloc_cyl * 15 * 56664 / 1073741824),1)
db_sys_gig_wrk = FORMAT(db_sys_gig_wrk,,1)

r1 = r1 + 1
mrpt.r1 = left(g_cust.ii,13) || left(g_lpar.ii,10) || right('1',4) ||,
    ' '|| left(g_sys.ii,7) || right(db_sys_tot_dbs,7) ||,
    right(db_sys_tot_alloc_cyl,14) || right(db_sys_gig_wrk,9) ||,
    right(db_sys_tot_no_tables,9)  || right(db_sys_tot_ts_spaces,9) ||,
    right(db_sys_tot_ix_spaces,9)  || right(db_sys_tot_datasets,9)
mrpt.0 = r1

/* accum LPAR totals */
lpar_tot_dbs       = lpar_tot_dbs       + db_sys_tot_dbs
lpar_tot_alloc_cyl = lpar_tot_alloc_cyl + db_sys_tot_alloc_cyl
lpar_gig_wrk       = lpar_gig_wrk       + db_sys_gig_wrk
lpar_tot_no_tables = lpar_tot_no_tables + db_sys_tot_no_tables
lpar_tot_ts_spaces = lpar_tot_ts_spaces + db_sys_tot_ts_spaces
lpar_tot_ix_spaces = lpar_tot_ix_spaces + db_sys_tot_ix_spaces
lpar_tot_datasets  = lpar_tot_datasets  + db_sys_tot_datasets

/* reset db_sys totals */
db_sys_tot_dbs       = 0
db_sys_tot_alloc_cyl = 0
db_sys_gig_wrk       = 0
db_sys_tot_no_tables = 0
db_sys_tot_ts_spaces = 0
db_sys_tot_ix_spaces = 0
db_sys_tot_datasets  = 0

Return

lpar_heading:
/**********************************************************************/
/* system break heading                                               */
/**********************************************************************/
/* r1 = r1 + 1  */
/* mrpt.r1 = ' '  */
/* mrpt.0 = r1  */

Return

lpar_break:
/**********************************************************************/
/* print the lpar break totals                                        */
/**********************************************************************/
db2sys_head_flag = 'N'
call lpar_heading

lpar_gig_wrk = FORMAT(lpar_gig_wrk,,1)
r1 = r1 + 1
mrpt.r1 = left('SUB-TOTAL BY',13) || left('LPAR',10) ||,
    right(lpar_db2_sys,4) ||' '|| left('*',7) ||,
    right(lpar_tot_dbs,7) ||,
    right(lpar_tot_alloc_cyl,14) || right(lpar_gig_wrk,9) ||,
    right(lpar_tot_no_tables,9)  || right(lpar_tot_ts_spaces,9) ||,
    right(lpar_tot_ix_spaces,9)  || right(lpar_tot_datasets,9)
mrpt.0 = r1


/* accum CUSTOMER totals */
cust_db2_sys       = cust_db2_sys       + lpar_db2_sys
cust_tot_dbs       = cust_tot_dbs       + lpar_tot_dbs
cust_tot_alloc_cyl = cust_tot_alloc_cyl + lpar_tot_alloc_cyl
cust_gig_wrk       = cust_gig_wrk       + lpar_gig_wrk
cust_tot_no_tables = cust_tot_no_tables + lpar_tot_no_tables
cust_tot_ts_spaces = cust_tot_ts_spaces + lpar_tot_ts_spaces
cust_tot_ix_spaces = cust_tot_ix_spaces + lpar_tot_ix_spaces
cust_tot_datasets  = cust_tot_datasets  + lpar_tot_datasets

r1 = r1 + 1
mrpt.r1 = ' '
mrpt.0 = r1

/* reset LPAR totals */
p_db2_sys          = ''
lpar_db2_sys       = 0
lpar_tot_dbs       = 0
lpar_tot_alloc_cyl = 0
lpar_gig_wrk       = 0
lpar_tot_no_tables = 0
lpar_tot_ts_spaces = 0
lpar_tot_ix_spaces = 0
lpar_tot_datasets  = 0

Return

cust_break:
/**********************************************************************/
/* print the customer totals                                          */
/**********************************************************************/
cust_gig_wrk = FORMAT(cust_gig_wrk,,1)

r1 = r1 + 1
mrpt.r1 = left('TOTAL BY CUST',13) || left('OMER',10) ||,
    right(cust_db2_sys,4) ||' '|| left('*',7) ||,
    right(cust_tot_dbs,7) ||,
    right(cust_tot_alloc_cyl,14) || right(cust_gig_wrk,9) ||,
    right(cust_tot_no_tables,9)  || right(cust_tot_ts_spaces,9) ||,
    right(cust_tot_ix_spaces,9)  || right(cust_tot_datasets,9)
r1 = r1 + 1
mrpt.r1 = ' '
mrpt.0 = r1

/*  BUILD THE CUSTOMER SUMMARY RECORD */
s1 = s1 + 1
sumrpt.s1 = left(g_cust.ii,13) || left('    ',10) ||,
    right(cust_db2_sys,4) ||' '|| left('  ',7) ||,
    right(cust_tot_dbs,7) ||,
    right(cust_tot_alloc_cyl,14) || right(cust_gig_wrk,9) ||,
    right(cust_tot_no_tables,9)  || right(cust_tot_ts_spaces,9) ||,
    right(cust_tot_ix_spaces,9)  || right(cust_tot_datasets,9) || ' '||,
    left(p_ln_mgr_2,14)          || left(p_dept,6) ||,
    left(p_ibm_div,5)            || left(p_c_mf,2) || ' ' ||,
    left(p_c_db2udb,6)
sumrpt.0 = s1


/* accum Grand Totals */
gt_db2_sys       = gt_db2_sys       + cust_db2_sys
gt_tot_dbs       = gt_tot_dbs       + cust_tot_dbs
gt_tot_alloc_cyl = gt_tot_alloc_cyl + cust_tot_alloc_cyl
gt_gig_wrk       = gt_gig_wrk       + cust_gig_wrk
gt_tot_no_tables = gt_tot_no_tables + cust_tot_no_tables
gt_tot_ts_spaces = gt_tot_ts_spaces + cust_tot_ts_spaces
gt_tot_ix_spaces = gt_tot_ix_spaces + cust_tot_ix_spaces
gt_tot_datasets  = gt_tot_datasets  + cust_tot_datasets


/* reset LPAR totals */
cust_db2_sys       = 0
cust_db2_sys       = 0
cust_tot_alloc_cyl = 0
cust_gig_wrk       = 0
cust_tot_no_tables = 0
cust_tot_ts_spaces = 0
cust_tot_ix_spaces = 0
cust_tot_datasets  = 0

Return

gt_totals:
/**********************************************************************/
/* print the grand totals                                             */
/**********************************************************************/
gt_gig_wrk = FORMAT(gt_gig_wrk,,1)
r1 = r1 + 1
mrpt.r1 = left('TOTAL BY DEPA',13) || left('RTMENT',10) ||,
    right(gt_db2_sys,4) ||' '|| left('*',7) ||,
    right(gt_tot_dbs,7) ||,
    right(gt_tot_alloc_cyl,14) || right(gt_gig_wrk,9) ||,
    right(gt_tot_no_tables,9)  || right(gt_tot_ts_spaces,9) ||,
    right(gt_tot_ix_spaces,9)  || right(gt_tot_datasets,9)
r1 = r1 + 1
mrpt.r1 = ' '
mrpt.0 = r1

Return

output_metrics_rpt:
/**********************************************************************/
/* OUTPUTS THE DB2 METRICS REPORT TO A FILE                           */
/* AND CLOSES THE FILE.                                               */
/**********************************************************************/
ADDRESS MVS "EXECIO * DISKW "MREPORT" (STEM mrpt. FINIS "
IF RC ¬= 0  THEN DO
   Say "File I/O error on DD MREPORT"
   Exit(16)
END

Return

output_metrics_summary:
/**********************************************************************/
/* OUTPUTS THE DB2 METRICS CUSTOMER SUMARRY REPORT TO A FILE          */
/* AND CLOSES THE FILE.                                               */
/**********************************************************************/
ADDRESS MVS "EXECIO * DISKW "SUMRPT" (STEM sumrpt. FINIS "
IF RC ¬= 0  THEN DO
   Say "File I/O error on DD SUMRPT"
   Exit(16)
END

Return
/* END OF DMETRICS PROGRAM */
