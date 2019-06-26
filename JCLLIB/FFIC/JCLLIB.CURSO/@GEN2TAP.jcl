//IBM1JCFA JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',            JOB06812
//*       RESTART=STEPNAME, <== FOR RESTART REMOVE * AND ENTER STEP NAME
//         MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=L,NOTIFY=IBM1JCF
/*JOBPARM Z=G,HOLD=ALL,S=ESYS,T=1439
//*
//**********************************************************************
//*
//* DB2 ADMIN GENERATED JOB
//*
//**********************************************************************
//*
//***********************************************************ADB2GEN2**
//* STEP GENSQL: GENERATE SQL FROM DB2 CATALOG
//**********************************************************************
//GENSQL   EXEC PGM=IKJEFT01,DYNAMNBR=100
//STEPLIB  DD DISP=SHR,DSN=DB2D.DB2.IBMTOOLS.SGOCLLIB
//         DD DISP=SHR,DSN=DB2D.DB2.IBMTOOLS.SADBLLIB
//         DD DISP=SHR,DSN=DB2S.DB2EXIT
//         DD DISP=SHR,DSN=DB2S.DB2LOAD
//         DD DISP=SHR,DSN=DB2D.DB2.IBMTOOLS.SADBLINK
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD *
  DSN SYSTEM(DB2D)
  RUN PROG(ADB2GEN) PLAN(ADB2GEN) -
  PARMS('/REBIND')
  END
/*
//SYSPRINT DD SYSOUT=*
//SQL      DD DSN=DBA5.C058543.GENDDL.D2012169,
//         DCB=(RECFM=FB,LRECL=80),
//         UNIT=MAGV,RETPD=180,DISP=(NEW,CATLG,DELETE)
//IN       DD *
  DB2SYS   = 'DB2D',
  DB2ALOC  = '',
  DB2SERV  = 'DB2D',
  DB2AUTH  = 'IBM1JCF',
  DB2REL   = '915',
  GENSG    = 'N',
  GENDB    = 'Y',
  GENTS    = 'Y',
  GENTABLE = 'Y',
  GENVIEW  = 'Y',
  GENINDEX = 'Y',
  GENSYN   = 'Y',
  GENALIAS = 'Y',
  GENLABEL = 'Y',
  GENCOMM  = 'Y',
  GENRELS  = 'Y',
  GENTRIG  = 'Y',
  GRANTDB  = 'Y',
  GRANTTS  = 'Y',
  GRANTTAB = 'Y',
  GRANTVW  = 'Y',
  GRANTSG  = 'N',
  NEWDB    = '',
  NEWTSSG  = '',
  NEWIXSG  = '',
  NEWSQLID = '',
  NEWGRANTOR = '',
  SPCALLOC = 'DEFINED',
  TGTDB2   = '';
  DB='DSIS0T00', TS='';
/*
