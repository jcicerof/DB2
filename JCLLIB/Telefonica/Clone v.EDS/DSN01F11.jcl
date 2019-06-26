//DSN01F11 JOB (%%ODAY.%%OMONTH,%%OYEAR%%.DP),00300.CONTROLM,
//         CLASS=O,MSGCLASS=V,REGION=0M
/*ROUTE XEQ NJE1
/*JOBPARM S=MVSB
//*
//*-------------------------------------------------------------------*
//* PROCESSO DE RELABEL DOS DISCOS BCV'S DO CLONE                     *
//* EM CASO DE PROBLEMAS ACIONAR SUPORTE DB2                          *
//* SPLIT NA CONTROLADORA  SMC9                                       *
//*-------------------------------------------------------------------*
//STEP01  EXEC PGM=EMCTFU
//STEPLIB DD   DSN=SYS3.STFU540.LINKLIB,DISP=SHR
//*TEPLIB DD   DSN=SYS3.STFX530.LINKLIB,DISP=SHR
//SYSOUT  DD   SYSOUT=*
//TFINPUT DD   DSN=SYS3.TFU.PARMLIB(RELABEL2),DISP=SHR
//
