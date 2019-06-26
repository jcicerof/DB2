//IBM1JCFL JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',
//         MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=L,NOTIFY=IBM1JCF
/*JOBPARM Z=O,HOLD=ALL,S=ESYS,T=1439
//*------------------------------------------------------------------
//*  DB2A - DB2A.DB2LOAD/DB2A.DB2RUNLB
//*  DB2D - DB2S.DB2LOAD/DB2S.DB2RUNLB
//*  DB2J - DB2K.DB2LOAD/DB2K.DB2RUNLB
//*  DB2E - DB2F.DB2LOAD/DB2F.DB2RUNLB
//*  DB2H - DB2H.DB2LOAD/DB2H.DB2RUNLB
//*  DB2P - DB2C.DB2LOAD/DB2C.DB2RUNLB
//*  DB2Q - DB2R.DB2LOAD/DB2R.DB2RUNLB
//*------------------------------------------------------------------
//*-------------------------------------------------------------------
//* SELECT SYSIBM.SYSDATABASE
//*-------------------------------------------------------------------
//DSNTIAUL EXEC PGM=IKJEFT01,DYNAMNBR=100
//STEPLIB  DD DISP=SHR,DSN=DB2A.DB2RUNLB
//         DD DISP=SHR,DSN=DB2A.DB2EXIT
//         DD DISP=SHR,DSN=DB2A.DB2LOAD
//SYSTSPRT DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//SYSTSIN  DD *
 DSN SYSTEM(DB2A)
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIAUL) PARMS('SQL')
 END
//SYSPUNCH DD SYSOUT=*
//SYSREC00 DD DSN=&&TEMP1,DISP=(NEW,PASS,DELETE),
//         UNIT=SYSDA,SPACE=(TRK,(1,1),RLSE)
//SYSIN    DD  *
SELECT
CHAR('  DB='||''''||STRIP(NAME)||''''||',   TS='||''''||''''||';', 80)
  FROM SYSIBM.SYSDATABASE
 WHERE SUBSTR(NAME,1,3) NOT IN ('SYS','DSN')
;
//*------------------------------------------------------------------
//* LISTA OS DATABASES
//*------------------------------------------------------------------
//IEBGENER EXEC PGM=IEBGENER
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
//SYSUT2   DD SYSOUT=*
//SYSUT1   DD DSN=&&TEMP1,DISP=(OLD,PASS,DELETE)
//*-------------------------------------------------------------------
//* CONVERT VB TO FB
//*-------------------------------------------------------------------
//* ICETOOL  EXEC PGM=ICETOOL,REGION=1024K
//* TOOLMSG  DD   SYSOUT=*
//* DFSMSG   DD   SYSOUT=*
//* TOOLIN   DD   *
//* DEFAULTS LIST(SHOWDEF)
//* COPY FROM(IN1) TO(OUT1)
//* SHOWDEF  DD   SYSOUT=*
//* IN1      DD   DSN=IBM1JCF.UNL.TESTE.VB,DISP=SHR
//* OUT1     DD   DSN=IBM1JCF.UNL.TESTE.FB,DISP=(NEW,CATLG,CATLG),
//*          UNIT=SYSDA,SPACE=(TRK,(1,0),RLSE),
//*          DCB=(LRECL=130,RECFM=FB)
//* REPORT   DD   SYSOUT=*
//*-------------------------------------------------------------------
//* LISTA DBID, PSID, OBID
//*-------------------------------------------------------------------
//IKJEFT01 EXEC PGM=IKJEFT01
//STEPLIB  DD DSN=DB2A.DB2LOAD,DISP=SHR
//         DD DSN=DB2A.DB2RUNLB,DISP=SHR
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD *
 DSN SYSTEM(DB2A)
 RUN PROGRAM(DSNTEP2) PARMS('/ALIGN(LHS) MIXED')
 END
//SYSPRINT DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
//SYSIN    DD *
SELECT CHAR(T.DBNAME,8) AS DBNAME,CHAR(T.TSNAME,8) AS TSNAME,
       CHAR(T.CREATOR,8) AS CREATOR,CHAR(T.NAME,12) AS NAME,
       S.PARTITIONS AS "PARTS",S.NTABLES,S.PGSIZE,
       T.DBID, S.PSID,
       T.OBID AS "OBID(TB)",           --S.OBID AS "OBID(TS)",
       CASE S.DSSIZE
            WHEN 0 THEN
                     CASE WHEN S.TYPE = 'G' THEN 4194304
                          WHEN S.TYPE = 'O' THEN 4194304
                          WHEN S.TYPE = 'P' THEN 4194304
                          WHEN S.TYPE = 'R' THEN 4194304
                     ELSE
                         CASE WHEN S.PARTITIONS > 254 THEN
                              CASE WHEN S.PGSIZE = 4 THEN 4194304
                                   WHEN S.PGSIZE = 8 THEN 8388608
                                   WHEN S.PGSIZE = 16 THEN 16777216
                                   WHEN S.PGSIZE = 32 THEN 33554432
                              ELSE NULL
                              END
                              WHEN S.PARTITIONS > 64 THEN 4194304
                              WHEN S.PARTITIONS > 32 THEN 1048576
                              WHEN S.PARTITIONS > 16 THEN 2097152
                              WHEN S.PARTITIONS > 0 THEN 4194304
                         ELSE 2097152
                         END
                     END
        ELSE S.DSSIZE
        END
        AS DSSIZE
  FROM SYSIBM.SYSTABLES T,
       SYSIBM.SYSTABLESPACE S
 WHERE
       T.TSNAME = S.NAME;
//*-------------------------------------------------------------------
//* GENERATE DB2ADMIN
//*-------------------------------------------------------------------
//GENSQL   EXEC PGM=IKJEFT01,DYNAMNBR=100
//STEPLIB  DD DISP=SHR,DSN=DB2A.DB2.IBMTOOLS.SGOCLLIB
//         DD DISP=SHR,DSN=DB2A.DB2.IBMTOOLS.SADBLLIB
//         DD DISP=SHR,DSN=DB2A.DB2EXIT
//         DD DISP=SHR,DSN=DB2A.DB2LOAD
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD *
  DSN SYSTEM(DB2A)
  RUN PROG(ADB2GEN) PLAN(ADB2GEN) -
  PARMS('/REBIND')
  END
/*
//SYSPRINT DD SYSOUT=*
//SQL      DD SYSOUT=*,DCB=(RECFM=FB,LRECL=80)
//IN       DD *
  DB2SYS   = 'DB2A',
  DB2ALOC  = '',
  DB2SERV  = 'DB2A',
  DB2AUTH  = 'IBM1JCF',
  DB2REL   = '1012',
  GENSG    = 'Y',
  GENDB    = 'Y',
  GENTS    = 'Y',
  GENTABLE = 'Y',
  GENVIEW  = 'Y',
  GENINDEX = 'Y',
  GENSYN   = 'Y',
  GENALIAS = 'Y',
  GENLABEL = 'Y',
  GENCOMM  = 'Y',
  GENRELS  = 'Y',
  GENTRIG  = 'Y',
  ACTVCNTL = '',
  GRANTDB  = 'Y',
  GRANTTS  = 'Y',
  GRANTTAB = 'Y',
  GRANTVW  = 'Y',
  IMPLQUALMETHOD = 'O',
  GRANTSG  = 'Y',
  IMPLDB   = '',
  IMPLTS   = '',
  NEWDB    = '',
  NEWTSSG  = '',
  NEWIXSG  = '',
  NEWSQLID = '',
  NEWGRANTOR = '',
  SPCALLOC = 'DEFINED',
  ROLEWARN = 'Y',
  TGTDB2   = '';
//         DD DISP=OLD,DSN=&&TEMP1
