//IBM1JCF1 JOB (T00101,610,Z000900,000,A11,000),'DSNTEP2  *',           JOB02859
//*       RESTART=STEPNAME, <== FOR RESTART REMOVE * AND ENTER STEP NAME
//         NOTIFY=IBM1JCF USER=DB2PROD
/*JOBPARM  L=99,S=ESYS,H=ALL,FORMS=STD,TIME=(1439),Z=8
//*
//TSOLU    EXEC PGM=IKJEFT01,DYNAMNBR=20
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD *
  LU
//SYSPRINT DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
//SYSIN    DD DUMMY
