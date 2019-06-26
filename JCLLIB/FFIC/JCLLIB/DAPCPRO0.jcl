//DAPCPRO0 JOB (S1I201,110),USER=ERSPROD
/*JOBPARM Z=4,S=ASYS
//****************************************************************  **
//****                                                              **
//**** THIS JOB IMAGE COPIES DATABASE DPRO0P00 IN DB2E              **
//****                                                              **
//********* IBM IMAGECOPY RESTART INSTRUCTIONS *******************  **
//*** TAPE COPY STEP                                                **
//***   RESTART AT TRMUTL01 STEP JUST PRIOR TO FAILING TAPE0001 STEP**
//***   WITHOUT ENCORE.                                             **
//*** IF RESTART FAILS, PAGE OUT PRODUCTION DB2 DBA (SEE CALLIBM)   **
//****************************************************************  **
//TRMUTL01 EXEC PGM=IKJEFT01,DYNAMNBR=20
//STEPLIB DD  DSN=DB2F.DB2LOAD,DISP=SHR
//SYSTSPRT DD SYSOUT=A
//SYSPRINT DD SYSOUT=A
//SYSUDUMP DD SYSOUT=A
//SYSTSIN  DD *
 DSN SYSTEM(DB2E)
 -TERM UTILITY(ERSPROD.DAPCPRO0)
 END
/*
//*
//TAPE0001  EXEC PGM=DSNUTILB,REGION=0M,COND=(4,LT),
//          PARM=('DB2E')
//*         PARM=('DB2E',,'RESTART')
//STEPLIB   DD   DSN=DB2F.DB2LOAD,DISP=SHR
//SYSPRINT  DD   SYSOUT=*
//UTPRINT   DD   SYSOUT=*
//*
//SYSIN    DD  *
  LISTDEF DPRO0PD
     INCLUDE TABLESPACES DATABASE DPRO0P00 PARTLEVEL
  TEMPLATE LCL1
     DSN 'DAPE.&SS..&DB..&TS..P&PART.(+1)'
     UNIT MAGV  EXPDL '1999000'
     STACK NO
     DISP (NEW,CATLG,CATLG)
     GDGLIMIT(4)
  TEMPLATE RMT1
     DSN 'DAPX.&SS..&DB..&TS..P&PART.(+1)'
     UNIT TVTS  EXPDL '1999000'
     STACK NO
     DISP (NEW,CATLG,CATLG)
     GDGLIMIT(4)
  COPY LIST DPRO0PD COPYDDN (RMT1,LCL1) SHRLEVEL CHANGE
//*********************************************************************
//******    MODIFY/RECOVERY JOB TO CLEAN UP SYSCOPY ENTRIES       *****
//*********************************************************************
//MODIFY01 EXEC PGM=DSNUTILB,REGION=0M,COND=(4,LT),
//          PARM=('DB2E')
//STEPLIB  DD   DSN=DB2F.DB2LOAD,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//UTPRINT  DD   SYSOUT=*
//SYSIN    DD  *
  LISTDEF MODLIST
          INCLUDE TABLESPACE DPRO0P00.*
  MODIFY RECOVERY LIST MODLIST  DELETE AGE(95)
//
//*
//*INCLUDE TABLESPACE DB.TS PARTLEVEL
//*INCLUDE INDEXSPACES COPY YES DATABASE DPRO0P00 PARTLEVEL
//*EXCLUDE TABLESPACE DB.TS PARTLEVEL
//*EXCLUDE INDEXSPACE DB.IX PARTLEVEL
//* LAST UPDATE   09/09/15  OSF
