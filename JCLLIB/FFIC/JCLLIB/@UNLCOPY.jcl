//IBM1JCFA JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',
//*       RESTART=STEPNAME, <== FOR RESTART REMOVE * AND ENTER STEP NAME
//         MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=L,NOTIFY=IBM1JCF
/*JOBPARM Z=O,HOLD=ALL,S=ASYS,T=1439
//*
//*
//**********************************************************************
//*
//* DB2 ADMIN GENERATED JOB - RUN UNLOAD UTILITY (TABLESPACES)
//*
//***********************************************************ADB2USU****
//*
//**********************************************************************
//* STEP DELET1: DELETE OLD DATASETS
//**********************************************************************
//DELET1     EXEC PGM=IEFBR14
//SYSPUNCH  DD DSN=IBM1JCF.DB2Q.CNTL.DIRB0PPS.SIRBM76A.PTALL,
//             UNIT=SYSDA,DISP=(MOD,DELETE,DELETE),SPACE=(TRK,1)
//SYSREC    DD DSN=IBM1JCF.DB2Q.UNLD.DIRB0PPS.SIRBM76A.PTALL,
//             DISP=(MOD,DELETE,DELETE),SPACE=(TRK,1),
//             UNIT=SYSDA
//**********************************************************************
//* STEP UNLD1: UNLOAD TABLESPACE DIRB0PPS.SIRBM76A
//**********************************************************************
//UNLD1 EXEC DSNUPROC,SYSTEM=DB2Q,
//             LIB='DB2R.DB2LOAD',
//             UID=''
//SYSPUNCH  DD DSN=DBA5.DB2Q.DIRB0PPS.REPORT.WRITER.PUN,
//             DISP=(,CATLG,DELETE),
//             SPACE=(TRK,(5,5),RLSE),
//             UNIT=SYSDA
//SYSREC    DD DSN=DBA5.DB2Q.DIRB0PPS.REPORT.WRITER.REC,
//             DISP=(,CATLG,DELETE),
//             SPACE=(TRK,(138,14),RLSE),
//             UNIT=SYSDA
//SYSTSPRT  DD SYSOUT=*
//SYSPRINT  DD SYSOUT=*
//SYSIN     DD *
UNLOAD TABLESPACE DIRB0PPS.SIRBM76A
  FROMCOPY DAPE.DB2Q.DIRB0PPS.SIRBM76A.P00000.G0198V00
/*
