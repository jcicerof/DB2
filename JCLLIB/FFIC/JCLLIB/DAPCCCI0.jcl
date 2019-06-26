//DAPCCCI0 JOB (S1I201,110),USER=CISPROD
/*JOBPARM Z=4,S=ASYS
//****************************************************************  **
//****                                                              **
//**** THIS JOB IMAGE COPIES DATABASE DCCI0P00 IN DB2Q              **
//****                                                              **
//********* IBM IMAGECOPY RESTART INSTRUCTIONS *******************  **
//*    ************************************************************ **
//*    *    DO NOT USE "ENCORE" WHEN RESTARTING THIS JOB          * **
//*    *            PREVIOUS GDG'S MUST NOT BE DELETED.           * **
//*    ************************************************************ **
//*** TAPE COPY STEP - RESTART AT TRMUTL01 JUST PRIOR TO FAILING    **
//***    TAPE0001 STEP WITHOUT ENCORE                               **
//***    IF RESTART FAILS, PAGE OUT PROD DB2 DBA (SEE ONE CONTACT)  **  **
//*** MODIFY STEP - STEP RESTART                                    **
//***    IF RESTART FAILS, PAGE OUT PROD DB2 DBA (SEE ONE CONTACT)  **  **
//***                                                               **
//****************************************************************  **
//TRMUTL01 EXEC PGM=IKJEFT01,DYNAMNBR=20
//STEPLIB DD  DSN=DB2R.DB2LOAD,DISP=SHR
//SYSTSPRT DD SYSOUT=A
//SYSPRINT DD SYSOUT=A
//SYSUDUMP DD SYSOUT=A
//SYSTSIN  DD *
 DSN SYSTEM(DB2Q)
 -TERM UTILITY(CISPROD.DAPCCCI0)
 END
/*
//*
//TAPE0001  EXEC PGM=DSNUTILB,REGION=0M,COND=(4,LT),
//          PARM=('DB2Q')
//*         PARM=('DB2Q',,'RESTART')
//STEPLIB   DD   DSN=DB2R.DB2LOAD,DISP=SHR
//SYSPRINT  DD   SYSOUT=*
//UTPRINT   DD   SYSOUT=*
//*
//SYSIN    DD  *
  LISTDEF DCCI0PD
     INCLUDE TABLESPACES DATABASE DCCI0P00 PARTLEVEL
  TEMPLATE LCL1
     DSN 'CCIE.&SS..&DB..&TS..P&PART.(+1)'
     UNIT MAGV  EXPDL '1999000'
     STACK YES
     DISP (NEW,CATLG,CATLG)
     GDGLIMIT(5)
  TEMPLATE RMT1
     DSN 'CCIX.&SS..&DB..&TS..P&PART.(+1)'
     UNIT TVTS  EXPDL '1999000'
     STACK YES
     DISP (NEW,CATLG,CATLG)
     GDGLIMIT(5)
  COPY LIST DCCI0PD COPYDDN (LCL1) RECOVERYDDN (RMT1) SHRLEVEL CHANGE
//*********************************************************************
//******    MODIFY/RECOVERY JOB TO CLEAN UP SYSCOPY ENTRIES       *****
//*********************************************************************
//MODIFY01 EXEC PGM=DSNUTILB,REGION=0M,COND=(4,LT),
//          PARM=('DB2Q')
//STEPLIB  DD   DSN=DB2R.DB2LOAD,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//UTPRINT  DD   SYSOUT=*
//SYSIN    DD  *
  LISTDEF MODLIST
          INCLUDE TABLESPACE DCCI0P00.*
  MODIFY RECOVERY LIST MODLIST  DELETE AGE(32)
//*
//* LAST UPDATE 09/09/15  MSO
