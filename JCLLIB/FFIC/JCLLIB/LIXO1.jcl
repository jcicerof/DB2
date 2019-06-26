//IBM1JCF0 JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',
//*       RESTART=STEPNAME, <== FOR RESTART REMOVE * AND ENTER STEP NAME
//         NOTIFY=&SYSUID,MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=L
//*
/*JOBPARM Z=G,HOLD=ALL,S=ESYS,T=1439
//*
//*********************************************************************
//*
//* DB2 ADMIN GENERATED JOB
//*
//*********************************************************************
//*
//***********************************************************ADB2GEN2**
//* STEP GENSQL: GENERATE SQL FROM DB2 CATALOG
//*********************************************************************
//GENSQL   EXEC PGM=IKJEFT01,DYNAMNBR=100
//******************************************************************
//** CHANGED BY USERMOD                                   MDAOX01 **
//** CONCATENATION OF                                     MDAOX01 **
//** DD DISP=SHR,DSN=SYS1.DSNDB2J.SDSNLOAD            MDAOX01 **
//******************************************************************
//STEPLIB  DD DISP=SHR,DSN=DB2J.DB2.IBMTOOLS.SGOCLLIB
//******************************************************************
//** CHANGED BY USERMOD                                   MDAOX01 **
//** CONCATENATION OF                                     MDAOX01 **
//** DD DISP=SHR,DSN=SYS1.DSNDB2J.SDSNLOAD            MDAOX01 **
//******************************************************************
//         DD DISP=SHR,DSN=DB2J.DB2.IBMTOOLS.SADBLLIB
//    DD DISP=SHR,DSN=SYS1.DSNDB2J.SDSNLOAD
//         DD DISP=SHR,DSN=DB2K.DB2EXIT
//         DD DISP=SHR,DSN=DB2K.DB2LOAD
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD *
  DSN SYSTEM(DB2J)
  RUN PROG(ADB2GEN) PLAN(ADB2GEN)
  END
/*
//SYSPRINT DD SYSOUT=*
//SQL      DD SYSOUT=*,DCB=(RECFM=FB,LRECL=80)
//IN       DD *
  DB2SYS   = 'DB2J',
  DB2ALOC  = '',
  DB2SERV  = 'DB2J',
  DB2AUTH  = 'IBM1JCF',
  DB2REL   = '915',
  GENSG    = 'Y',
  GENDB    = '',
  GENTS    = 'Y',
  GENTABLE = 'Y',
  GENVIEW  = 'Y',
  GENINDEX = 'Y',
  GENSYN   = 'Y',
  GENALIAS = 'Y',
  GENLABEL = 'Y',
  GENCOMM  = 'Y',
  GENRELS  = 'Y',
  GENTRIG  = 'N',
  ACTVCNTL = '',
  GRANTDB  = '',
  GRANTTS  = 'Y',
  GRANTTAB = 'Y',
  GRANTVW  = 'Y',
  IMPLQUALMETHOD = '',
  GRANTSG  = 'Y',
  IMPLDB   = '',
  IMPLTS   = '',
  NEWDB    = '',
  NEWTSSG  = '',
  NEWIXSG  = '',
  NEWSQLID = '',
  NEWGRANTOR = '',
  SPCALLOC = 'DEFINED',
  ROLEWARN = 'Y',
  TGTDB2   = '';
  DB='DCLI0A01', TS='SEJN0A00';
/*
