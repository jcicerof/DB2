//IBM1JCFL JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',
//         MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=L,NOTIFY=IBM1JCF USER=DB2TEST
/*JOBPARM Z=O,HOLD=ALL,S=ESYS,T=1439
//*
//**********************************************************************
//*
//* DB2 ADMIN GENERATED JOB - RUN UNLOAD UTILITY (TABLES)
//*
//************************************************************ADB2UTU***
//*
//**********************************************************************
//* STEP UNLD0: UNLOAD TABLES
//**********************************************************************
//UNLD0  EXEC PGM=IKJEFT01,DYNAMNBR=100
//STEPLIB   DD DSN=DB2S.DB2RUNLB,DISP=SHR
//         DD DISP=SHR,DSN=DB2S.DB2EXIT
//         DD DISP=SHR,DSN=DB2S.DB2LOAD
//         DD DISP=SHR,DSN=DB2D.DB2.IBMTOOLS.SADBLINK
//         DD DISP=SHR,DSN=DB2D.DB2.IBMTOOLS.SADBLINK
//SYSTSPRT  DD SYSOUT=*
//SYSPRINT  DD SYSOUT=*
//SYSTSIN   DD *
 DSN SYSTEM(DB2D)
 -DIS DB(*) SPACENAM(SEXP0A8K) LIMIT(*) RESTRICT
 END
//SYSPUNCH  DD SYSOUT=*
//SYSREC00  DD SYSOUT=*
//SYSIN     DD DUMMY
