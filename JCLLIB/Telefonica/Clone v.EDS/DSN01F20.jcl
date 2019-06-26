//DSN01F20 JOB (%%ODAY.%%OMONTH,%%OYEAR%%.DP),00300.CONTROLM,
//         CLASS=O,MSGCLASS=V,REGION=0M
/*ROUTE XEQ NJE1
/*JOBPARM S=MVSB
//JOBLIB  DD  DISP=SHR,DSN=D2C1.V7R1M0.SDSNLOAD                         00290000
//*
//*-------------------------------------------------------------------* 00280000
//*  PROCESSO DE RECRIACAO DA AREA DE TRABALHO DO DB2   DSNDB07       *
//*  EM CASO DE PROBLEMAS ACIONAR O SUPORTE DB2                       *
//*-------------------------------------------------------------------* 00280000
//DSNTIAS EXEC PGM=IKJEFT01,DYNAMNBR=20                                 00650000
//SYSTSPRT DD  SYSOUT=*                                                 00660000
//SYSPRINT DD  SYSOUT=*                                                 00670000
//SYSUDUMP DD  SYSOUT=*                                                 00680000
//SYSTSIN  DD  DSN=SYS3.TFU.PARMLIB(STPDSN07),DISP=SHR                  00690000
//SYSIN    DD  DSN=SYS3.TFU.PARMLIB(DRPDSN07),DISP=SHR                  00770000
//*                                                                     00790000
//DSNTICR EXEC PGM=IKJEFT01,DYNAMNBR=20,COND=(12,LT,DSNTIAS)            00800000
//SYSTSPRT DD  SYSOUT=*                                                 00820000
//SYSPRINT DD  SYSOUT=*                                                 00830000
//SYSUDUMP DD  SYSOUT=*                                                 00840000
//SYSTSIN  DD  DSN=SYS3.TFU.PARMLIB(D2C1TIAD),DISP=SHR                  00850000
//SYSIN    DD  DSN=SYS3.TFU.PARMLIB(D2C1CRT7),DISP=SHR                  00900000
//*                                                                     00920000
//DSNTTMP EXEC PGM=IDCAMS,COND=((12,LT,DSNTIAS),(4,LT,DSNTICR))         00930000
//* ***********************************************                     00940000
//*  DEFINE TEMPORARY TABLESPACES                 *                     00950000
//*     THESE TABLE SPACES ARE USED FOR TEMPORARY *                     00960000
//*     OR INTERMEDIATE TABLES BY DB2, IN SORTING *                     00970000
//*     FOR ONE EXAMPLE.                          *                     00980000
//* ***********************************************                     00990000
//SYSPRINT DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
//SYSIN DD DSN=SYS3.TFU.PARMLIB(DELDEF07),DISP=SHR                      01000000
//DSNTIST EXEC PGM=IKJEFT01,DYNAMNBR=20,                                01020000
//     COND=((12,LT,DSNTIAS),(4,LT,DSNTICR),(4,LT,DSNTTMP))             01030000
//SYSTSPRT DD  SYSOUT=*                                                 01040000
//SYSPRINT DD  SYSOUT=*                                                 01050000
//SYSUDUMP DD  SYSOUT=*                                                 01060000
//SYSTSIN  DD  DSN=SYS3.TFU.PARMLIB(DEFDB07),DISP=SHR                   01070000
//SYSIN    DD  DSN=SYS3.TFU.PARMLIB(CRTDB07),DISP=SHR                   01140000
//*                                                                     01150000
//START    EXEC PGM=IKJEFT01
//STEPLIB  DD   DSN=D2C1.V7R1M0.SDSNLOAD,DISP=SHR
//         DD   DSN=D2C1.V7R1M0.SDSNEXIT,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//SYSTSPRT DD   SYSOUT=*
//SYSTSIN  DD   DSN=SYS3.TFU.PARMLIB(ALTBPCL1),DISP=SHR
