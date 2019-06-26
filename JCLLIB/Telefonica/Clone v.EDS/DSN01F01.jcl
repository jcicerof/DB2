//DSN01F01 JOB (%%ODAY.%%OMONTH,%%OYEAR%%.DP),00300.CONTROLM,
//         CLASS=4,MSGCLASS=V,REGION=0M
//*
/*ROUTE XEQ NJE1
/*JOBPARM S=MVSF
//*
//*
//*
//*-------------------------------------------------------------------*
//*-   VERIFICA JOBS/UTILITARIOS PENDENTES NO D2P1 -  12/2005        -*
//*-------------------------------------------------------------------*
//* PROCESSO INICIAL DO TIMEFINDER DB2 ATIS - CLONE                   *
//* VERIFICA SE EXISTEM UTILITARIOS PENDENTES NO DB2 ATIS  - D2P1 -   *
//* CASO O RETURN CODE SEJA ZERO CONTINUAR O PROCESSO DE CLONE        *
//* SE O RETURN-CODE FOR 1000  EFETUA 10 TENTATIVAS VIA CONTROLE      *
//* DO CONTROL-M E DEPOIS TERMINA, CASO O PROBLEMA NAO SEJA RESOLVIDO *
//* ALGUM UTILITARIO DE LOAD/REORG/RECOVERY ESTA EM EXECUCAO          *
//* O DBA DEVE VERIFICAR COM A PRODUCAO/TELEFONICA SE O PROCESSO DO   *
//* CLONE DEVE EXECUTAR OU SER SUSPENSO .                             *
//* SE O RETURN-CODE FOR 2000  PARALIZA O PROCESSO                    *
//* ALGUM UTILITARIO DE LOAD/REORG/RECOVERY ESTA ABENDADO E O         *
//* PROCESSO DE CLONAGEM SOMENTE DEVE CONTINUAR APOS A SOLUCAO DESTE  *
//* PROBLEMA. O DBA DEVE SER CONTACTADO .                             *
//*                                                                   *
//* ATENCAO ATENCAO ATENCAO ATENCAO ATENCAO ATENCAO ATENCAO ATENCAO   *
//* O SUPORTE DB2 NAO DEVE SER ACIONADO                               *
//* ATENCAO ATENCAO ATENCAO ATENCAO ATENCAO ATENCAO ATENCAO ATENCAO   *
//*                                                                   *
//*-------------------------------------------------------------------*
//ST0001   EXEC PGM=IKJEFT01
//STEPLIB  DD   DSN=D2P1.V7R1M0.SDSNLOAD,DISP=SHR
//         DD   DSN=D2P1.V7R1M0.SDSNEXIT,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//SYSTSPRT DD   SYSOUT=*
//SYSTSIN  DD   *
 DSN SYSTEM(D2P1)
 -DIS UTIL(*)
 END
/*
//*-------------------------------------------------------------------*
//STRT01   EXEC PGM=IKJEFT01
//*------------------------------------------------------------------*
//* EFETUA O DISPLAY UTIL NO D2P1                                    *
//*------------------------------------------------------------------*
//STEPLIB  DD   DSN=D2P1.V7R1M0.SDSNLOAD,DISP=SHR
//         DD   DSN=D2P1.V7R1M0.SDSNEXIT,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//SYSTSPRT DD   DSN=SYS7.D2P1.UTIL,DISP=(,CATLG,DELETE),UNIT=SYSDA,
//         SPACE=(TRK,1)
//SYSTSIN  DD   DSN=SYS3.TFU.PARMLIB(TFSYS01),DISP=SHR
/*
//IEB002   EXEC PGM=IEBGENER,COND=(4,LT)
//*-------------------------------------------------------------------*
//* IEBGENER COM A FUNCAO DE TRANSFORMAR O REGISTRO EM FIXO           *
//*-------------------------------------------------------------------*
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=SYS7.D2P1.UTIL,DISP=(OLD,DELETE)
//SYSUT2   DD DSN=SYS7.D2P1.UTIL.FIXO,DISP=(,CATLG,DELETE),
//            DCB=(LRECL=137,RECFM=FB,BLKSIZE=3151),UNIT=SYSDA,
//            SPACE=(CYL,(01,1),RLSE)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFSYS02),DISP=SHR
//*
//SORT03   EXEC  PGM=SORT,REGION=0M,COND=(4,LT)
//*-------------------------------------------------------------------*
//*  SELECIONA OS RBAS DO BSDS SOURCE                                 *
//*-------------------------------------------------------------------*
//SORTLIB  DD DSN=CTB.SORTLIB,DISP=SHR
//SYSOUT   DD SYSOUT=*
//SORTMSG  DD SYSOUT=*
//SORTIN   DD DSN=SYS7.D2P1.UTIL.FIXO,DISP=(OLD,DELETE)
//SORTOUT  DD DSN=SYS7.D2P1.UTIL.SORT,
//          DISP=(,CATLG,DELETE),UNIT=SYSDA,
//          SPACE=(CYL,(1,1),RLSE),DCB=(LRECL=137,BLKSIZE=0)
//SYSIN    DD DSN=SYS3.TFU.PARMLIB(TFSYS03),DISP=SHR
//*
//C        EXEC PGM=ASMA90,PARM=(NODECK,OBJECT),COND=(4,LT)
//*-------------------------------------------------------------------*
//*  COMPILACAO PGMS ASSEMBLER                                        *
//*-------------------------------------------------------------------*
//SYSLIB   DD  DSN=SYS1.MACLIB,DISP=SHR
//SYSUT1   DD  DSN=&&SYSUT1,SPACE=(4096,(120,120),,,ROUND),UNIT=VIO,
//             DCB=BUFNO=1
//SYSPRINT DD  SYSOUT=*
//SYSLIN   DD  DSN=&&OBJ,SPACE=(3040,(40,40),,,ROUND),UNIT=VIO,
//             DISP=(MOD,PASS),
//             DCB=(BLKSIZE=3040,LRECL=80,RECFM=FBS,BUFNO=1)
//SYSIN    DD  DISP=SHR,DSN=SYS3.TFU.PARMLIB(PGMCLONE)
//*
//L        EXEC PGM=HEWL,PARM='MAP,LET,LIST',COND=(8,LT,C)
//*-------------------------------------------------------------------*
//*  LINKEDICAO PGMS ASSEMBLER                                        *
//*-------------------------------------------------------------------*
//SYSLIN   DD  DSN=&&OBJ,DISP=(OLD,DELETE)
//         DD  DDNAME=SYSIN
//SYSLMOD  DD  DISP=(,PASS),UNIT=SYSDA,SPACE=(CYL,(1,1,1)),
//             DSN=&&GOSET(GO)
//SYSUT1   DD  DSN=&&SYSUT1,SPACE=(1024,(120,120),,,ROUND),UNIT=VIO,
//             DCB=BUFNO=1
//SYSPRINT DD  SYSOUT=*
//*
//G        EXEC PGM=*.L.SYSLMOD,COND=((8,LT,C),(8,LT,L))
//*-------------------------------------------------------------------*
//*  EXECUCAO  PGM  ASSEMBLER  PGMCLONE                               *
//*-------------------------------------------------------------------*
//INPUT1   DD   DSN=SYS7.D2P1.UTIL.SORT,DISP=(OLD,DELETE)
//*
//
