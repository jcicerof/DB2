//IBM1JCF2 JOB (T00101,610,Z000900,000,A11,000),'DSNTEP2  *',
//         NOTIFY=IBM1JCF,CLASS=O
/*JOBPARM Z=O,L=9999,SYSAFF=ESYS,H=ALL,TIME=1440
//*------------------------------------------------------------------
//*
//*------------------------------------------------------------------
//DSN1LOGP EXEC PGM=DSNJU004
//STEPLIB  DD DISP=SHR,DSN=DB2K.DB2LOAD
//SYSUT1   DD DISP=SHR,DSN=DB2L.BSDS01
//SYSPRINT DD SYSOUT=*
//SYSIN DD *
  MEMBER *
