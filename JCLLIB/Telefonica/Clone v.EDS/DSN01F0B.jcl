//DSN01F0B JOB (%%ODAY.%%OMONTH,%%OYEAR%%.DP),00300.CONTROLM,
//         CLASS=O,MSGCLASS=V,REGION=0M
//*
/*ROUTE XEQ NJE1
/*JOBPARM S=MVSF
//*
//**********************************************************************
//*  PROCESSO DE SPLIT NOS DISCOS CLONADOS                             *
//*  EM CASO DE PROBLEMAS ACIONAR O SUPORTE DB2                        *
//*  SPLIT NA CONTROLADORA  SMC16                                      *
//**********************************************************************
//*********************************************************************
//*****>>>>       ATENCAO   ATENCAO   ATENCAO                 <<<<*****
//*                                                                   *
//*      QUALQUER PROBLEMA NESTA ETAPA O PLANTAO DB2-SUPORTE          *
//*      DEVE SER ACIONADO IMEDIATAMENTE NO TELEFONE 9913-3698        *
//*                                                                   *
//*********************************************************************
//*************>            INFORMATIVO                <***************
//* A CADEIA DE JOBS DSN01F06 A DSN01F09 E DSN01F0B SUSPENDE E LIBERA *
//* O PROCESSO DE LOG DO D2P1 QUALQUER ABEND EM UMA DAS ROTINAS ACIMA *
//* CAUSARA ABENDS NAS ROTINAS DE PRODUCAO POR INDISPONIBILIDADE DE   *
//* RECURSO (LOCK FAILED)                                             *
//*********************************************************************
//*
//EMCTF   EXEC PGM=EMCTF
//STEPLIB   DD DSN=SYS3.STFX560.LINKLIB,DISP=SHR
//*TEPLIB   DD DSN=SYS3.STFX530.LINKLIB,DISP=SHR
//SYSOUT    DD   SYSOUT=*
//SYSIN     DD   DSN=SYS3.TFU.PARMLIB(SPLIT03),DISP=SHR
//
