//DSN01F04 JOB (%%ODAY.%%OMONTH,%%OYEAR%%.DP),00300.CONTROLM,
//         CLASS=O,MSGCLASS=V,REGION=0M
//*
/*ROUTE XEQ NJE1
/*JOBPARM S=MVSF
//*
//*-------------------------------------------------------------------*
//* EFETUA O RE-ESTABLISH DOS DADOS EM CASO DE PROBLEMAS ACIONAR O    *
//* SUPORTE DB2                                                       *
//*                                                                   *
//* CONTROLADORA   SMC8                                               *
//*-------------------------------------------------------------------*
//STEP01  EXEC PGM=EMCTF
//STEPLIB DD   DSN=SYS3.STFX560.LINKLIB,DISP=SHR
//*TEPLIB DD   DSN=SYS3.STFX530.LINKLIB,DISP=SHR
//SYSOUT  DD   SYSOUT=*
//SYSIN   DD   DSN=SYS3.TFU.PARMLIB(REESTA01),DISP=SHR
