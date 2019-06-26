//DBA1024X JOB (PRD20,DB2),'SQL GGM',CLASS=U,MSGCLASS=X,NOTIFY=&SYSUID
//*----------------------------------------------------------------*
//* LISTCAT COM OPCAO LEVEL OU ENTRIES                             *
//* ATENCAO: NA OPCAO LEVEL PRECISA USAR CDILVL PARA QUE O LISTCAT *
//*          PRODUZA INFORMACOES DO CLUSTER E DO DATA              *
//* EXEMPLOS:                                                      *
//*----------------------------------------------------------------*
//* LISTC ALL CDILVL LVL(CDWDB2.DSNDBC)                            *
//* ==> PARA TODOS OS DATASETS DO DB2W                             *
//*----------------------------------------------------------------*
//* LISTC ALL CDILVL LVL(CDWDB2.DSNDBC.PCUXD01A)                   *
//* ==> PARA TODOS OS DATASETS DO DATABASE PCUXD01A                *
//*----------------------------------------------------------------*
//* LISTC ALL ENT(CDWDB2.DSNDBC.EXPLD01A.DETCOSTR.I0001.A001)      *
//* ==> PARA UM SINGLE DATASET                                     *
//*----------------------------------------------------------------*
//LISTCAT  EXEC PGM=IDCAMS
//SYSPRINT  DD  DSN=&LISTC,DISP=(,PASS),SPACE=(CYL,(5,5))
//SYSIN     DD  *
 LISTC ALL CDILVL LVL(PRDDB2.DSNDBC)
//*
//*----------------------------------------------------------------*
//* GERA UMA RELACAO DOS DATASETS NON SMS C/ CISZ E SPACE P/DEFCL  *
//*----------------------------------------------------------------*
//REXXSEL   EXEC  PGM=IKJEFT01,COND=(0,NE)
//SYSTSIN    DD   *
 EX 'DBA1024.DB2.CNTL.CHG39939(REXXSEL)'
//SYSTSPRT   DD   SYSOUT=*
//INPUT      DD   DSN=&&LISTC,DISP=(OLD,DELETE)
//OUTPUT     DD   DSN=&&DS,DISP=(,PASS),SPACE=(TRK,(20,5))
//*
//*----------------------------------------------------------------*
//* MONTA OS JOBS DE CONVERSAO                                     *
//* CADA JOB PROCESSA ATE 50 DATASETS                              *
//*----------------------------------------------------------------*
//*
//REXXBLD   EXEC  PGM=IKJEFT01,COND=(0,NE)
//*----------------------------------------------------------------*
//* NO JOBCARD PASSAMOS 3 LINHAS DE JCL QUE SERAO UTILIZADAS PARA  *
//* MONTAR O CARTAO JOB. NO EXEMPLO USAMOS DBAMJ. A REXX IRA COM-  *
//* PLEMENTAR COM O NUMERO DO JOB. EX: DBAMJ1, DBAMJ2, ETC...      *
//*----------------------------------------------------------------*
//JOBCARD    DD   DATA,DLM=XX
//DBAMJ    JOB (PRD20,DB2),'DSN1COPY',
//      CLASS=U,MSGCLASS=X,NOTIFY=&SYSUID
//*
XX
//*--------------------------------------------------------------*
//* PASSAR PARA ESTA REXX 3 PARMS:                               *
//* SSID ==> A REXX FAZ CONEXAO COM O DB2 PARA OBTER INFORMACOES *
//* STOGROUP ==> PARA OS COMANDOS ALTER .... USING STOGROUP      *
//* LIBTEP2 ==> PARA O COMANDO RUN PROGRAM(DSNTEP2) LIB(....)    *
//*--------------------------------------------------------------*
//SYSTSIN    DD   *
 EX 'DBA1024.DB2.CNTL.CHG39939(REXXBLD)' 'DB2P PRDSMS00 +
                       SYSD.DB2P.RUNLIB.LOAD'
//SYSTSPRT   DD   SYSOUT=*
//INPUT      DD   DSN=&&DS,DISP=(OLD,DELETE)
//* JCL MONTADO PARA FAZER AS COPIAS DOS DATASETS
//OUTPUT     DD   SYSOUT=*
