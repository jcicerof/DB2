//IBM1JCF1 JOB (T00101,610,Z000900,000,A11,000),'TEST      *',          JOB02859
//         NOTIFY=IBM1JCF,USER=IBM1JCF
//*        CLASS=L
//*
/*JOBPARM  L=99,S=ESYS,H=ALL,FORMS=STD,TIME=(1439),Z=8
//*
//STEP002  EXEC PGM=IEBGENER
//SYSPRINT DD SYSOUT=*
//SYSIN    DD DUMMY
//SYSUT2   DD SYSOUT=B,DEST=(FFA1,SMTP)
//SYSUT1   DD *
HELO FFA1
MAIL FROM:<ESYS@FFIC.COM>
RCPT TO:<CICEROF@BR.IBM.COM>
DATA
DATE: 01 JAN 2011 10:00:00 -0300
FROM: "DBA MAINFRAME" <ESYS@FFIC.COM>
TO: CICEROF@BR.IBM.COM
SUBJECT: ENVIO DE EMAIL - TESTE

*********************************************************************
*JOB=TESTE TESTE TESTE **********************************************
*********************************************************************
*********** TESTE TESTE TESTE TESTE TESTE TESTE TESTE TESTE *********
*********************************************************************
*********************************************************************
*********************************************************************
.
QUIT
