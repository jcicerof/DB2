//IBM1JCF0 JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',            JOB01274
//         MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=L,NOTIFY=IBM1JCF
/*JOBPARM Z=O,HOLD=ALL,S=ESYS,T=1439
//*------------------------------------------------------------------
//*
//*------------------------------------------------------------------
//IEBPTPCH EXEC PGM=IEBPTPCH
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
  PUNCH TYPORG=PO
//SYSUT1   DD DISP=SHR,DSN=IBM1JCF.DB2.SQLLIB
//SYSUT2   DD DSN=IBM1JCF.TESTE.TESTE,
//         DISP=(NEW,CATLG,DELETE),SPACE=(CYL,(10,10),RLSE),
//         UNIT=SYSDA
