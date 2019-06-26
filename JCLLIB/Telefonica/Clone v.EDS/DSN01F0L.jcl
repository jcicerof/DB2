//DSN01F0L JOB (%%ODAY.%%OMONTH,%%OYEAR%%.DP),00300.CONTROLM,
//         CLASS=O,MSGCLASS=V,REGION=0M
/*ROUTE XEQ NJE1
/*JOBPARM S=MVSF
//*
//*-------------------------------------------------------------------*
//* PROCESSO DE WAIT PARA VERIFICACAO POSTERIOR DO BLOQUEIO           *
//* DE LOG DO D2P1
//*-------------------------------------------------------------------*
//IOATEST2 EXEC IOATEST
WAIT=300
/*
//*-------------------------------------------------------------------*
//* EMITE COMANDO DE DISPLAY LOG NO D2P1 PARA VERIFICAR SE A LOG ESTA *
//* BLOQUEADA. CASO ESTEJA UM PROCESSO DE AUMOTACAO SERA ATIVADO      *
//* PARA LIBERAR O LOG E ENVIAR UMA NOTA PARA ACIONAMENTO AO GRUPO DE *
//* SUPORTE                                                           *
//*-------------------------------------------------------------------*
//STEP01     EXEC  PGM=IEBGENER
//SYSPRINT   DD    SYSOUT=*
//SYSUT2     DD    SYSOUT=(A,INTRDR),DCB=BLKSIZE=80
//SYSIN      DD    DUMMY
//SYSUT1     DD   DATA,DLM='XX'
/*$VS,'RO (MVSF),-D2P1 DIS LOG'
/*EOF
XX
