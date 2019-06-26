//DAACUDT0 JOB (S1I201,110),USER=DB2ACPT
/*JOBPARM Z=6,S=ESYS
//****                                                              **
//**** THIS JOB IMAGE COPIES DATABASE DUDT0A00 IN DB2D              **
//****                                                              **
//********* IBM IMAGECOPY RESTART INSTRUCTIONS *******************  **
//*    ************************************************************ **
//*    *    DO NOT USE "ENCORE" WHEN RESTARTING THIS JOB          * **
//*    *            PREVIOUS GDG'S MUST NOT BE DELETED.           * **
//*    ************************************************************ **
//*** TAPE COPY STEP - RESTART AT TRMUTL01 JUST PRIOR TO FAILING    **
//***    TAPE0001 STEP WITHOUT ENCORE                               **
//****   IF RESTART FAILS, HANG UP JOB WITH MALF UNTIL MORNING      **
//****   AND NOTIFY IBMDBA VIA EMAIL (SEE ONE CONTACT)              **
//*** MODIFY STEP - STEP RESTART                                    **
//****   IF RESTART FAILS, HANG UP JOB WITH MALF UNTIL MORNING      **
//****   AND NOTIFY IBMDBA VIA EMAIL (SEE ONE CONTACT)              **
//****                                                              **
//****************************************************************  **
//TRMUTL01 EXEC PGM=IKJEFT01,DYNAMNBR=20
//STEPLIB DD  DSN=DB2S.DB2LOAD,DISP=SHR
//SYSTSPRT DD SYSOUT=A
//SYSPRINT DD SYSOUT=A
//SYSUDUMP DD SYSOUT=A
//SYSTSIN  DD *
 DSN SYSTEM(DB2D)
 -TERM UTILITY(DB2ACPT.DAACUDT0)
 END
/*
//*
//TAPE0001  EXEC PGM=DSNUTILB,REGION=0M,COND=(4,LT),
//          PARM=('DB2D')
//*         PARM=('DB2D',,'RESTART')
//STEPLIB   DD   DSN=DB2S.DB2LOAD,DISP=SHR
//SYSPRINT  DD   SYSOUT=*
//UTPRINT   DD   SYSOUT=*
//*
//SYSIN    DD  *
  LISTDEF DUDT0AD
     INCLUDE TABLESPACES DATABASE DUDT0A00 PARTLEVEL
  TEMPLATE LCL1
     DSN 'DTUE.&SS..&DB..&TS..P&PART.(+1)'
     UNIT MAGV  EXPDL '1999000'
     STACK YES
     DISP (NEW,CATLG,CATLG)
     GDGLIMIT(5)
  COPY LIST DUDT0AD COPYDDN (LCL1) SHRLEVEL CHANGE
//*********************************************************************
//******    MODIFY/RECOVERY JOB TO CLEAN UP SYSCOPY ENTRIES       *****
//*********************************************************************
//MODIFY01 EXEC PGM=DSNUTILB,REGION=0M,COND=(4,LT),
//          PARM=('DB2D')
//STEPLIB  DD   DSN=DB2S.DB2LOAD,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//UTPRINT  DD   SYSOUT=*
//SYSIN    DD  *
  LISTDEF MODLIST
          INCLUDE TABLESPACE DUDT0A00.*
  MODIFY RECOVERY LIST MODLIST  DELETE AGE(32)
//*
//* LAST UPDATE 05/21/07  REF
