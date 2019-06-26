//IBM1JCFA JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',
//         MSGLEVEL=(1,1),MSGCLASS=X,      USER=DB2TEST,
//         CLASS=L,NOTIFY=IBM1JCF
/*JOBPARM Z=O,HOLD=ALL,S=ESYS,T=1439
//*------------------------------------------------------------------
//*  DB2A - DB2A.DB2LOAD/DB2A.DB2RUNLB
//*  DB2D - DB2S.DB2LOAD/DB2S.DB2RUNLB
//*  DB2J - DB2K.DB2LOAD/DB2S.DB2RUNLB
//*  DB2E - DB2F.DB2LOAD/DB2F.DB2RUNLB
//*  DB2H - DB2H.DB2LOAD/DB2H.DB2RUNLB
//*  DB2P - DB2C.DB2LOAD/DB2C.DB2RUNLB
//*  DB2Q - DB2R.DB2LOAD/DB2R.DB2RUNLB
//*------------------------------------------------------------------
//        JCLLIB ORDER=(DBA5.DB2.PROCLIB)
//*------------------------------------------------------------------
//*
//*------------------------------------------------------------------
//DISDB   EXEC PGM=IKJEFT01,DYNAMNBR=100
//STEPLIB   DD DSN=DB2S.DB2RUNLB,DISP=SHR
//          DD DISP=SHR,DSN=DB2S.DB2EXIT
//          DD DISP=SHR,DSN=DB2S.DB2LOAD
//SYSTSPRT  DD SYSOUT=*
//SYSPRINT  DD SYSOUT=*
//SYSTSIN   DD *
 DSN SYSTEM(DB2D)
 -DIS DB (DCBR0T00) SP(*) LIMIT(*) RESTRICT
 END
//SYSPUNCH  DD SYSOUT=*
//SYSREC00  DD SYSOUT=*
//SYSIN     DD DUMMY
//*------------------------------------------------------------------
//*
//*------------------------------------------------------------------
//REORG    EXEC REORG,DSN=DB2D,LIB=DB2S
//DFSPARM  DD *
 OPTION FILSZ=E30000000
//SYSIN DD *
  LISTDEF LISTDB  INCLUDE TABLESPACE DCBR0T00.SCDS0T00

//*
//
/*EOF
//REBIND  EXEC PGM=IKJEFT01,DYNAMNBR=100
//STEPLIB   DD DSN=DB2S.DB2RUNLB,DISP=SHR
//          DD DISP=SHR,DSN=DB2S.DB2EXIT
//          DD DISP=SHR,DSN=DB2S.DB2LOAD
//SYSTSPRT  DD SYSOUT=*
//SYSPRINT  DD SYSOUT=*
//SYSTSIN   DD *
 DSN SYSTEM(DB2D)
 REBIND PACKAGE (PER7_HOME.UDTPR310)
 END
//SYSPUNCH  DD SYSOUT=*
//SYSREC00  DD SYSOUT=*
//SYSIN     DD DUMMY
//*------------------------------------------------------------------
//*
//*------------------------------------------------------------------
//DISDB   EXEC PGM=IKJEFT01,DYNAMNBR=100
//STEPLIB   DD DSN=DB2S.DB2RUNLB,DISP=SHR
//          DD DISP=SHR,DSN=DB2S.DB2EXIT
//          DD DISP=SHR,DSN=DB2S.DB2LOAD
//SYSTSPRT  DD SYSOUT=*
//SYSPRINT  DD SYSOUT=*
//SYSTSIN   DD *
 DSN SYSTEM(DB2D)
 -DIS DB (DCBR0T00) SP(*) LIMIT(*) RESTRICT
 END
//SYSPUNCH  DD SYSOUT=*
//SYSREC00  DD SYSOUT=*
//SYSIN     DD DUMMY
