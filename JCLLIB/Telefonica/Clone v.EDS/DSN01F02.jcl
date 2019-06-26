//DSN01F02 JOB (%%ODAY.%%OMONTH,%%OYEAR%%.DP),00300.CONTROLM,
//         CLASS=4,MSGCLASS=V,REGION=0M
/*ROUTE XEQ NJE1
/*JOBPARM S=MVSB
//*
//*-------------------------------------------------------------------*
//* COMANDO ASSINCRONO PARA COLOCAR DISCOS BCV'S DO CLONE OFFLINE     *
//* EM CASO DE PROBLEMAS ACIONAR SUPORTE DB2                          *
//* CONTROLADORAS  SMC8, SMC9 E SMC16                                 *
//*-------------------------------------------------------------------*
//OFFLINE    EXEC  PGM=IEBGENER
//SYSPRINT   DD    SYSOUT=*
//SYSUT2     DD    SYSOUT=(A,INTRDR),DCB=BLKSIZE=80
//SYSIN      DD    DUMMY
//SYSUT1     DD   DSN=SYS3.TFU.PARMLIB(OFFLINE),DISP=SHR
//*-------------------------------------------------------------------*
//* COMANDO DE WAIT PARA AGUARDAR DISCOS ENTRAREM EM OFFLINE, 90 SEG  *
//*-------------------------------------------------------------------*
//IOAWAIT  EXEC IOATEST
WAIT=90
/*
