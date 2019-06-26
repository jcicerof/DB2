//DSN01F12 JOB (%%ODAY.%%OMONTH,%%OYEAR%%.DP),00300.CONTROLM,
//         CLASS=O,MSGCLASS=V,REGION=0M
//*
/*ROUTE XEQ NJE1
/*JOBPARM S=MVSB
//*
//*-------------------------------------------------------------------*
//* PROCESSO QUE EFETUA RENAME HIGH-QUALIFIERS DAS TABELAS DB2        *
//* EM CASO DE PROBLEMAS ACIONAR DBA E SUPORTE DB2                    *
//*-------------------------------------------------------------------*
//STEP01  EXEC PGM=EMCTFU
//STEPLIB DD   DSN=SYS3.STFU540.LINKLIB,DISP=SHR
//*TEPLIB DD   DSN=SYS3.STFX530.LINKLIB,DISP=SHR
//SYSOUT  DD   SYSOUT=*
//TFINPUT DD   DSN=SYS3.TFU.PARMLIB(PROCESS1),DISP=SHR
//
