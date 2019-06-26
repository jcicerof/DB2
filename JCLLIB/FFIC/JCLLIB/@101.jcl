//IBM1JCFA JOB (T00101,520,AU88100,658,000,581),'DB2 DBA TOOL',
//         NOTIFY=IBM1JCF,MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=O,USER=DB2PROD
/*JOBPARM Z=O,L=9999,SYSAFF=ESYS,H=ALL,TIME=1440
//*------------------------------------------------------------------
//*  DB2A - DB2A.DB2LOAD/DB2A.DB2RUNLB
//*  DB2D - DB2S.DB2LOAD/DB2S.DB2RUNLB
//*  DB2J - DB2K.DB2LOAD/DB2K.DB2RUNLB
//*  DB2E - DB2F.DB2LOAD/DB2F.DB2RUNLB
//*  DB2H - DB2H.DB2LOAD/DB2H.DB2RUNLB
//*  DB2P - DB2C.DB2LOAD/DB2C.DB2RUNLB
//*  DB2Q - DB2R.DB2LOAD/DB2R.DB2RUNLB
//*------------------------------------------------------------------
//IKJEFT01 EXEC PGM=IKJEFT01
//STEPLIB  DD DSN=DB2K.DB2LOAD,DISP=SHR
//         DD DSN=DB2K.DB2RUNLB,DISP=SHR
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD *
 DSN SYSTEM(DB2J)
 RUN PROGRAM(DSNTEP2) PARMS('/ALIGN(LHS) MIXED')
 END
//SYSPRINT DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
//SYSIN    DD *
 --
 -- DEFINICAO COMPLETA DA TABELA
 --
 --SET CURRENT SQLID = 'DBA1ADM';
 --COMMIT;
   DROP   TABLESPACE DDBA0T00.PLANRTAB;
   COMMIT;
   CREATE TABLESPACE PLANRTAB
     IN DDBA0T00
     LOCKSIZE PAGE LOCKMAX SYSTEM
     BUFFERPOOL BP8K0
     SEGSIZE 16
     CLOSE NO
     CCSID UNICODE;

CREATE TABLE
  IBM1JCF.PLAN_TABLE_TEST
   (
   "QUERYNO"  INTEGER NOT NULL
  ,QBLOCKNO  SMALLINT NOT NULL
  ,APPLNAME  VARCHAR(24) NOT NULL
    FOR MIXED DATA
  ,PROGNAME  VARCHAR(128) NOT NULL
    FOR MIXED DATA
  ,PLANNO  SMALLINT NOT NULL
  ,METHOD  SMALLINT NOT NULL
  ,CREATOR  VARCHAR(128) NOT NULL
    FOR MIXED DATA
  ,TNAME  VARCHAR(128) NOT NULL
    FOR MIXED DATA
  ,TABNO  SMALLINT NOT NULL
  ,ACCESSTYPE  CHAR(2) NOT NULL
    FOR MIXED DATA
  ,MATCHCOLS  SMALLINT NOT NULL
  ,ACCESSCREATOR  VARCHAR(128) NOT NULL
    FOR MIXED DATA
  ,ACCESSNAME  VARCHAR(128) NOT NULL
    FOR MIXED DATA
  ,INDEXONLY  CHAR(1) NOT NULL
    FOR MIXED DATA
  ,SORTN_UNIQ  CHAR(1) NOT NULL
    FOR MIXED DATA
  ,SORTN_JOIN  CHAR(1) NOT NULL
    FOR MIXED DATA
  ,SORTN_ORDERBY  CHAR(1) NOT NULL
    FOR MIXED DATA
  ,SORTN_GROUPBY  CHAR(1) NOT NULL
    FOR MIXED DATA
  ,SORTC_UNIQ  CHAR(1) NOT NULL
    FOR MIXED DATA
  ,SORTC_JOIN  CHAR(1) NOT NULL
    FOR MIXED DATA
  ,SORTC_ORDERBY  CHAR(1) NOT NULL
    FOR MIXED DATA
  ,SORTC_GROUPBY  CHAR(1) NOT NULL
    FOR MIXED DATA
  ,TSLOCKMODE  CHAR(3) NOT NULL
    FOR MIXED DATA
  ,TIMESTAMP  CHAR(16) NOT NULL
    FOR MIXED DATA
  ,REMARKS  VARCHAR(762) NOT NULL
    FOR MIXED DATA
  ,PREFETCH  CHAR(1) NOT NULL WITH DEFAULT
    FOR MIXED DATA
  ,COLUMN_FN_EVAL  CHAR(1) NOT NULL WITH DEFAULT
    FOR MIXED DATA
  ,MIXOPSEQ  SMALLINT NOT NULL WITH DEFAULT
  ,VERSION  VARCHAR(122) NOT NULL WITH DEFAULT
    FOR MIXED DATA
  ,"COLLID"  VARCHAR(128) NOT NULL WITH DEFAULT
    FOR MIXED DATA
  ,ACCESS_DEGREE  SMALLINT
  ,ACCESS_PGROUP_ID  SMALLINT
  ,JOIN_DEGREE  SMALLINT
  ,JOIN_PGROUP_ID  SMALLINT
  ,SORTC_PGROUP_ID  SMALLINT
  ,SORTN_PGROUP_ID  SMALLINT
  ,PARALLELISM_MODE  CHAR(1)
    FOR MIXED DATA
  ,MERGE_JOIN_COLS  SMALLINT
  ,CORRELATION_NAME  VARCHAR(128)
    FOR MIXED DATA
  ,PAGE_RANGE  CHAR(1) NOT NULL WITH DEFAULT
    FOR MIXED DATA
  ,JOIN_TYPE  CHAR(1) NOT NULL WITH DEFAULT
    FOR MIXED DATA
  ,GROUP_MEMBER  VARCHAR(24) NOT NULL WITH DEFAULT
    FOR MIXED DATA
  ,IBM_SERVICE_DATA  VARCHAR(254) NOT NULL WITH DEFAULT
    FOR BIT DATA
  ,WHEN_OPTIMIZE  CHAR(1) NOT NULL WITH DEFAULT
    FOR MIXED DATA
  ,QBLOCK_TYPE  CHAR(6) NOT NULL WITH DEFAULT
    FOR MIXED DATA
  ,BIND_TIME  TIMESTAMP NOT NULL WITH DEFAULT
  ,OPTHINT  VARCHAR(128) NOT NULL WITH DEFAULT
    FOR MIXED DATA
  ,HINT_USED  VARCHAR(128) NOT NULL WITH DEFAULT
    FOR MIXED DATA
  ,PRIMARY_ACCESSTYPE  CHAR(1) NOT NULL WITH DEFAULT
    FOR MIXED DATA
  ,PARENT_QBLOCKNO  SMALLINT NOT NULL WITH DEFAULT
  ,TABLE_TYPE  CHAR(1)
    FOR MIXED DATA
  ,TABLE_ENCODE  CHAR(1) NOT NULL WITH DEFAULT
    FOR MIXED DATA
  ,TABLE_SCCSID  SMALLINT NOT NULL WITH DEFAULT
  ,TABLE_MCCSID  SMALLINT NOT NULL WITH DEFAULT
  ,TABLE_DCCSID  SMALLINT NOT NULL WITH DEFAULT
  ,ROUTINE_ID  INTEGER NOT NULL WITH DEFAULT
  ,CTEREF  SMALLINT NOT NULL WITH DEFAULT
  ,STMTTOKEN  VARCHAR(240)
    FOR MIXED DATA
  ,PARENT_PLANNO  SMALLINT NOT NULL WITH DEFAULT
  ,BIND_EXPLAIN_ONLY  CHAR(1) NOT NULL WITH DEFAULT
    FOR MIXED DATA
  ,SECTNOI  INTEGER NOT NULL WITH DEFAULT
  ,EXPLAIN_TIME  TIMESTAMP NOT NULL WITH DEFAULT
  ,MERGC  CHAR(1) NOT NULL WITH DEFAULT
    FOR MIXED DATA
  ,MERGN  CHAR(1) NOT NULL WITH DEFAULT
    FOR MIXED DATA
   )
    IN DDBA0T00.PLANRTAB
    CCSID UNICODE
    NOT VOLATILE
    APPEND NO
;
COMMIT;
--
SET CURRENT SQLID = 'DB2PROD';
REVOKE SELECT,INSERT,DELETE,UPDATE ON IBM1JCF.PLAN_TABLE_TEST
  FROM IBM1JCF BY ALL;
//*
//
 --
 -- ADD COLUMN 60-64
 --
 ALTER TABLE XXXXXXXX.PLAN_TABLE ADD COLUMN
   BIND_EXPLAIN_ONLY  CHAR(1) NOT NULL WITH DEFAULT
    FOR MIXED DATA;

 ALTER TABLE XXXXXXXX.PLAN_TABLE ADD COLUMN
   SECTNOI  INTEGER NOT NULL WITH DEFAULT;

 ALTER TABLE XXXXXXXX.PLAN_TABLE ADD COLUMN
   EXPLAIN_TIME  TIMESTAMP NOT NULL WITH DEFAULT;

 ALTER TABLE XXXXXXXX.PLAN_TABLE ADD COLUMN
   MERGC  CHAR(1) NOT NULL WITH DEFAULT
    FOR MIXED DATA;

 ALTER TABLE XXXXXXXX.PLAN_TABLE ADD COLUMN
   MERGN  CHAR(1) NOT NULL WITH DEFAULT
    FOR MIXED DATA;