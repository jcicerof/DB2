//IBM1JCF1 JOB (T00101,610,Z000900,000,A11,000),'DSNTEP2  *',           JOB10628
//         NOTIFY=IBM1JCF,CLASS=O
/*JOBPARM  L=99,S=ESYS,H=ALL,FORMS=STD,TIME=(1439),Z=8
//*--------------------------------------------------------------
//*
//*--------------------------------------------------------------
//STEP01   EXEC PGM=FTP
//***      PARM='147.118.11.100 (TIMEOUT 1800 EXIT=8'
//SYSPRINT DD SYSOUT=*
//OUTPUT   DD SYSOUT=*
//INPUT    DD *
  whoami
  quit
//
/*EOF
