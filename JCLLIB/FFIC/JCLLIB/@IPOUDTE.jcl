//IBM1JCFA JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',
//         MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=L,NOTIFY=&SYSUID
/*JOBPARM Z=O,HOLD=ALL,S=ESYS,T=1439
//*
//STEP1 EXEC PGM=IPOUPDTE,PARM=CHECK     /*PARM=CHECK OU UPDATE
//SYSPRINT DD SYSOUT=*
//DD1 DD DSN=DBA5.DB2.PROCLIB2,DISP=SHR
//SYSIN DD *
  LOAD<PIRIRI<
/*