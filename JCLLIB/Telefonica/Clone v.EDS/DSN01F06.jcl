//DSN01F06 JOB (%%ODAY.%%OMONTH,%%OYEAR%%.DP),00300.CONTROLM,
//         CLASS=O,MSGCLASS=V,REGION=0M,COND=(4,LT)
//*
/*ROUTE XEQ NJE1
/*JOBPARM S=MVSF
//*
//**------------------------------------------------------------------*
//* PROCESSO DE EMISSAO SYSTEM CHECKPOINT DE SET LOG RESUME NO D2P1   *
//* EM CASO DE ABEND CONTACTAR O SUPORTE DB2                          *
//*-------------------------------------------------------------------*
//*********************************************************************
//*****>>>>       ATENCAO   ATENCAO   ATENCAO                 <<<<*****
//*                                                                   *
//*      QUALQUER PROBLEMA NESTA ETAPA O PLANTAO DB2-SUPORTE          *
//*      DEVE SER ACIONADO IMEDIATAMENTE NO TELEFONE 9913-3698        *
//*                                                                   *
//*********************************************************************
//*************>       INFORMATIVO         <***************************
//* A CADEIA DE JOBS DSN01F06 A DSN01F09 E DSN01F0B SUSPENDE E LIBERA *
//* O PROCESSO DE LOG DO D2P1 QUALQUER ABEND EM UMA DAS ROTINAS ACIMA *
//* CAUSARA ABENDS NAS ROTINAS DE PRODUCAO POR INDISPONIBILIDADE DE   *
//* RECURSO (LOCK FAILED)                                             *
//*********************************************************************
//*------------------------------------------------------------------
//THREAD1  EXEC PGM=IKJEFT01
//STEPLIB  DD   DSN=D2P1.V7R1M0.SDSNLOAD,DISP=SHR
//         DD   DSN=D2P1.V7R1M0.SDSNEXIT,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//SYSTSPRT DD   SYSOUT=*
//SYSTSIN  DD   *
 DSN SYSTEM(D2P1)
 -DIS THREAD(DB2*)
 -DIS THREAD(SPC*)
 -DIS THREAD(BAT*)
 -DIS THREAD(UTI*)
 END
/*
//*-------------------------------------------------------------------
//TIMEOUT1 EXEC PGM=PTLDRIVM,PARM='EP=PTTBT2CC'
//STEPLIB  DD  DISP=SHR,DSN=SYS3.PLATINUM.MVSF.LOADLIB
//PTILIB   DD  DISP=SHR,DSN=SYS3.PLATINUM.MVSF.LOADLIB
//PTIPARM  DD  DISP=SHR,DSN=SYS3.PLATINUM.MVSF.PARMLIB
//SYSUDUMP DD  SYSOUT=*
//PTTOUT   DD  SYSOUT=*
//PTTIN    DD  *
  SET DEFAULTS DB2(D2P1)
  SET IRLMRWT VALUE(3600)
/*
//*-------------------------------------------------------------------
//START1   EXEC PGM=IKJEFT01
//STEPLIB  DD   DSN=D2P1.V7R1M0.SDSNLOAD,DISP=SHR
//         DD   DSN=D2P1.V7R1M0.SDSNEXIT,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//SYSTSPRT DD   SYSOUT=*
//SYSTSIN  DD   *
 DSN SYSTEM(D2P1)
 -SET LOG LOGLOAD(0)
 END
/*
//*-------------------------------------------------------------------
//START2   EXEC PGM=IKJEFT01
//STEPLIB  DD   DSN=D2P1.V7R1M0.SDSNLOAD,DISP=SHR
//         DD   DSN=D2P1.V7R1M0.SDSNEXIT,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//SYSTSPRT DD   SYSOUT=*
//SYSTSIN  DD   *
 DSN SYSTEM(D2P1)
 -SET LOG CHKTIME(0)
 END
/*
//*-------------------------------------------------------------------
//START3   EXEC PGM=IKJEFT01
//STEPLIB  DD   DSN=D2P1.V7R1M0.SDSNLOAD,DISP=SHR
//         DD   DSN=D2P1.V7R1M0.SDSNEXIT,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//SYSTSPRT DD   SYSOUT=*
//SYSTSIN  DD   *
 DSN SYSTEM(D2P1)
 -SET LOG SUSPEND
 END
/*
//IOATEST2 EXEC IOATEST
WAIT=30
/*
//
