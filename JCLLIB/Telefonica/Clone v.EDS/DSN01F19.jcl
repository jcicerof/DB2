//DSN01F19 JOB (%%ODAY.%%OMONTH,%%OYEAR%%.DP),00300.CONTROLM,
//         CLASS=O,MSGCLASS=V,REGION=0M
//*
/*ROUTE XEQ NJE1
/*JOBPARM S=MVSB
//*
//PROCEDIM JCLLIB ORDER=SYS3.TFU.JCLLIB
//         SET  DSN=D2C1  ** BANCO CLONE DESTINO
//*        SET  SYSEXEC=SYS3.TFU.REXX
//*------------------------------------------------------------------*
//* EXECUTA START PARA PROBLEMA TABLESPACE EM  LPL REPAIR LEVELID    *
//* EM CASO DE PROBLEMAS ACIONAR O DBA                               *
//* O SUPORTE DB2 SOMENTE DEVERA SER ACIONADO APOS ANALISE DO DBA    *
//*------------------------------------------------------------------*
//*DPREPAIR EXEC PGM=DSNUTILB,REGION=8M,PARM='D2C1,DBARR'
//*STEPLIB  DD DSN=D2C1.V7R1M0.SDSNLOAD,DISP=SHR
//*SYSPRINT DD SYSOUT=*
//*UTPRINT  DD SYSOUT=*
//*SYSUDUMP DD SYSOUT=*
//*SYSIN    DD *
//*REPAIR LEVELID TABLESPACE DSNDB06.SYSCOPY
//*REPAIR LEVELID TABLESPACE DSNDB06.SYSDDF
//*REPAIR LEVELID TABLESPACE DSNDB06.SYSPKAGE
//*REPAIR LEVELID TABLESPACE DSNDB06.SYSSTATS
//*-------------------------------------------------------------------
//* CRIA OS COMANDOS DE START TABLESPACE LPL
//*-------------------------------------------------------------------
//START01  EXEC DSNTIAUL,DSN=&DSN,DDIN=DUMMY,DDOUT=DUMMY
//DSNTIAUL.SYSREC00 DD DSN=&&STRTTS,
//    DISP=(NEW,PASS,DELETE),DCB=(LRECL=80,RECFM=FB,BLKSIZE=27920),
//    UNIT=SYSDA,SPACE=(CYL,(5,5),RLSE)
//DSNTIAUL.SYSPUNCH DD SYSOUT=*
//DSNTIAUL.SYSIN    DD *
  SELECT
  CHAR('-START DB('||STRIP(DBNAME)||') SPACENAM('||STRIP(NAME)||')
  ACCESS(FORCE)')
  FROM SYSIBM.SYSTABLESPACE
  WHERE CREATOR IN ('ATISOWN','ATISADM','ASDB21','ASSCCD1','SYSIBM',
  'TELESP')
  AND NAME NOT LIKE 'TRDC%' AND NAME NOT LIKE 'GOFP%'
  ;
//*-------------------------------------------------------------------
//* START TABLESPACE LPL
//*-------------------------------------------------------------------
//START02  EXEC STARTDB,DSN=&DSN
//START.SYSTSIN DD
//              DD DSN=&&STRTTS,DISP=(OLD,DELETE,DELETE)
//              DD
//*-------------------------------------------------------------------
//* EXECUTA START PARA PROBLEMA INDEXSPACE EM  LPL
//*-------------------------------------------------------------------
//*-------------------------------------------------------------------
//* CRIA OS COMANDOS DE START INDEXSPACE LPL
//*-------------------------------------------------------------------
//START03  EXEC DSNTIAUL,DSN=&DSN,DDIN=DUMMY,DDOUT=DUMMY
//DSNTIAUL.SYSREC00 DD DSN=&&STRTIX,
//    DISP=(NEW,PASS,DELETE),DCB=(LRECL=80,RECFM=FB,BLKSIZE=27920),
//    UNIT=SYSDA,SPACE=(CYL,(5,5),RLSE)
//DSNTIAUL.SYSPUNCH DD SYSOUT=*
//DSNTIAUL.SYSIN    DD *
 SELECT
 CHAR('-START DB('||STRIP(DBNAME)||') SPACENAM('||STRIP(INDEXSPACE)||')
 ACCESS(FORCE)')
 FROM SYSIBM.SYSINDEXES
 WHERE CREATOR IN ('ATISOWN','ATISADM','ASDB21','ASSCCD1','SYSIBM',
 'TELESP')
  AND INDEXSPACE NOT LIKE 'TRDC%' AND INDEXSPACE NOT LIKE 'GOFP%'
  ;
//*-------------------------------------------------------------------
//* START TABLESPACE LPL
//*-------------------------------------------------------------------
//START04  EXEC STARTDB,DSN=&DSN
//START.SYSTSIN DD
//              DD DSN=&&STRTIX,DISP=(OLD,DELETE,DELETE)
//              DD
//
