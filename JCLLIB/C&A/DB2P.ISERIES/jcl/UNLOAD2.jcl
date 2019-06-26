//SDB80UNL  JOB 'CICERO',CLASS=S,MSGCLASS=X,REGION=0M,NOTIFY=&SYSUID
//*
//JOBLIB   DD DSN=DB2.DSN610.SDSNEXIT,DISP=SHR
//         DD DSN=DB2.DSN610.SDSNLOAD,DISP=SHR
//*------------------------------------------------------------------
//* REORG UNLOAD EXTERNAL
//*------------------------------------------------------------------
//UNLOAD   EXEC PGM=DSNUTILB,PARM='DB2P',COND=EVEN
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSPUNCH DD DSN=DB2P.CICERO.I5.EQ003T.SYSPUNCH,
//         DISP=(,CATLG,CATLG),
//         SPACE=(TRK,(1)),UNIT=SYSDA
//SYSREC   DD DSN=DB2P.CICERO.I5.EQ003T.SYSREC,
//         DISP=(,CATLG,CATLG),
//         SPACE=(TRK,(200,100)),UNIT=SYSDA
//SYSIN    DD   *
REORG TABLESPACE AISERIES.EQ003T UNLOAD EXTERNAL
 FROM TABLE SUPPROD.EQ003T_INVENTARIO
//*-------------------------------------------------------------------
//*    TERM UTIL
//*-------------------------------------------------------------------
//TERMUTIL EXEC PGM=IKJEFT01,DYNAMNBR=20,COND=EVEN
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD *
 DSN SYSTEM(DB2P)
-TERM UTIL(BR#JCSF.*)
 END
//SYSPRINT DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
