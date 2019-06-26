//IBM1JCFA JOB (T00101,520,AU88100,658,000,581),'DB2 DBA TOOL',
//         NOTIFY=IBM1DZR,MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=L,USER=DB2PROD
/*JOBPARM Z=O,L=9999,SYSAFF=ESYS,H=ALL,TIME=1440
//*------------------------------------------------------------------
//*  DB2A - DB2A.DB2LOAD/DB2A.DB2RUNLB
//*  DB2D - DB2S.DB2LOAD/DB2S.DB2RUNLB
//*  DB2J - DB2K.DB2LOAD/DB2K.DB2RUNLB
//*  DB2E - DB2F.DB2LOAD/DB2F.DB2RUNLB
//*  DB2H - DB2H.DB2LOAD/DB2H.DB2RUNLB
//*  DB2P - DB2C.DB2LOAD/DB2C.DB2RUNLB
//*  DB2Q - DB2R.DB2LOAD/DB2R.DB2RUNLB
//*------------------------------------------------------------------
//         JCLLIB ORDER=(DBA5.DB2.PROCLIB)
//*---------------------------------------------------------------------
//*
//* VERIFICAR COMMAND REFERENCE SOBRE OS PARAMETROS
//*
//*---------------------------------------------------------------------
//DCLGEN   EXEC PGM=IKJEFT01,DYNAMNBR=20
//STEPLIB  DD DSN=DB2K.DB2LOAD,DISP=SHR
//         DD DSN=DB2K.DB2RUNLB,DISP=SHR
//SYSTSPRT DD SYSOUT=* ,DCB=(RECFM=F,LRECL=200,BLKSIZE=200)
//SYSUDUMP DD SYSOUT=*
//SYSTSIN  DD *
DSN SYSTEM(DB2J)
DCLGEN TABLE(DBA1ADM.HSTVSAM) +
  LIBRARY('IBM1JCF.DB2.SQLLIB(ZZTESTEZ)') +
  ACTION(ADD) QUOTE +
  LANGUAGE(IBMCOB) +
  STRUCTURE(HSTVSAM) +
  INDVAR(YES)
END