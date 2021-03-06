//DSN01F21 JOB (%%ODAY.%%OMONTH,%%OYEAR%%.DP),00300.CONTROLM,
//         CLASS=O,MSGCLASS=V,REGION=0M,COND=(4,LT)
/*ROUTE XEQ NJE1
/*JOBPARM S=MVSB
//*
//*******    PROCEDIMENTOS DE RESTART PARA O GRUPO DE DBA  ******
//*** EM CASO DE ABEND OU COND > 4 EM QUALQUER STEP:
//*   O JOB SERA INTERROMPIDO E DEVERA:
//*    --- SER ANALISADO E ERROS DEVEM SER TRATADOS
//*    --- SER RESTARTED NESTE STEP SE NECESSARIO
//*    --- SER RESTARTED NO PROXIMO STEP APOS ANALISE DEVIDA
//***
//*******    MUITA ATENCAO      *******  *********  **************
//*   O STEP --- ALTER --- E INTERROMPIDO AUTOMATICAMENTE APOS 10 ERRORS
//*   PORTANTO VERIFIQUE A SE O ULTIMO ELEMENTO FOI EXECUTADO ANTES
//*   DE SOLICITAR O RESTART DESTE STEP.
//*    --- PESQUISAR POR 'ALTER TABLESPACE TFCATF0.TF*'
//*      - SE TIVER O COMANDO ACIMA, INDICA QUE O STEP EXECUTOU ATE FIM
//*      - ASSIM, TRATAR APENAS OS COMANDOS COM ERRO, SE NECESSARIO
//*    --- PESQUISAR POR 'SQLERROR ON   ALTER'
//*      - SE TIVER 11 OCORRENCIAS DA MENSAGEM ACIMA, INDICA QUE O STEP
//*        FOI INTERROMPIDO;
//*      - DEVERA SER RETOMADO, OBRIGATORIAMENTE
//*        --- CASO QUEIRA, EDIT O ARQUIVO DE ENTRADA
//*        --- REMOVA OS OBJETOS QUE JA FORAM EXECUTADOS - OK
//*        --- REMOVA OS OBJETOS COM ERROS SEM IMPACTOS (NAO CLONADOS)
//*        --- RESTART O JOB NESTE STEP
//*
//PROCEDIM JCLLIB ORDER=SYS3.TFU.PROCLIB
//         SET  DSN=D2C1  ** BANCO CLONE DESTINO
//         SET  SYSEXEC=SYS3.TFU.REXX
//*
//***********************************************************
//*  CRIACAO DOS STORAGES GROUPS DO CLONE
//***********************************************************
//CREASTG  EXEC PGM=IKJEFT01,DYNAMNBR=20
//STEPLIB  DD  DISP=SHR,DSN=D2C1.RUNLIB.LOAD
//         DD  DISP=SHR,DSN=D2C1.SDSNEXIT
//         DD  DISP=SHR,DSN=D2C1.SDSNLOAD
//SYSUT1   DD  UNIT=SYSDA,SPACE=(CYL,(500,300),,,ROUND)
//SORTOUT  DD  UNIT=SYSDA,SPACE=(CYL,(500,300),,,ROUND)
//SORTWK01 DD  UNIT=SYSDA,SPACE=(CYL,(500,200),,,ROUND)
//SYSTSPRT DD  SYSOUT=*
//SYSPRINT DD  SYSOUT=*
//SYSUDUMP DD  SYSOUT=*
//SYSTSIN  DD  *
 DSN SYSTEM(D2C1)
 RUN  PROGRAM(DSNTEP2) PLAN(DSNTEP71) PARMS('/ALIGN(LHS)')
 END
//*
//SYSIN    DD *
CREATE STOGROUP CLONEAS  VOLUMES('*') VCAT D2C1AS;
CREATE STOGROUP CLONEAC  VOLUMES('*') VCAT D2C1AC;
CREATE STOGROUP CLONECO  VOLUMES('*') VCAT D2C1CO;
CREATE STOGROUP CLONEFA  VOLUMES('*') VCAT D2C1FA;
CREATE STOGROUP CLONEIN  VOLUMES('*') VCAT D2C1IN;
CREATE STOGROUP CLONDFLT VOLUMES('*') VCAT D2C1;
//*
//***********************************************************
//* MONTA COMANDO DE STOP NOS DATABASES PARA MUDAR DE STORAGE GROUP
//* CRIA ARQUIVO ATISADM.TMP.STOP QUE PODE SER MANIPULADO PELO
//* GRUPO DE DBA CASO OCORRA PROBLEMAS NO PROXIMO STEP
//***********************************************************
//STOP01   EXEC PGM=IKJEFT01,DYNAMNBR=20
//STEPLIB  DD   DSN=D2C1.RUNLIB.LOAD,DISP=SHR
//         DD   DSN=D2C1.SDSNEXIT,DISP=SHR
//         DD   DSN=D2C1.SDSNLOAD,DISP=SHR
//SYSTSPRT DD   SYSOUT=*
//SYSPRINT DD   SYSOUT=*
//SYSPUNCH DD   DUMMY
//SYSREC00 DD   DSN=ATISADM.TMP.STOP,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(TRK,(350,1500),RLSE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0)
//SYSUDUMP DD   SYSOUT=*
//SYSTSIN  DD   *
 DSN SYSTEM(D2C1)
 RUN PROGRAM(DSNTIAUL) PLAN(DSNTIB71) PARM('SQL')
 END
//*
//SYSIN    DD   *
SELECT
CHAR('-STOP DB('||STRIP(NAME)||') SPACENAM(*)')
  FROM SYSIBM.SYSDATABASE
 WHERE CREATOR IN ('ATISOWN','ATISADM','ASDB21','ASSCCD1','TELESP')
 OR NAME = 'FAITGLDB'
;
//*
//***********************************************************
//*   EXECUTA OS COMANDOS DE STOP NOS BANCOS DE DADOS
//*   DELETA ARQ ATISADM.TMP.STOP QUANDO TERMINA COM CODE 0
//***********************************************************
//STOPDB   EXEC PGM=IKJEFT01,DYNAMNBR=20
//STEPLIB  DD DSN=D2C1.SDSNEXIT,DISP=SHR                                00420003
//         DD DSN=D2C1.SDSNLOAD,DISP=SHR                                00410003
//SYSPRINT DD SYSOUT=*                                                  00500000
//SYSUDUMP DD SYSOUT=*                                                  00510000
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD DSN=SYS3.TFU.JCLLIB(D2C1),DISP=SHR
//         DD DSN=ATISADM.TMP.STOP,DISP=(OLD,DELETE,KEEP)
//         DD DSN=SYS3.TFU.JCLLIB(END),DISP=SHR
//*
//***********************************************************
//*   CRIA OS COMANDOS DE ALTER STORAGE GRUPO
//***********************************************************
//CRIALTER EXEC PGM=IKJEFT01,DYNAMNBR=20
//STEPLIB  DD   DSN=D2C1.RUNLIB.LOAD,DISP=SHR
//         DD   DSN=D2C1.SDSNEXIT,DISP=SHR
//         DD   DSN=D2C1.SDSNLOAD,DISP=SHR
//SYSTSPRT DD   SYSOUT=*
//SYSPRINT DD   SYSOUT=*
//SYSPUNCH DD   DUMMY
//SYSREC00 DD   DSN=ATISADM.TMP.ALTER,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(TRK,(350,1500),RLSE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0)
//SYSUDUMP DD   SYSOUT=*
//SYSTSIN  DD   *
 DSN SYSTEM(D2C1)
 RUN PROGRAM(DSNTIAUL) PLAN(DSNTIB71) PARM('SQL')
 END
//*
//SYSIN    DD   *
SELECT DISTINCT
CHAR('ALTER TABLESPACE '||STRIP(B.DBNAME)||'.'||STRIP(B.TSNAME)||
     ' USING STOGROUP CLONE'||SUBSTR(B.VCATNAME,5,2)||
     CASE WHEN PARTITION = 0 THEN ';'
          WHEN PARTITION > 0 THEN ' PART '||STRIP(CHAR(PARTITION))||';'
     END
     )
  FROM SYSIBM.SYSTABLESPACE A,
       SYSIBM.SYSTABLEPART B
 WHERE SUBSTR(B.VCATNAME,1,4) = 'D2P1'
   AND A.DBNAME = B.DBNAME
   AND A.NAME = B.TSNAME
   AND A.CREATOR IN ('ATISOWN','ATISADM','ASDB21','ASSCCD1',
                     'TELESP')
   AND A.NAME NOT LIKE 'TRDC%' AND A.NAME NOT LIKE 'GOFP%'
UNION
SELECT DISTINCT
CHAR('ALTER INDEX '||STRIP(A.CREATOR)||'.'||STRIP(A.NAME)||
     ' USING STOGROUP CLONE'||SUBSTR(B.VCATNAME,5,2)||
     CASE WHEN PARTITION = 0 THEN ';'
          WHEN PARTITION > 0 THEN ' PART '||STRIP(CHAR(PARTITION))||';'
     END
     )
  FROM SYSIBM.SYSINDEXES A,
       SYSIBM.SYSINDEXPART B
 WHERE SUBSTR(B.VCATNAME,1,4) = 'D2P1'
   AND A.CREATOR = B.IXCREATOR
   AND A.NAME = B.IXNAME
   AND A.CREATOR IN ('ATISOWN','ATISADM','ASDB21','ASSCCD1',
                     'TELESP')
   AND A.NAME NOT LIKE 'TRDC%' AND A.NAME NOT LIKE 'GOFP%'
;
//*-------------------------------------------------------------------
//* EXECUTA REXX - REMOVE NULLS DO RESULTADO ACIMA
//* CRIA ARQUIVO ATISADM.TMP.ALTER.RESULT QUE PODE SER MANIPULADO PELO
//* GRUPO DE DBA CASO OCORRA PROBLEMAS NO PROXIMO STEP
//*-------------------------------------------------------------------
//RMNULL   EXEC PGM=IKJEFT01,DYNAMNBR=20,PARM='%RMNULL'
//SYSEXEC  DD DSN=&SYSEXEC,DISP=SHR
//SYSTSPRT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSTSIN  DD DUMMY
//INFILE   DD DSN=ATISADM.TMP.ALTER,DISP=(OLD,DELETE,KEEP)
//OUTFILE  DD DSN=ATISADM.TMP.ALTER.RESULT,
//         DISP=(NEW,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,(5,3),RLSE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0)
//*-------------------------------------------------------------------
//* EXECUTA OS COMANDOS DE ALTER NO D2C1 GERADOS ACIMA
//* DELETA ARQ ATISADM.TMP.ALTER.RESULT QUANDO TERMINA COM CODE 0
//*-------------------------------------------------------------------
//ALTER    EXEC PGM=IKJEFT01,DYNAMNBR=20
//STEPLIB  DD  DISP=SHR,DSN=D2C1.RUNLIB.LOAD
//         DD  DISP=SHR,DSN=D2C1.SDSNEXIT
//         DD  DISP=SHR,DSN=D2C1.SDSNLOAD
//SYSUT1   DD  UNIT=SYSDA,SPACE=(CYL,(500,300),,,ROUND)
//SORTOUT  DD  UNIT=SYSDA,SPACE=(CYL,(500,300),,,ROUND)
//SORTWK01 DD  UNIT=SYSDA,SPACE=(CYL,(500,200),,,ROUND)
//SYSDISC  DD  UNIT=SYSDA,SPACE=(CYL,(20,10),,,ROUND)
//SYSERR   DD  UNIT=SYSDA,SPACE=(CYL,(20,10),,,ROUND)
//SYSMAP   DD  UNIT=SYSDA,SPACE=(CYL,(20,10),,,ROUND)
//SYSTSPRT DD  SYSOUT=*
//SYSPRINT DD  SYSOUT=*
//SYSUDUMP DD  SYSOUT=*
//SYSTSIN  DD  *
 DSN SYSTEM(D2C1)
 RUN  PROGRAM(DSNTEP2) PLAN(DSNTEP71) PARMS('/ALIGN(LHS)')
 END
//*
//SYSIN    DD DSN=ATISADM.TMP.ALTER.RESULT,DISP=(OLD,DELETE,KEEP)
//*
//********************************************************************
//* MONTA COMANDO DE START NOS DATABASES  APOS MUDANCA DE STOGROUP
//********************************************************************
//START01  EXEC PGM=IKJEFT01,DYNAMNBR=20
//STEPLIB  DD   DSN=D2C1.RUNLIB.LOAD,DISP=SHR
//         DD   DSN=D2C1.SDSNEXIT,DISP=SHR
//         DD   DSN=D2C1.SDSNLOAD,DISP=SHR
//SYSTSPRT DD   SYSOUT=*
//SYSPRINT DD   SYSOUT=*
//SYSPUNCH DD   SYSOUT=*
//SYSREC00 DD   DSN=ATISADM.TMP.START,DISP=(,CATLG,DELETE),
//         UNIT=SYSDA,SPACE=(TRK,(350,1500),RLSE),
//         DCB=(LRECL=80,RECFM=FB,BLKSIZE=0)
//SYSUDUMP DD   SYSOUT=*
//SYSTSIN  DD   *
 DSN SYSTEM(D2C1)
 RUN PROGRAM(DSNTIAUL) PLAN(DSNTIB71) PARM('SQL')
 END
//*
//SYSIN    DD   *
SELECT
CHAR('-START DB('||STRIP(NAME)||') SPACENAM(*) ACCESS(RW)')
  FROM SYSIBM.SYSDATABASE
 WHERE CREATOR IN ('ATISOWN','ATISADM','ASDB21','ASSCCD1','TELESP')
;
//*
//***********************************************************
//*   EXECUTA OS COMANDOS DE START NOS BANCOS DE DADOS
//***********************************************************
//STARTDB  EXEC PGM=IKJEFT01,DYNAMNBR=20,COND=EVEN
//STEPLIB  DD DSN=D2C1.SDSNEXIT,DISP=SHR                                00420003
//         DD DSN=D2C1.SDSNLOAD,DISP=SHR                                00410003
//SYSPRINT DD SYSOUT=*                                                  00500000
//SYSUDUMP DD SYSOUT=*                                                  00510000
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD DSN=SYS3.TFU.JCLLIB(D2C1),DISP=SHR
//         DD DSN=ATISADM.TMP.START,DISP=(OLD,DELETE,KEEP)
//         DD DSN=SYS3.TFU.JCLLIB(END),DISP=SHR
//*
//*-------------------------------------------------------------------
//* EXECUTA O  COMANDO  DE STOP EM BANCO DE DADOS DE CONTROLE DO DB2
//* QUE ESTAO EM STORAGE GROUP
//*-------------------------------------------------------------------
//STOP02   EXEC PGM=IKJEFT01
//STEPLIB  DD   DSN=D2C1.SDSNLOAD,DISP=SHR
//         DD   DSN=D2C1.SDSNEXIT,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//SYSTSPRT DD   SYSOUT=*
//SYSTSIN  DD   *
 DSN SYSTEM(D2C1)
 -STOP  DB(DSNDB06) SPACENAM(SQLACX01)
 -STOP  DB(DSNDB06) SPACENAM(SQLATX01)
 -STOP  DB(DSNDB06) SPACENAM(SQLDLX01)
 -STOP  DB(DSNDB06) SPACENAM(SQLDTX01)
 -STOP  DB(DSNDB06) SPACENAM(SQLFRN01)
 END
//*
//*-------------------------------------------------------------------
//* EXECUTA OS COMANDOS DE ALTER NOS BANCOS DE DADOS DE CONTROLE DO
//* DB2
//*-------------------------------------------------------------------
//ALTER02   EXEC PGM=IKJEFT01,DYNAMNBR=20,REGION=4M
//STEPLIB   DD DSN=D2C1.RUNLIB.LOAD,DISP=SHR
//          DD DSN=D2C1.SDSNEXIT,DISP=SHR
//          DD DSN=D2C1.SDSNLOAD,DISP=SHR
//SYSTSPRT  DD SYSOUT=*
//SYSPRINT  DD SYSOUT=*
//SYSUDUMP  DD SYSOUT=*
//SYSTSIN   DD *
 DSN  SYSTEM(D2C1)
 RUN PROGRAM(DSNTEP2) PLAN(DSNTEP71)
 END
/*
//SYSIN    DD *
 ALTER INDEX SYSIBM.SQLACX01 USING STOGROUP CLONDFLT ;
 ALTER INDEX SYSIBM.SQLATX01 USING STOGROUP CLONDFLT ;
 ALTER INDEX SYSIBM.SQLDLX01 USING STOGROUP CLONDFLT ;
 ALTER INDEX SYSIBM.SQLDTX01 USING STOGROUP CLONDFLT ;
 ALTER INDEX SYSIBM.SQLFRN01 USING STOGROUP CLONDFLT ;
/*
//*
//*-------------------------------------------------------------------
//* EXECUTA O  COMANDO  DE START EM BANCO DE DADOS DE CONTROLE DO DB2
//* QUE ESTAO EM STORAGE GROUP
//*-------------------------------------------------------------------
//START02  EXEC PGM=IKJEFT01
//STEPLIB  DD   DSN=D2C1.SDSNLOAD,DISP=SHR
//         DD   DSN=D2C1.SDSNEXIT,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//SYSTSPRT DD   SYSOUT=*
//SYSTSIN  DD   *
 DSN SYSTEM(D2C1)
 -START DB(DSNDB06) SPACENAM(SQLACX01)
 -START DB(DSNDB06) SPACENAM(SQLATX01)
 -START DB(DSNDB06) SPACENAM(SQLDLX01)
 -START DB(DSNDB06) SPACENAM(SQLDTX01)
 -START DB(DSNDB06) SPACENAM(SQLFRN01)
 END
/*
//*-------------------------------------------------------------------
//* EXECUTA O  COMANDOS ADICIONAIS DE FINAL DE CLONE
//*-------------------------------------------------------------------
//STOP03   EXEC PGM=IKJEFT01
//STEPLIB  DD   DSN=D2C1.SDSNLOAD,DISP=SHR
//         DD   DSN=D2C1.SDSNEXIT,DISP=SHR
//SYSPRINT DD   SYSOUT=*
//SYSTSPRT DD   SYSOUT=*
//SYSTSIN  DD   DSN=SYS3.TFU.PARMLIB(STOTSF21),DISP=SHR
/*
