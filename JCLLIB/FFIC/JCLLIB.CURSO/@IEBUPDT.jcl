//IBM1JCFX JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',            JOB00321
//         NOTIFY=IBM1JCF,MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=K
//*
/*JOBPARM Z=G,HOLD=ALL,S=ESYS,T=1439
//IEBUPDTE EXEC PGM=IEBUPDTE,PARM=NEW
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=IBM1JCF.DB2.CCURSO,DISP=OLD
//SYSUT2   DD DSN=IBM1JCF.DB2.CCURSO,DISP=OLD
//SYSIN    DD DATA,DLM='><'
./ ADD NAME=CHCREAT1                                                    000010
-- DATABASE DB07 ALREADY EXISTS.                                        000100
--                                                                      000200
--DROP TABLESPACE DB07.PARENT ;                                         000300
--DROP TABLESPACE DB07.CHILDC ;                                         000400
--COMMIT ;                                                              000500
--                                                                      000600
CREATE TABLESPACE PARENT IN DB07 SEGSIZE 4 ;                            000700
CREATE TABLE CONTINENT ( CONTNR           SMALLINT     NOT NULL         000800
                       , NAME             CHAR(10)                      000900
                       , CONSTRAINT PK_CONTINENT PRIMARY KEY (CONTNR)   001000
                       ) IN DB07.PARENT ;                               001100
CREATE UNIQUE INDEX IXCONT ON CONTINENT (CONTNR) ;                      001200
--                                                                      001300
INSERT INTO CONTINENT VALUES ( 1 , 'AFRICA'   );                        001400
INSERT INTO CONTINENT VALUES ( 2 , 'AMERICA'  );                        001500
INSERT INTO CONTINENT VALUES ( 3 , 'ASIA'     );                        001600
INSERT INTO CONTINENT VALUES ( 4 , 'AUSTRALIA');                        001700
INSERT INTO CONTINENT VALUES ( 5 , 'EUROPE'   );                        001800
--                                                                      001900
SELECT * FROM CONTINENT ORDER BY NAME ;                                 002000
--                                                                      002100
CREATE TABLESPACE CHILDC IN DB07 SEGSIZE 4 ;                            002200
CREATE TABLE COUNTRY_CONSTR                                             002300
                       ( CTRYNR           SMALLINT     NOT NULL         002400
                       , NAME             CHAR(15)                      002500
                       , CONTNR           SMALLINT                      002600
                       , SOUTH_OF_EQUATOR CHAR(1)                       002700
                       , CONSTRAINT PK_COUNTRY_C PRIMARY KEY (CTRYNR)   002800
                       , CONSTRAINT FK_CTRY_CONT FOREIGN KEY (CONTNR)   002900
                         REFERENCES CONTINENT ON DELETE CASCADE         003000
                       , CONSTRAINT CH_SOUTH                            003100
                         CHECK(SOUTH_OF_EQUATOR IN ('Y','N','P'))       003200
                       ) IN DB07.CHILDC ;                               003300
CREATE UNIQUE INDEX IXCTRYC ON COUNTRY_CONSTR (CTRYNR) ;                003400
--                                                                      003500
INSERT INTO COUNTRY_CONSTR VALUES ( 1 , 'BRAZIL'        , 2, 'P' );     003600
INSERT INTO COUNTRY_CONSTR VALUES ( 2 , 'AUSTRALIA'     , 4, 'Y' );     003700
INSERT INTO COUNTRY_CONSTR VALUES ( 3 , 'CHINA'         , 3, 'N' );     003800
INSERT INTO COUNTRY_CONSTR VALUES ( 4 , 'EGYPT'         , 1, 'N' );     003900
INSERT INTO COUNTRY_CONSTR VALUES ( 5 , 'FRANCE'        , 5, 'N' );     004000
INSERT INTO COUNTRY_CONSTR VALUES ( 6 , 'INDIA'         , 3, 'N' );     004100
INSERT INTO COUNTRY_CONSTR VALUES ( 7 , 'JAPAN'         , 3, 'N' );     004200
INSERT INTO COUNTRY_CONSTR VALUES ( 8 , 'SOUTH AFRICA'  , 1, 'Y' );     004300
INSERT INTO COUNTRY_CONSTR VALUES ( 9 , 'UNITED KINGDOM', 5, 'N' );     004400
INSERT INTO COUNTRY_CONSTR VALUES (10 , 'USA'           , 2, 'N' );     004500
./ ADD NAME=CHCREAT2                                                    000110
--DROP TABLESPACE DB07.CHILDF ;                                         000100
--COMMIT ;                                                              000200
--                                                                      000300
CREATE TABLESPACE CHILDF IN DB07 SEGSIZE 4 ;                            000400
CREATE TABLE COUNTRY_FREE LIKE COUNTRY_CONSTR IN DB07.CHILDF ;          000500
--                                                                      000600
INSERT INTO COUNTRY_FREE                                                000700
            SELECT * FROM COUNTRY_CONSTR ;                              000800
UPDATE COUNTRY_FREE SET CONTNR = 8                                      000900
                    WHERE NAME = 'FRANCE' ;                             001000
UPDATE COUNTRY_FREE SET SOUTH_OF_EQUATOR = 'S'                          001100
                    WHERE NAME = 'SOUTH AFRICA' ;                       001200
--                                                                      001300
SELECT *                                                                001400
  FROM COUNTRY_FREE  CTRY LEFT OUTER JOIN CONTINENT CONT                001500
    ON CTRY.CONTNR = CONT.CONTNR                                        001600
 WHERE CTRY.NAME IN ('FRANCE', 'SOUTH AFRICA') ;                        001700
./ ADD NAME=CHINS1                                                      000210
  INSERT INTO COUNTRY_CONSTR VALUES (15 , 'ARGENTINA'     , 8, 'Y' );   000100
./ ADD NAME=CHINS2                                                      000310
  INSERT INTO COUNTRY_CONSTR VALUES (15 , 'ARGENTINA'     , 2, 'S' );   000100
./ ADD NAME=CHJOB                                                       000410
//TSOUA07D JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),    000100
//         MSGCLASS=Q,CLASS=G,REGION=0M                                 000200
//JOBLIB   DD DSN=DBDSNA.DB2A10.SDSNEXIT,DISP=SHR                       000300
//         DD DSN=DBDSNA.DB2A10.SDSNLOAD,DISP=SHR                       000400
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID='TSOUA07.CHK',UTPROC=''            000500
//*                                                                     000600
//**********************************************                        000700
//*                                                                     000800
//*  GENERATING JCL FOR THE CHECK DATA UTILITY                          000900
//*  DATE:  09/14/10          TIME:  15:59:00                           001000
//*                                                                     001100
//**********************************************                        001200
//*                                                                     001300
//DSNUPROC.SORTWK01 DD DSN=&SYSUID..SORTWK01,                           001400
//     DISP=(MOD,DELETE,CATLG),                                         001500
//     SPACE=(16384,(20,20),,,ROUND),                                   001600
//     UNIT=SYSDA                                                       001700
//DSNUPROC.SORTWK02 DD DSN=&SYSUID..SORTWK02,                           001800
//     DISP=(MOD,DELETE,CATLG),                                         001900
//     SPACE=(16384,(20,20),,,ROUND),                                   002000
//     UNIT=SYSDA                                                       002100
//DSNUPROC.SORTWK03 DD DSN=&SYSUID..SORTWK03,                           002200
//     DISP=(MOD,DELETE,CATLG),                                         002300
//     SPACE=(16384,(20,20),,,ROUND),                                   002400
//     UNIT=SYSDA                                                       002500
//DSNUPROC.SORTWK04 DD DSN=&SYSUID..SORTWK04,                           002600
//     DISP=(MOD,DELETE,CATLG),                                         002700
//     SPACE=(16384,(20,20),,,ROUND),                                   002800
//     UNIT=SYSDA                                                       002900
//DSNUPROC.SYSUT1 DD DSN=&SYSUID..SYSUT1,                               003000
//     DISP=(MOD,DELETE,CATLG),                                         003100
//     SPACE=(16384,(20,20),,,ROUND),                                   003200
//     UNIT=SYSDA                                                       003300
//DSNUPROC.SORTOUT DD DSN=&SYSUID..SORTOUT,                             003400
//     DISP=(MOD,DELETE,CATLG),                                         003500
//     SPACE=(16384,(20,20),,,ROUND),                                   003600
//     UNIT=SYSDA                                                       003700
//DSNUPROC.SYSERR DD DSN=&SYSUID..CV87.SYSERR,                          003800
//     DISP=(MOD,KEEP,CATLG),                                           003900
//     SPACE=(16384,(20,20),,,ROUND),                                   004000
//     UNIT=SYSDA                                                       004100
//DSNUPROC.SYSPUNCH DD DSN=&SYSUID..CV87.SYSPUNCH,                      004200
//     DISP=(MOD,CATLG,DELETE),                                         004300
//     DCB=(RECFM=FB,LRECL=80,BLKSIZE=800),                             004400
//     SPACE=(TRK,(2,2)),                                               004500
//     UNIT=SYSDA                                                       004600
//DSNUPROC.SYSIN    DD  *                                               004700
  CHECK DATA TABLESPACE DB07.________________________________________   004800
//                                                                      004900
./ ADD NAME=CHOBID                                                      000510
--                                                                      000101
  SELECT '1-DB' AS TYPE, DBID AS ID, NAME                               000110
      FROM SYSIBM.SYSDATABASE                                           000200
      WHERE NAME = 'DB07'                                               000300
  UNION                                                                 000400
  SELECT '2-TS' AS TYPE, PSID AS ID, NAME                               000500
      FROM SYSIBM.SYSTABLESPACE                                         000600
      WHERE DBNAME = 'DB07'                                             000700
        AND NAME IN ('CHILDC', 'CHILDF')                                000800
  UNION                                                                 000900
  SELECT '3-TB' AS TYPE, OBID AS ID, NAME                               001000
      FROM SYSIBM.SYSTABLES                                             001100
      WHERE CREATOR = USER                                              001200
       AND NAME IN ('COUNTRY_CONSTR', 'COUNTRY_FREE')                   001300
  ORDER BY 1                                                            001400
  ;                                                                     001500
./ ADD NAME=CHRID                                                       000610
--ENTER THE TWO RID-S INTO THE WHERE CONDITION:                         000010
--                                                                      000020
  SELECT HEX(RID(C)) AS RID, C.*                                        000100
    FROM COUNTRY_CONSTR C                                               000200
   WHERE HEX(RID(C)) = '000000000000____'   -- ENLARGED AND WITHOUT X   000500
      OR HEX(RID(C)) = '000000000000____'                               000600
--                       RID X'00000020?'  <-- IN SYSPUNCH DATA SET     000610
--                      RID=X'000000020?'  <-- IN JOB OUTPUT (SYSPRINT) 000620
  ;                                                                     000700
./ ADD NAME=CHSEL                                                       000710
  SELECT *                                                              000100
    FROM COUNTRY_CONSTR                                                 000200
  ;                                                                     000300
  SELECT *                                                              000400
    FROM COUNTRY_CONSTR CTRY                                            000500
         LEFT OUTER JOIN                                                000501
         CONTINENT CONT                                                 000510
      ON CTRY.CONTNR = CONT.CONTNR                                      000600
   ORDER BY CTRY.CTRYNR                                                 000700
  ;                                                                     000800
./ ADD NAME=CH1COPY                                                     000810
//TSOUA071  JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//          MSGCLASS=Q,CLASS=G,REGION=0M
//DSN1COPY  EXEC PGM=DSN1COPY,PARM='RESET,________'
//STEPLIB   DD DSN=DBDSNA.DB2A10.SDSNEXIT,DISP=SHR
//          DD DSN=DBDSNA.DB2A10.SDSNLOAD,DISP=SHR
//SYSPRINT  DD SYSOUT=*
//SYSUT1    DD DSN=TSOUA07.CV87.DB07.______.____,DISP=SHR
//SYSUT2    DD DSN=DBDSNA.DSNDBD.DB07.______.I0001.A001,DISP=SHR
//SYSXLAT   DD *
DBID-OLD,DBID-NEW
PSID-OLD,PSID-NEW
OBID-OLD,OBID-NEW
//
./ ADD NAME=DYCREATE                                                    000910
--DROP   TABLESPACE DB07.TSA                                            000100
--;                                                                     000200
--DROP   TABLESPACE DB07.TSB                                            000300
--;                                                                     000400
--COMMIT                                                                000500
--;                                                                     000600
  CREATE TABLESPACE TSA IN DB07                                         000700
  ;                                                                     000800
  CREATE TABLESPACE TSB IN DB07                                         000900
  ;                                                                     001000
  CREATE TABLE TAB1                                                     001100
               ( COL1 SMALLINT                                          001200
               , COL2 SMALLINT                                          001300
               , COLA CHAR(255)                                         001400
               , COLB CHAR(255)                                         001500
               , COLC CHAR(255)                                         001600
               , COLD CHAR(255)                                         001700
               , COLE CHAR(255)                                         001800
               , COLF CHAR(255)                                         001900
               , COLG CHAR(255) )                                       002000
         IN DB07.TSA                                                    002100
  ;                                                                     002200
  CREATE TABLE TAB2                                                     002300
               ( COL1 SMALLINT                                          002400
               , COL2 SMALLINT                                          002500
               , COLA CHAR(255)                                         002600
               , COLB CHAR(255)                                         002700
               , COLC CHAR(255)                                         002800
               , COLD CHAR(255)                                         002900
               , COLE CHAR(255)                                         003000
               , COLF CHAR(255)                                         003100
               , COLG CHAR(255) )                                       003200
         IN DB07.TSB                                                    003300
  ;                                                                     003400
  CREATE INDEX IXTAB1A ON TAB1(COL1)                                    003500
  ;                                                                     003600
  CREATE INDEX IXTAB1B ON TAB1(COL2)                                    003700
  ;                                                                     003800
  CREATE INDEX IXTAB1C ON TAB1(COLA,COLB,COLC,COLD,COLE,COLF,COLG )     003900
  ;                                                                     004000
  CREATE INDEX IXTAB2A ON TAB2(COL1)                                    004100
  ;                                                                     004200
  CREATE INDEX IXTAB2B ON TAB2(COL2)                                    004300
  ;                                                                     004400
  CREATE INDEX IXTAB2C ON TAB2(COLA,COLB,COLC,COLD,COLE,COLF,COLG )     004500
  ;                                                                     004600
  INSERT INTO TAB1 VALUES ( 1,  1, 'A','B','C','D','E','F','G') ;       004700
  INSERT INTO TAB1 VALUES ( 2,  2, 'A','B','C','D','E','F','G') ;       004800
  INSERT INTO TAB1 VALUES ( 3,  3, 'A','B','C','D','E','F','G') ;       004900
  INSERT INTO TAB1 VALUES ( 4,  4, 'A','B','C','D','E','F','G') ;       005000
  INSERT INTO TAB1 VALUES ( 5,  5, 'A','B','C','D','E','F','G') ;       005100
  INSERT INTO TAB1 VALUES ( 6,  6, 'A','B','C','D','E','F','G') ;       005200
  INSERT INTO TAB1 VALUES ( 7,  7, 'A','B','C','D','E','F','G') ;       005300
  INSERT INTO TAB1 VALUES ( 8,  8, 'A','B','C','D','E','F','G') ;       005400
  INSERT INTO TAB1 VALUES ( 9,  9, 'A','B','C','D','E','F','G') ;       005500
  INSERT INTO TAB1 VALUES (10, 10, 'A','B','C','D','E','F','G') ;       005600
  --                                                                    005700
  INSERT INTO TAB2 VALUES ( 1,  1, 'A','B','C','D','E','F','G') ;       005800
  INSERT INTO TAB2 VALUES ( 2,  2, 'A','B','C','D','E','F','G') ;       005900
  INSERT INTO TAB2 VALUES ( 3,  3, 'A','B','C','D','E','F','G') ;       006000
  INSERT INTO TAB2 VALUES ( 4,  4, 'A','B','C','D','E','F','G') ;       006100
  INSERT INTO TAB2 VALUES ( 5,  5, 'A','B','C','D','E','F','G') ;       006200
  INSERT INTO TAB2 VALUES ( 6,  6, 'A','B','C','D','E','F','G') ;       006300
  INSERT INTO TAB2 VALUES ( 7,  7, 'A','B','C','D','E','F','G') ;       006400
  INSERT INTO TAB2 VALUES ( 8,  8, 'A','B','C','D','E','F','G') ;       006500
  INSERT INTO TAB2 VALUES ( 9,  9, 'A','B','C','D','E','F','G') ;       006600
  INSERT INTO TAB2 VALUES (10, 10, 'A','B','C','D','E','F','G') ;       006700
  --                                                                    006800
  INSERT INTO TAB2 VALUES (11, 11, 'A','B','C','D','E','F','G') ;       006900
  INSERT INTO TAB2 VALUES (12, 12, 'A','B','C','D','E','F','G') ;       007000
  INSERT INTO TAB2 VALUES (13, 13, 'A','B','C','D','E','F','G') ;       007100
  INSERT INTO TAB2 VALUES (14, 14, 'A','B','C','D','E','F','G') ;       007200
  INSERT INTO TAB2 VALUES (15, 15, 'A','B','C','D','E','F','G') ;       007300
  INSERT INTO TAB2 VALUES (16, 16, 'A','B','C','D','E','F','G') ;       007400
  INSERT INTO TAB2 VALUES (17, 17, 'A','B','C','D','E','F','G') ;       007500
  INSERT INTO TAB2 VALUES (18, 18, 'A','B','C','D','E','F','G') ;       007600
  INSERT INTO TAB2 VALUES (19, 19, 'A','B','C','D','E','F','G') ;       007700
  INSERT INTO TAB2 VALUES (20, 20, 'A','B','C','D','E','F','G') ;       007800
  --                                                                    007900
  SELECT COUNT(*) FROM TAB1 ;                                           008000
  SELECT COUNT(*) FROM TAB2 ;                                           008100
./ ADD NAME=DYOBID                                                      001010
  SELECT NAME, DBID                                                     000100
    FROM SYSIBM.SYSDATABASE                                             000200
   WHERE NAME = 'DB' CONCAT SUBSTR(USER,6,2)                            000300
  ;                                                                     000400
  SELECT DBNAME, NAME, PSID                                             000500
    FROM SYSIBM.SYSTABLESPACE                                           000600
   WHERE NAME IN ('TSA', 'TSB')                                         000700
     AND DBNAME = 'DB' CONCAT SUBSTR(USER,6,2)                          000800
  ;                                                                     000900
  SELECT SUBSTR(CREATOR,1,8) AS CREATOR, SUBSTR(NAME,1,5) AS NAME       001000
       , OBID                                                           001100
    FROM SYSIBM.SYSTABLES TB                                            001200
   WHERE CREATOR = USER AND NAME IN ('TAB1', 'TAB2')                    001300
  ;                                                                     001400
./ ADD NAME=DYREORG                                                     001110
//TSOUA07R JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),    000100
//         MSGCLASS=Q,CLASS=G,REGION=0M                                 000200
//JOBLIB   DD DSN=DBDSNA.DB2A10.SDSNEXIT,DISP=SHR                       000300
//         DD DSN=DBDSNA.DB2A10.SDSNLOAD,DISP=SHR                       000400
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID='TSOUA07.RGT',UTPROC=''            000500
//*                                                                     000600
//**********************************************                        000700
//*                                                                     000800
//*  GENERATING JCL FOR THE REORG TABLESPACE UTILITY                    000900
//*  DATE:  07/04/10          TIME:  16:04:15                           001000
//*                                                                     001100
//**********************************************                        001200
//*                                                                     001300
//*SNUPROC.SORTWK01 DD DSN=&SYSUID..SORTWK01,                           001400
//*    DISP=(MOD,DELETE,CATLG),                                         001500
//*    SPACE=(16384,(20,20),,,ROUND),                                   001600
//*    UNIT=SYSDA                                                       001700
//*SNUPROC.SORTWK02 DD DSN=&SYSUID..SORTWK02,                           001800
//*    DISP=(MOD,DELETE,CATLG),                                         001900
//*    SPACE=(16384,(20,20),,,ROUND),                                   002000
//*    UNIT=SYSDA                                                       002100
//*SNUPROC.SORTWK03 DD DSN=&SYSUID..SORTWK03,                           002200
//*    DISP=(MOD,DELETE,CATLG),                                         002300
//*    SPACE=(16384,(20,20),,,ROUND),                                   002400
//*    UNIT=SYSDA                                                       002500
//*SNUPROC.SORTWK04 DD DSN=&SYSUID..SORTWK04,                           002600
//*    DISP=(MOD,DELETE,CATLG),                                         002700
//*    SPACE=(16384,(20,20),,,ROUND),                                   002800
//*    UNIT=SYSDA                                                       002900
//DSNUPROC.SYSREC DD DSN=&SYSUID..CV87.DB07.TSB.REORG.RECDSN,           003000
//     DISP=(MOD,CATLG),                                                003100
//     SPACE=(16384,(20,20),,,ROUND),                                   003200
//     UNIT=SYSDA                                                       003300
//DSNUPROC.SYSPUNCH DD DSN=&SYSUID..CV87.DB07.TSB.REORG.PUNCHDSN,       003400
//     DISP=(MOD,CATLG),                                                003500
//     SPACE=(16384,(20,20),,,ROUND),                                   003600
//     UNIT=SYSDA                                                       003700
//DSNUPROC.SYSDISC DD DSN=&SYSUID..CV87.DB07.TSB.REORG.DISCDSN,         003800
//     DISP=(MOD,CATLG),                                                003900
//     SPACE=(16384,(20,20),,,ROUND),                                   004000
//     UNIT=SYSDA                                                       004100
//DSNUPROC.SYSUT1 DD DSN=&SYSUID..SYSUT1,                               004200
//     DISP=(MOD,DELETE,CATLG),                                         004300
//     SPACE=(16384,(20,20),,,ROUND),                                   004400
//     UNIT=SYSDA                                                       004500
//DSNUPROC.SORTOUT DD DSN=&SYSUID..SORTOUT,                             004600
//     DISP=(MOD,DELETE,CATLG),                                         004700
//     SPACE=(16384,(20,20),,,ROUND),                                   004800
//     UNIT=SYSDA                                                       004900
//DSNUPROC.SYSIN    DD  *                                               005000
REORG TABLESPACE DB07.TSB NOSYSREC SORTDEVT SYSDA                       005100
./ ADD NAME=DYRTSSEL                                                    001210
  SELECT DBNAME, NAME, TOTALROWS                                        000100
    FROM SYSIBM.SYSTABLESPACESTATS TS                                   000200
   WHERE DBNAME = 'DB' CONCAT SUBSTR(CURRENT SQLID,6,2)                 000300
     AND NAME IN ('TSA', 'TSB')                                         000310
  ;                                                                     000400
  SELECT DBNAME, SUBSTR(NAME,1,20) AS NAME, TOTALENTRIES                000500
    FROM SYSIBM.SYSINDEXSPACESTATS IS                                   000600
   WHERE DBNAME = 'DB' CONCAT SUBSTR(CURRENT SQLID,6,2)                 000700
     AND NAME LIKE 'IXTAB__'       -- <--- DO NOT CHANGE "__"           000710
  ;                                                                     000800
./ ADD NAME=DYRTSUPD                                                    001310
  SELECT DBNAME, NAME, TOTALROWS                                        000100
    FROM SYSIBM.SYSTABLESPACESTATS TS                                   000200
   WHERE DBNAME = 'DB' CONCAT SUBSTR(CURRENT SQLID,6,2)                 000300
     AND NAME IN ('TSA', 'TSB' )                                        000400
  ;                                                                     000500
  SELECT DBNAME, SUBSTR(NAME,1,20) AS NAME, TOTALENTRIES                000600
    FROM SYSIBM.SYSINDEXSPACESTATS IS                                   000700
   WHERE DBNAME = 'DB' CONCAT SUBSTR(CURRENT SQLID,6,2)                 000800
     AND (NAME LIKE 'IXTAB1_' OR NAME LIKE 'IXTAB2_')                   000900
  ;                                                                     001000
  -- UPDATE ONLY ALLOWED VIA FOLLOWING VIEWS:                           001100
  --                                                                    001200
  UPDATE INST870.VSYSTABLESPACESTATS                                    001300
     SET TOTALROWS  = 1000000000                                        001400
--   SET TOTALROWS  = NULL                                              001500
   WHERE DBNAME = 'DB' CONCAT SUBSTR(CURRENT SQLID,6,2)                 001600
     AND NAME IN ('TSA', 'TSB' )                                        001700
  ;                                                                     001800
  UPDATE INST870.VSYSINDEXSPACESTATS                                    001900
     SET TOTALENTRIES = 1000000000                                      002000
--   SET TOTALENTRIES = NULL                                            002100
--   SET TOTALENTRIES = 10                                              002200
   WHERE DBNAME = 'DB' CONCAT SUBSTR(CURRENT SQLID,6,2)                 002300
     AND (NAME LIKE 'IXTAB1_' OR NAME LIKE 'IXTAB2_')                   002400
  ;                                                                     002500
  SELECT DBNAME, NAME, TOTALROWS                                        002600
    FROM SYSIBM.SYSTABLESPACESTATS TS                                   002700
   WHERE DBNAME = 'DB' CONCAT SUBSTR(CURRENT SQLID,6,2)                 002800
     AND NAME IN ('TSA', 'TSB' )                                        002900
  ;                                                                     003000
  SELECT DBNAME, SUBSTR(NAME,1,20) AS NAME, TOTALENTRIES                003100
    FROM SYSIBM.SYSINDEXSPACESTATS IS                                   003200
   WHERE DBNAME = 'DB' CONCAT SUBSTR(CURRENT SQLID,6,2)                 003300
     AND (NAME LIKE 'IXTAB1_' OR NAME LIKE 'IXTAB2_')                   003400
  ;                                                                     003500
./ ADD NAME=DYTABLES                                                    001410
  SELECT COL1, SUBSTR(COLA,1,1) AS COLA FROM TAB1                       000100
  ;                                                                     000200
  SELECT COL1, SUBSTR(COLA,1,1) AS COLA FROM TAB2                       000300
  ;                                                                     000400
./ ADD NAME=DY1COPY                                                     001510
//TSOUA07C JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),    000100
//         MSGCLASS=Q,CLASS=G,REGION=4M                                 000200
//*                                                                     000300
//*  DSN1COPY WITH OBID TRANSLATION                                     000400
//*                                                                     000500
//DSN1COPY EXEC PGM=DSN1COPY,PARM='RESET,OBIDXLAT'                      000600
//STEPLIB  DD DSN=DBDSNA.DB2A10.SDSNEXIT,DISP=SHR                       000700
//         DD DSN=DBDSNA.DB2A10.SDSNLOAD,DISP=SHR                       000800
//SYSPRINT DD SYSOUT=*                                                  000900
//SYSUT1   DD DSN=DBDSNA.DSNDBD.DB07.TSA.I0001.A001,DISP=SHR            001000
//SYSUT2   DD DSN=DBDSNA.DSNDBD.DB07.TSB.I0001.A001,DISP=SHR            001100
//SYSXLAT  DD *                                                         001200
DBID-OLD,DBID-NEW                                                       001300
PSID-OLD,PSID-NEW                                                       001400
OBID-OLD,OBID-NEW                                                       001500
//                                                                      001600
./ ADD NAME=GU01                                                        001610
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..GU01,UTPROC=''
//***********************************************************
//*  LISTDEF UTILITY
//***********************************************************
//SYSPRINT DD  SYSOUT=*
OPTIONS PREVIEW
________ ________ INCLUDE TABLESPACE ________.________ ________
./ ADD NAME=GU02                                                        001710
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..GU02,UTPROC=''
//SYSLISTD DD  DSN=&SYSUID..CV87.CNTL(LISTDEF),DISP=SHR
//***********************************************************
//*  LISTDEF UTILITY
//***********************************************************
//SYSPRINT DD  SYSOUT=*
OPTIONS PREVIEW
________ ________ INCLUDE ________ ________ INDEXSPACES ________ ______
./ ADD NAME=GU03                                                        001810
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..GU03,UTPROC=''
//***********************************************************
//*  LISTDEF UTILITY
//***********************************************************
//SYSPRINT DD  SYSOUT=*
OPTIONS PREVIEW
________ ________ INCLUDE ________ ________.________ ________
                  EXCLUDE ________ ________.________ ________
./ ADD NAME=GU04                                                        001910
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..GU04,UTPROC=''
//***********************************************************
//*  LISTDEF UTILITY
//***********************************************************
//SYSPRINT DD  SYSOUT=*
OPTIONS PREVIEW
________ ________ INCLUDE TABLESPACE ________.________ ________
./ ADD NAME=GU05                                                        002010
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..GU05,UTPROC=''
//***********************************************************
//*  TEMPLATE UTILITY
//***********************************************************
//SYSPRINT DD  SYSOUT=*
OPTIONS ________
________ TUNLOAD1 DSN &USERID..____.___..___..______..UNLOAD1
________ TLOADCT1 DSN &USERID..____.___..___..LOADCTL1
./ ADD NAME=GU06                                                        002110
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..GU06,UTPROC=''
//***********************************************************
//*  UNLOAD UTILITY
//***********************************************************
//MYLIST   DD  DSN=&SYSUID..________.________(________),DISP=SHR
//________ DD  DSN=&SYSUID..________.________(TEMPDEF),DISP=SHR
//SYSPRINT DD  SYSOUT=*
OPTIONS ________ ________ MYLIST
________ LIST ________ UNLDDN ________ PUNCHDDN ________
./ ADD NAME=GU07                                                        002210
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..GU08,UTPROC=''
//***********************************************************
//*  TEMPLATE UTILITY
//***********************************************************
//SYSPRINT DD  SYSOUT=*
OPTIONS ________
________ TSYSCOPY DSN &USERID..____.____._.___.____._______
________ TSYSDISC DSN &USERID..____.____.____._____.DISCARD1
./ ADD NAME=GU08                                                        002310
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//**********************************************************
//*  PLEASE FILL IN ALL __ WITH APPROPRIATE VALUES
//***********************************************************
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..GU09,UTPROC=''
//SYSTEMPL DD  DSN=&SYSUID..CV87.CNTL(TEMPDEF),DISP=SHR
//SYSPRINT DD  SYSOUT=*
//SW__WK__ DD  SPACE=(TRK,(1,1)),UNIT=SYSDA
//SW__WK__ DD  SPACE=(TRK,(1,1)),UNIT=SYSDA
//SW__WK__ DD  SPACE=(TRK,(1,1)),UNIT=SYSDA
//SW__WK__ DD  SPACE=(TRK,(1,1)),UNIT=SYSDA
//SYSUT1   DD  DSN=&SYSUID..SYSUT1,
//    SPACE=(TRK,(1,1)),UNIT=SYSDA,DISP=(MOD,CATLG)
//SORTOUT  DD  DSN=&SYSUID..SORTOUT,
//    SPACE=(TRK,(1,1)),UNIT=SYSDA,DISP=(MOD,CATLG)
//SYSERR   DD  DSN=&SYSUID..SYSERR,
//    SPACE=(TRK,(1,1)),UNIT=SYSDA,DISP=(MOD,CATLG)
//SYSMAP   DD  DSN=&SYSUID..SYSMAP,
//    SPACE=(TRK,(1,1)),UNIT=SYSDA,DISP=(MOD,CATLG)
//**************************************************************
//*  LOAD UTILITY CONTROL STATEMENTS FROM PUNCH DATA SET FOLLOW
//**************************************************************
./ ADD NAME=GU09                                                        002410
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..GU10A,UTPROC=''
//***********************************************************
//*  UNLOAD UTILITY
//*  PLEASE FILL IN ALL ________ WITH APPROPRIATE VALUES
//***********************************************************
//SYSTEMPL DD  DSN=&SYSUID..CV87.CNTL(________),DISP=SHR
//IMAGCOPY DD  DSN=________,DISP=OLD
//         DD  DSN=________,DISP=OLD
//         DD  DSN=________,DISP=OLD
//         DD  DSN=________,DISP=OLD
//         DD  DSN=________,DISP=OLD
//SYSPRINT DD  SYSOUT=*
________ ________ ________.TSNEWT
       ________ IMAGCOPY
       UNLDDN ________ PUNCHDDN ________
./ ADD NAME=GU10A                                                       002510
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..GU10B,UTPROC=''
//SYSTEMPL DD  DSN=&SYSUID..CV87.CNTL(TEMPDEF),DISP=SHR
//SYSPRINT DD  SYSOUT=*
//SYSUT1   DD  DSN=&SYSUID..SYSUT1,
//    SPACE=(TRK,(1,1)),UNIT=SYSDA,DISP=(MOD,CATLG)
//SORTOUT  DD  DSN=&SYSUID..SORTOUT,
//    SPACE=(TRK,(1,1)),UNIT=SYSDA,DISP=(MOD,CATLG)
//SYSERR   DD  DSN=&SYSUID..SYSERR,
//    SPACE=(TRK,(1,1)),UNIT=SYSDA,DISP=(MOD,CATLG)
//SYSMAP   DD  DSN=&SYSUID..SYSMAP,
//    SPACE=(TRK,(1,1)),UNIT=SYSDA,DISP=(MOD,CATLG)
//**************************************************************
//*  LOAD UTILITY CONTROL STATEMENTS FROM PUNCH DATA SET FOLLOW
//**************************************************************
./ ADD NAME=GU12A                                                       002610
SELECT SUBSTR(A.DBNAME,1,8) AS DBNAME,
       SUBSTR(A.TSNAME,1,8) AS TSNAME,
       A.ICTYPE,
       A.ICDATE,
       A.DSNAME
FROM   SYSIBM.SYSCOPY A
WHERE  (A.DBNAME,A.TSNAME)=('WWV8707D','TSDEPT')
    OR (A.DBNAME,A.TSNAME)=('DB07','TSSWITCH')
./ ADD NAME=GU13A                                                       002710
CREATE TABLESPACE TSSWITCH IN DB07
       MAXPARTITIONS 1
       BUFFERPOOL BP32K
       MAXROWS 1 ;
CREATE TABLE LARGE (COL1 BIGINT)
       IN DB07.TSSWITCH ;
-- INSERT 100 ROWS:
INSERT INTO LARGE
  WITH
    MANYROWS (COL1) AS
    ( SELECT 1
        FROM SYSIBM.SYSDUMMY1
      UNION ALL
      SELECT COL1 + 1
        FROM MANYROWS
       WHERE COL1 < 100
    )
  SELECT *
    FROM MANYROWS ;
SELECT COUNT(*)
  FROM LARGE ;
SELECT *
  FROM LARGE
 FETCH FIRST 5 ROWS ONLY ;
./ ADD NAME=JOBCARD                                                     002810
//TSOUA07  JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=0M
./ ADD NAME=LR01                                                        002910
--*************************************************************
--*  PLEASE FILL IN ALL ________ WITH APPROPRIATE VALUES
--*************************************************************

--DROP DATABASE WWV8707N;
--COMMIT;

CREATE DATABASE WWV8707N
       ________ BP1
       ________ BP2
       STOGROUP WWV8707S;

CREATE TABLESPACE TSNEWT
IN WWV8707N
SEGSIZE __
________ 5
________ 50;

CREATE TABLE NEWTABLE
       (
         EMPNO           INTEGER       NOT NULL             ,
         FIRST_NAME      CHAR(20)      NOT NULL             ,
         MIDDLE_INITIAL  CHAR(1)                            ,
         SEX             CHAR(1)       NOT NULL             ,
         BIRTHDATE       DATE                               ,
         PHONE           CHAR(4)                            ,
         HIRING_DATE     DATE                               ,
         JOB             CHAR(20)                           ,
         EDUCATION       SMALLINT      NOT NULL             ,
         SALARY          DECIMAL(9,2)                       ,
         BONUS           DECIMAL(9,2)                       ,
         COMMISSION      DECIMAL(9,2)                       ,
         DEPTNO          CHAR(3) ,
         LOCID           CHAR(10) ,
         LAST_NAME       VARCHAR(50)   NOT NULL
          )
      ________ ________ (________ ________)
         (
          ________ ________ ENDING AT (________),
          ________ ________ ENDING AT (________),
          ________ ________ ENDING AT (________),
          ________ ________ ENDING AT (________),
          ________ ________ ENDING AT (________)
         )
          IN WWV8707N.TSNEWT;

CREATE ________ INDEX IXEMPL1N
 ON ________(________)
 ________
 ________;

CREATE INDEX IXEMPL2N
 ON ________(________)
 ________;
./ ADD NAME=LR02                                                        003010
//TSOUA07C JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..LR02,UTPROC=''
//***********************************************************
//*  LOAD UTILITY
//*
//*  PLEASE FILL IN ALL ________ WITH APPROPRIATE VALUES
//*
//***********************************************************
//SYSPRINT DD  SYSOUT=*
//DSNUPROC.SYSREC DD DSN=&SYSUID..CV87.WWV8707N.TSNEWT.P00000.DATA,
//     DISP=OLD
//DSNUPROC.SYSDISC DD DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA,
//   DSN=&SYSUID..CV87.WWV8707N.TSNEWT.P00000.DISCARD
//DSNUPROC.SYSUT1 DD DSN=&SYSUID..SYSUT1,
//     DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//DSNUPROC.SORTOUT DD DSN=&SYSUID..SORTOUT,
//     DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//DSNUPROC.SYSERR DD DSN=&SYSUID..SYSERR,
//     DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//DSNUPROC.SYSMAP DD DSN=&SYSUID..SYSMAP,
//     DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//DSNUPROC.SYSIN    DD  *
LOAD DATA REPLACE ________ ________
     INDDN ________ DISCARDDN ________ LOG ________
     INTO TABLE NEWTABLE
     (EMPNO          POSITION (  3:  8) INTEGER EXTERNAL
     ,FIRST_NAME     POSITION ( 11: 30) CHAR
     ,MIDDLE_INITIAL POSITION ( 33: 33) CHAR
     ,SEX            POSITION ( 49: 49) CHAR
     ,BIRTHDATE      POSITION ( 54: 63) DATE EXTERNAL
     ,PHONE          POSITION ( 66: 69) CHAR
     ,HIRING_DATE    POSITION ( 73: 82) DATE EXTERNAL
     ,JOB            POSITION ( 86:105) CHAR
     ,EDUCATION      POSITION (115:116) INTEGER EXTERNAL
     ,SALARY         POSITION (120:129) DECIMAL EXTERNAL
     ,BONUS          POSITION (133:142) DECIMAL EXTERNAL
     ,COMMISSION     POSITION (146:155) DECIMAL EXTERNAL
     ,DEPTNO         POSITION (158:160) CHAR
     ,LOCID          POSITION (166:175) CHAR
     ,LAST_NAME      POSITION (178:192) CHAR
     )
//
./ ADD NAME=LR03                                                        003110
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..LR03,UTPROC=''
//*****************************************************************
//*  LOAD UTILITY TO LOAD THE 5 PARTITIONS USING PARALLELISM
//*          BUILD THE INDEXES ALSO USING PARALLELISM
//*
//*  PLEASE FILL IN ALL ________ WITH APPROPRIATE VALUES
//*
//*****************************************************************
//SYSPRINT DD  SYSOUT=*
//DSNUPROC.SYSREC1 DD DSN=&SYSUID..CV87.WWV8707N.TSNEWT.________.DATA,
//     DISP=OLD
//DSNUPROC.SYSDISC1 DD DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA,
//     DSN=&SYSUID..CV87.WWV8707N.TSNEWT.________.DISCARD
//DSNUPROC.SYSREC2 DD DSN=&SYSUID..CV87.WWV8707N.TSNEWT.________.DATA,
//     DISP=OLD
//DSNUPROC.SYSDISC2 DD DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA,
//     DSN=&SYSUID..CV87.WWV8707N.TSNEWT.________.DISCARD
//DSNUPROC.SYSREC3 DD DSN=&SYSUID..CV87.WWV8707N.TSNEWT.________.DATA,
//     DISP=OLD
//DSNUPROC.SYSDISC3 DD DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA,
//     DSN=&SYSUID..CV87.WWV8707N.TSNEWT.________.DISCARD
//DSNUPROC.SYSREC4 DD DSN=&SYSUID..CV87.WWV8707N.TSNEWT.________.DATA,
//     DISP=OLD
//DSNUPROC.SYSDISC4 DD DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA,
//     DSN=&SYSUID..CV87.WWV8707N.TSNEWT.________.DISCARD
//DSNUPROC.SYSREC5 DD DSN=&SYSUID..CV87.WWV8707N.TSNEWT.________.DATA,
//     DISP=OLD
//DSNUPROC.SYSDISC5 DD DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA,
//     DSN=&SYSUID..CV87.WWV8707N.TSNEWT.________.DISCARD
//DSNUPROC.SYSUT1 DD DSN=&SYSUID..SYSUT1,
//     DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//DSNUPROC.SORTOUT DD DSN=&SYSUID..SORTOUT,
//     DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//DSNUPROC.SYSERR DD DSN=&SYSUID..SYSERR,
//     DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//DSNUPROC.SYSMAP DD DSN=&SYSUID..SYSMAP,
//     DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//DSNUPROC.SYSIN    DD  *
LOAD DATA LOG ________ ________ ________
     INTO TABLE NEWTABLE PART 1 REPLACE
     INDDN ________ DISCARDDN ________
     (EMPNO          POSITION (  3:  8) INTEGER EXTERNAL
     ,FIRST_NAME     POSITION ( 11: 30) CHAR
     ,MIDDLE_INITIAL POSITION ( 33: 33) CHAR
     ,SEX            POSITION ( 49: 49) CHAR
     ,BIRTHDATE      POSITION ( 54: 63) DATE EXTERNAL
     ,PHONE          POSITION ( 66: 69) CHAR
     ,HIRING_DATE    POSITION ( 73: 82) DATE EXTERNAL
     ,JOB            POSITION ( 86:105) CHAR
     ,EDUCATION      POSITION (115:116) INTEGER EXTERNAL
     ,SALARY         POSITION (120:129) DECIMAL EXTERNAL
     ,BONUS          POSITION (133:142) DECIMAL EXTERNAL
     ,COMMISSION     POSITION (146:155) DECIMAL EXTERNAL
     ,DEPTNO         POSITION (158:160) CHAR
     ,LOCID          POSITION (166:175) CHAR
     ,LAST_NAME      POSITION (178:192) CHAR
     )
     INTO TABLE NEWTABLE PART 2 REPLACE
     INDDN ________ DISCARDDN ________
     (EMPNO          POSITION (  3:  8) INTEGER EXTERNAL
     ,FIRST_NAME     POSITION ( 11: 30) CHAR
     ,MIDDLE_INITIAL POSITION ( 33: 33) CHAR
     ,SEX            POSITION ( 49: 49) CHAR
     ,BIRTHDATE      POSITION ( 54: 63) DATE EXTERNAL
     ,PHONE          POSITION ( 66: 69) CHAR
     ,HIRING_DATE    POSITION ( 73: 82) DATE EXTERNAL
     ,JOB            POSITION ( 86:105) CHAR
     ,EDUCATION      POSITION (115:116) INTEGER EXTERNAL
     ,SALARY         POSITION (120:129) DECIMAL EXTERNAL
     ,BONUS          POSITION (133:142) DECIMAL EXTERNAL
     ,COMMISSION     POSITION (146:155) DECIMAL EXTERNAL
     ,DEPTNO         POSITION (158:160) CHAR
     ,LOCID          POSITION (166:175) CHAR
     ,LAST_NAME      POSITION (178:192) CHAR
     )
     INTO TABLE NEWTABLE PART 3 REPLACE
     INDDN ________ DISCARDDN ________
     (EMPNO          POSITION (  3:  8) INTEGER EXTERNAL
     ,FIRST_NAME     POSITION ( 11: 30) CHAR
     ,MIDDLE_INITIAL POSITION ( 33: 33) CHAR
     ,SEX            POSITION ( 49: 49) CHAR
     ,BIRTHDATE      POSITION ( 54: 63) DATE EXTERNAL
     ,PHONE          POSITION ( 66: 69) CHAR
     ,HIRING_DATE    POSITION ( 73: 82) DATE EXTERNAL
     ,JOB            POSITION ( 86:105) CHAR
     ,EDUCATION      POSITION (115:116) INTEGER EXTERNAL
     ,SALARY         POSITION (120:129) DECIMAL EXTERNAL
     ,BONUS          POSITION (133:142) DECIMAL EXTERNAL
     ,COMMISSION     POSITION (146:155) DECIMAL EXTERNAL
     ,DEPTNO         POSITION (158:160) CHAR
     ,LOCID          POSITION (166:175) CHAR
     ,LAST_NAME      POSITION (178:192) CHAR
     )
     INTO TABLE NEWTABLE PART 4 REPLACE
     INDDN ________ DISCARDDN ________
     (EMPNO          POSITION (  3:  8) INTEGER EXTERNAL
     ,FIRST_NAME     POSITION ( 11: 30) CHAR
     ,MIDDLE_INITIAL POSITION ( 33: 33) CHAR
     ,SEX            POSITION ( 49: 49) CHAR
     ,BIRTHDATE      POSITION ( 54: 63) DATE EXTERNAL
     ,PHONE          POSITION ( 66: 69) CHAR
     ,HIRING_DATE    POSITION ( 73: 82) DATE EXTERNAL
     ,JOB            POSITION ( 86:105) CHAR
     ,EDUCATION      POSITION (115:116) INTEGER EXTERNAL
     ,SALARY         POSITION (120:129) DECIMAL EXTERNAL
     ,BONUS          POSITION (133:142) DECIMAL EXTERNAL
     ,COMMISSION     POSITION (146:155) DECIMAL EXTERNAL
     ,DEPTNO         POSITION (158:160) CHAR
     ,LOCID          POSITION (166:175) CHAR
     ,LAST_NAME      POSITION (178:192) CHAR
     )
     INTO TABLE NEWTABLE PART 5 REPLACE
     INDDN ________ DISCARDDN ________
     (EMPNO          POSITION (  3:  8) INTEGER EXTERNAL
     ,FIRST_NAME     POSITION ( 11: 30) CHAR
     ,MIDDLE_INITIAL POSITION ( 33: 33) CHAR
     ,SEX            POSITION ( 49: 49) CHAR
     ,BIRTHDATE      POSITION ( 54: 63) DATE EXTERNAL
     ,PHONE          POSITION ( 66: 69) CHAR
     ,HIRING_DATE    POSITION ( 73: 82) DATE EXTERNAL
     ,JOB            POSITION ( 86:105) CHAR
     ,EDUCATION      POSITION (115:116) INTEGER EXTERNAL
     ,SALARY         POSITION (120:129) DECIMAL EXTERNAL
     ,BONUS          POSITION (133:142) DECIMAL EXTERNAL
     ,COMMISSION     POSITION (146:155) DECIMAL EXTERNAL
     ,DEPTNO         POSITION (158:160) CHAR
     ,LOCID          POSITION (166:175) CHAR
     ,LAST_NAME      POSITION (178:192) CHAR
     )
./ ADD NAME=LR04                                                        003210
SELECT SUBSTR(A.DBNAME,1,8) AS DBNAME,
       SUBSTR(A.TSNAME,1,6) AS TSNAME,
       A.PARTITION AS PART,
       SUBSTR(B.LIMITKEY,1,6) AS LIMIT_EXT,
       SUBSTR(B.LIMITKEY_INTERNAL,1,6) AS LIMIT_INT,
       A.CARD AS ROWS, A.NPAGES,
       D.CLUSTERRATIO
FROM   SYSIBM.SYSTABSTATS A,
       SYSIBM.SYSTABLEPART B,
       SYSIBM.SYSCOLSTATS C,
       SYSIBM.SYSINDEXSTATS D
WHERE  A.DBNAME = B.DBNAME
  AND  A.TSNAME = B.TSNAME
  AND  A.PARTITION = B.PARTITION
  AND  B.PARTITION = C.PARTITION
  AND  C.PARTITION = D.PARTITION
  AND  B.TSNAME = 'TSNEWT'
  AND  C.TBNAME = 'NEWTABLE'
  AND  C.TBOWNER = USER
  AND  C.NAME = 'EMPNO'
  AND  D.NAME = 'IXEMPL1N'
  AND  D.OWNER = USER
  AND  A.OWNER = C.TBOWNER
  AND  A.NAME = C.TBNAME
./ ADD NAME=LR05                                                        003310
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..LR05,UTPROC=''
//STPRIN01 DD SYSOUT=*
//**************************************************************
//*  RUNSTATS UTILITY TO GATHER STATISTICS ON THE
//*  PARTITIONED TABLE SPACE AND CLUSTERING INDEX
//*
//*  PLEASE FILL IN ALL ________ WITH APPROPRIATE VALUES
//*
//**************************************************************
//DSNUPROC.SYSIN    DD  *
________ ________ WWV8707N.TSNEWT ________(________)
//
./ ADD NAME=LR07                                                        003410
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..LR07,UTPROC=''
//****************************************************************
//*  LOAD UTILITY
//*
//*  PLEASE FILL IN ALL ________ WITH APPROPRIATE VALUES
//*
//****************************************************************
//SYSPRINT DD  SYSOUT=*
//DSNUPROC.SYSREC1 DD DSN=&SYSUID..CV87.WWV8707N.TSNEWT.T00001.DATA,
//     DISP=OLD
//DSNUPROC.SYSDISC1 DD DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA,
//     DSN=&SYSUID..CV87.WWV8707N.TSNEWT.T00001.DISCARD
//DSNUPROC.SYSREC3 DD DSN=&SYSUID..CV87.WWV8707N.TSNEWT.T00003.DATA,
//     DISP=OLD
//DSNUPROC.SYSDISC3 DD DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA,
//     DSN=&SYSUID..CV87.WWV8707N.TSNEWT.T00003.DISCARD
//DSNUPROC.SYSUT1 DD DSN=&SYSUID..SYSUT1,
//     DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//DSNUPROC.SORTOUT DD DSN=&SYSUID..SORTOUT,
//     DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//DSNUPROC.SYSERR DD DSN=&SYSUID..SYSERR,
//     DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//DSNUPROC.SYSMAP DD DSN=&SYSUID..SYSMAP,
//     DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//DSNUPROC.SYSIN    DD  *
LOAD DATA
     SHRLEVEL ________ RESUME ________
     INTO TABLE ________ ________ ________
     INDDN ________ DISCARDDN ________
     (EMPNO          POSITION (  3:  8) INTEGER EXTERNAL
     ,FIRST_NAME     POSITION ( 11: 30) CHAR
     ,MIDDLE_INITIAL POSITION ( 33: 33) CHAR
     ,SEX            POSITION ( 49: 49) CHAR
     ,BIRTHDATE      POSITION ( 54: 63) DATE EXTERNAL
     ,PHONE          POSITION ( 66: 69) CHAR
     ,HIRING_DATE    POSITION ( 73: 82) DATE EXTERNAL
     ,JOB            POSITION ( 86:105) CHAR
     ,EDUCATION      POSITION (115:116) INTEGER EXTERNAL
     ,SALARY         POSITION (120:129) DECIMAL EXTERNAL
     ,BONUS          POSITION (133:142) DECIMAL EXTERNAL
     ,COMMISSION     POSITION (146:155) DECIMAL EXTERNAL
     ,DEPTNO         POSITION (158:160) CHAR
     ,LOCID          POSITION (166:175) CHAR
     ,LAST_NAME      POSITION (178:192) CHAR
    )
     INTO TABLE ________ ________ ________
     INDDN ________ DISCARDDN ________
     (EMPNO          POSITION (  3:  8) INTEGER EXTERNAL
     ,FIRST_NAME     POSITION ( 11: 30) CHAR
     ,MIDDLE_INITIAL POSITION ( 33: 33) CHAR
     ,SEX            POSITION ( 49: 49) CHAR
     ,BIRTHDATE      POSITION ( 54: 63) DATE EXTERNAL
     ,PHONE          POSITION ( 66: 69) CHAR
     ,HIRING_DATE    POSITION ( 73: 82) DATE EXTERNAL
     ,JOB            POSITION ( 86:105) CHAR
     ,EDUCATION      POSITION (115:116) INTEGER EXTERNAL
     ,SALARY         POSITION (120:129) DECIMAL EXTERNAL
     ,BONUS          POSITION (133:142) DECIMAL EXTERNAL
     ,COMMISSION     POSITION (146:155) DECIMAL EXTERNAL
     ,DEPTNO         POSITION (158:160) CHAR
     ,LOCID          POSITION (166:175) CHAR
     ,LAST_NAME      POSITION (178:192) CHAR
    )
./ ADD NAME=LR08                                                        003510
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..LR08,UTPROC=''
//*************************************************************
//*  RUNSTATS UTILITY TO GATHER STATISTICS
//*  ON THE TABLESPACE AND INDEX IXEMPL1N FOR PARTITIONS 1 AND 3
//*
//*  PLEASE FILL IN ALL ________ WITH APPROPRIATE VALUES
//*
//*************************************************************
//DSNUPROC.SYSIN    DD  *
________ TABLESPACE WWV8707N.TSNEWT ________ ________
         ________(IXEMPL1N ________ ________)
________ TABLESPACE WWV8707N.TSNEWT ________ ________
         ________(IXEMPL1N ________ ________)
//
./ ADD NAME=LR10                                                        003610
DELETE FROM NEWTABLE
WHERE SUBSTR(DIGITS(EMPNO),9,1) = '5' ;
./ ADD NAME=LR11                                                        003710
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..LR11,UTPROC=''
//****************************************************************
//*  ONLINE LOAD UTILITY
//*
//*  PLEASE FILL IN ALL ________ WITH APPROPRIATE VALUES
//*
//****************************************************************
//SYSPRINT DD  SYSOUT=*
//DSNUPROC.SYSREC1 DD DSN=&SYSUID..CV87.WWV8707N.TSNEWT.T00001.DATA,
//     DISP=OLD
//DSNUPROC.SYSDISC1 DD DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA,
//     DSN=&SYSUID..CV87.WWV8707N.TSNEWT.T00001.DISCARD
//DSNUPROC.SYSREC3 DD DSN=&SYSUID..CV87.WWV8707N.TSNEWT.T00003.DATA,
//     DISP=OLD
//DSNUPROC.SYSDISC3 DD DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA,
//     DSN=&SYSUID..CV87.WWV8707N.TSNEWT.T00003.DISCARD
//DSNUPROC.SYSUT1 DD DSN=&SYSUID..SYSUT1,
//     DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//DSNUPROC.SORTOUT DD DSN=&SYSUID..SORTOUT,
//     DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//DSNUPROC.SYSERR DD DSN=&SYSUID..SYSERR,
//     DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//DSNUPROC.SYSMAP DD DSN=&SYSUID..SYSMAP,
//     DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//DSNUPROC.SYSIN    DD  *
LOAD DATA
     SHRLEVEL ________ RESUME ________
     INTO TABLE ________ ________ ________
     INDDN ________ DISCARDDN ________
     (EMPNO          POSITION (  3:  8) INTEGER EXTERNAL
     ,FIRST_NAME     POSITION ( 11: 30) CHAR
     ,MIDDLE_INITIAL POSITION ( 33: 33) CHAR
     ,SEX            POSITION ( 49: 49) CHAR
     ,BIRTHDATE      POSITION ( 54: 63) DATE EXTERNAL
     ,PHONE          POSITION ( 66: 69) CHAR
     ,HIRING_DATE    POSITION ( 73: 82) DATE EXTERNAL
     ,JOB            POSITION ( 86:105) CHAR
     ,EDUCATION      POSITION (115:116) INTEGER EXTERNAL
     ,SALARY         POSITION (120:129) DECIMAL EXTERNAL
     ,BONUS          POSITION (133:142) DECIMAL EXTERNAL
     ,COMMISSION     POSITION (146:155) DECIMAL EXTERNAL
     ,DEPTNO         POSITION (158:160) CHAR
     ,LOCID          POSITION (166:175) CHAR
     ,LAST_NAME      POSITION (178:192) CHAR
    )
     INTO TABLE ________ ________ ________
     INDDN ________ DISCARDDN ________
     (EMPNO          POSITION (  3:  8) INTEGER EXTERNAL
     ,FIRST_NAME     POSITION ( 11: 30) CHAR
     ,MIDDLE_INITIAL POSITION ( 33: 33) CHAR
     ,SEX            POSITION ( 49: 49) CHAR
     ,BIRTHDATE      POSITION ( 54: 63) DATE EXTERNAL
     ,PHONE          POSITION ( 66: 69) CHAR
     ,HIRING_DATE    POSITION ( 73: 82) DATE EXTERNAL
     ,JOB            POSITION ( 86:105) CHAR
     ,EDUCATION      POSITION (115:116) INTEGER EXTERNAL
     ,SALARY         POSITION (120:129) DECIMAL EXTERNAL
     ,BONUS          POSITION (133:142) DECIMAL EXTERNAL
     ,COMMISSION     POSITION (146:155) DECIMAL EXTERNAL
     ,DEPTNO         POSITION (158:160) CHAR
     ,LOCID          POSITION (166:175) CHAR
     ,LAST_NAME      POSITION (178:192) CHAR
    )
./ ADD NAME=LR14                                                        003810
  ________ ________ IXEMPL3N
         ON ________(________)
         ________ ________ ;
./ ADD NAME=LR16                                                        003910
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..LR16,UTPROC=''
//************************************************************
//*  REBUILD INDEX UTILITY
//*  PLEASE FILL IN ________ WITH APPROPRIATE VALUES
//************************************************************
//DSNUPROC.SYSIN    DD  *
________ ________ (________.IXEMPL3N) ___________________________
//
./ ADD NAME=OREOPRG                                                     004010
       IDENTIFICATION DIVISION.                                         000017
      *-----------------------                                          000018
       PROGRAM-ID. OREOPRG.                                             000019

      ********************************************************
      *
      * PROGRAM IDEA:
      * 1.DATE OF BIRTH IS SET TO 1.1.1000 (FOR ALL EMPLOYEES).
      *   DATE OF BIRTH OF EACH EMPLOYEE IS INCREMENTED BY 1 YEAR
      *   (ONE EMPLOYEE AT A TIME).
      *   (EXCEPT WHEN REACHING YEAR 8000,
      *    IT STARTS WITH YEAR 0001 AGAIN.)
      *   AFTER ALL THESE DATES HAVE BEEN INCREMENTED BY 1,
      *   THE PROGRAM STORES THE CURRENT BIRTHYEAR, COMMITS,
      *   AND TRIES TO START AGAIN WITH THE FIRST EMPLOYEE.
      * 2.AS THE PGM DOES NOT TERMINATE DUE TO -911
      *     ( IN CASE OF -911 (ROLLBACK BECAUSE OF DEADLOCK/TIMEOUT),
      *     ( ANOTHER SQL ACCESS TO THE EMPLOYEE TABLE IS PERFORMED.
      *     ( CONSEQUENCE: AS LONG AS -911 OCCURS, THE PGM LOOPS.
      *     ( WHEN THESE ACCESSES NO LONGER CAUSE A -911,
      *     ( THE PROGRAM CAN RESUME NORMAL PROCESSING.
      *   THE PROGRAM CAN DETERMINE,
      *   AT WHICH BIRTHYEAR THE REORG UTILITY INTERRUPTED
      *   AND SUSPENDED THE PROGRAM FOR A WHILE.
      ***************************************************************
                                                                        000020
       ENVIRONMENT DIVISION.                                            000021
      *--------------------                                             000022
       CONFIGURATION SECTION.                                           000023
       INPUT-OUTPUT SECTION.                                            000024
                                                                        000025
       FILE-CONTROL.                                                    000026
                                                                        000027
       DATA DIVISION.                                                   000028
      *-------------                                                    000029
       FILE SECTION.                                                    000030
                                                                        000031
       WORKING-STORAGE SECTION.                                         000032
                                                                        000033
      *****************************************************             000034
      * SQL INCLUDE FOR SQLCA                             *             000035
      *****************************************************             000036
           EXEC SQL INCLUDE SQLCA  END-EXEC.                            000037
                                                                        000038
      *****************************************************             000039
      * SQL DECLARATION EMPLOYEE                          *             000040
      *****************************************************             000041
       01  DCLEMPL.                                                     000042
           10 EMPNO                 PIC X(6).                           000043
                                                                        000044
      *****************************************************             000045
      * OTHER VARIABLES                                   *             000046
      *****************************************************             000047
       01  ELAPSEDTIME              PIC 99.                             000063
       01  STARTTIME                PIC X(8).                           000048
       01  ENDTIME                  PIC X(8).                           000049
       01  STIMESTRUC.                                                  000050
           10 FILLER                PIC X(3).                           000051
           10 SMINUTE               PIC 99.                             000052
           10 FILLER                PIC X(3).                           000053
       01  ETIMESTRUC.                                                  000054
           10 FILLER                PIC X(3).                           000055
           10 EMINUTE               PIC 99.                             000056
           10 FILLER                PIC X(3).                           000057
       01  SQLCD                    PIC +999.                           000058
       01  INPUTRECORD.                                                 000059
           10 MAXRUNTIME            PIC 99.                             000060
           10 FILLER                PIC X(78).                          000061
       10  BIRTHYEAR                PIC S9(4) USAGE COMP.               000062
       10  CURRYEAR                 PIC S9(4) USAGE COMP.               000063
       10  TSTAMP                   PIC X(26).                          000063
       10  TSTAMP1                  PIC X(11).                          000063
      *****************************************************             000064
      * SQL CURSORS                                       *             000065
      *****************************************************             000066
                                                                        000067
           EXEC SQL DECLARE C1 CURSOR FOR                               000068
                SELECT EMPNO                                            000069
                FROM EMPLOYEE                                           000070
           END-EXEC.                                                    000071
                                                                        000072
       PROCEDURE DIVISION.                                              000073
                                                                        000074
      *****************************************************             000075
      * SQL RETURN CODE HANDLING                          *             000076
      *****************************************************             000077
           EXEC SQL WHENEVER SQLERROR   GOTO ERROR1  END-EXEC.          000078
           EXEC SQL WHENEVER SQLWARNING GOTO ERROR1  END-EXEC.          000079
           EXEC SQL WHENEVER NOT FOUND  GOTO READEND END-EXEC.          000080
                                                                        000081
      *****************************************************             000082
      * MAIN PROGRAM ROUTINE                              *             000083
      *****************************************************             000084
           EXEC SQL UPDATE EMPLOYEE                                     000085
                       SET BIRTHDATE = '01.01.1000'                     000086
           END-EXEC.                                                    000087
           EXEC SQL COMMIT WORK END-EXEC.                               000088
           ACCEPT INPUTRECORD.                                          000089
           IF MAXRUNTIME < 01 THEN MOVE 01 TO MAXRUNTIME.               000090
           IF MAXRUNTIME > 10 THEN MOVE 10 TO MAXRUNTIME.               000091
           EXEC SQL SELECT CURRENT TIME                                 000092
                      INTO :STARTTIME                                   000093
                      FROM SYSIBM.SYSDUMMY1                             000094
           END-EXEC.                                                    000095
                                                                        000096
           MOVE STARTTIME TO STIMESTRUC.                                000097
                                                                        000098
           DISPLAY '  '.                                                000099
           DISPLAY '     U P D A T E   P R O G R A M'.                  000100
           DISPLAY '  '.                                                000101
           DISPLAY 'START-TIME: ', STIMESTRUC.                          000102
           DISPLAY '  '.                                                000103
           DISPLAY 'THE PROGRAM READS ALL EMPLOYEES SEVERAL TIMES'.     000104
           DISPLAY '(VIA CURSOR PROCESSING) AND INCREMENTS'.            000105
           DISPLAY 'THEIR YEARS OF BIRTH EACH TIME BY:       1'.        000107
           DISPLAY 'UNTIL THE SPECIFIED ELAPSED TIME'.                  000108
           DISPLAY 'HAS BEEN REACHED.'.                                 000108
           DISPLAY ' '.                                                 000109
           DISPLAY 'START WITH YEAR:                      0001'.        000110
           DISPLAY ' '.                                                 000110
                                                                        000111
                                                                        000112
       READSTART.                                                       000117
           EXEC SQL OPEN C1 END-EXEC.                                   000118
                                                                        000119
           PERFORM READEMPL UNTIL SQLCODE = 100.                        000120
       READEND.                                                         000121
           EXEC SQL CLOSE C1 END-EXEC.                                  000122
                                                                        000123
           EXEC SQL SELECT MIN(YEAR(BIRTHDATE))                         000124
                      INTO :BIRTHYEAR                                   000125
                      FROM EMPLOYEE                                     000126
           END-EXEC.                                                    000127
                                                                        000128
           EXEC SQL COMMIT WORK END-EXEC.                               000129
                                                                        000130
      *  RETRIEVE CURRENT TIME AND CALCULATE ELAPSED TIME:
                                                                        000130
           EXEC SQL SELECT CURRENT TIME                                 000131
                      INTO :ENDTIME                                     000132
                      FROM SYSIBM.SYSDUMMY1                             000133
           END-EXEC.                                                    000134
                                                                        000135
           MOVE ENDTIME  TO ETIMESTRUC.                                 000136
                                                                        000148
           MOVE 0 TO ELAPSEDTIME.
           ADD EMINUTE TO ELAPSEDTIME.
                                                                        000148
      *    WAS THERE A MINUTE OVERFLOW (E.G., FROM 59 TO 01);
      *    IN THIS CASE, SMINUTE > EMINUTE.
      *    (ASSUMPTION: EACH LOOP IS SHORTER THAN 1 HOUR)
                                                                        000148
           IF SMINUTE > EMINUTE ADD 60 TO ELAPSEDTIME.
                                                                        000135
           SUBTRACT SMINUTE FROM ELAPSEDTIME.
                                                                        000148
      *  NEXT ITERATION, IF MAX.RUNTIME NOT REACHED:
                                                                        000148
           IF ELAPSEDTIME < MAXRUNTIME THEN GO TO READSTART.            000147
                                                                        000148
       ENDE.                                                            000149
           DISPLAY '  '.                                                000150
           DISPLAY 'UPDATES PERFORMED SUCCESSFULLY.'.                   000151
           DISPLAY 'LAST YEAR:                            ', BIRTHYEAR. 000152
           DISPLAY '  '.                                                000153
           DISPLAY 'END-TIME:  ', ETIMESTRUC.                           000154
           GOBACK.                                                      000155
                                                                        000156
       ERROR1.                                                          000157
                                                                        000167
      *    DISPLAY SQLERROR IN ANY CASE:
                                                                        000158
           MOVE SQLCODE TO SQLCD.
      *    DISPLAY 'ERROR, SQLCODE: ',  SQLCD.
      *    DISPLAY 'ERROR TEXT:     ',  SQLERRMC.
           DISPLAY '  '.                                                000153
                                                                        000161
      *   IF SQLCODE -911,                                              000159
      *   THEN A UTILITY INTERRUPTED THE PROGRAM:                       000159
                                                                        000161
           IF SQLCODE NOT EQUAL -911 THEN GOBACK.
                                                                        000169
      *   AS THE FOLLOWING STATEMENT YIELDS A -911 AGAIN,               000174
      *   IS IS REPEATED                                                000174
      *   UNTIL THE UTILITY RELEASES THE TABLE SPACE:                   000174
                                                                        000169
           EXEC SQL SELECT CURRENT TIMESTAMP                            000131
                      INTO :TSTAMP                                      000132
                      FROM SYSIBM.SYSDUMMY1                             000133
           END-EXEC.                                                    000134
           EXEC SQL SET :TSTAMP1 = SUBSTR(:TSTAMP,12,11)                000131
           END-EXEC.                                                    000134

           DISPLAY 'BEFORE TRIAL TO READ EMPLOYEE VIA TS SCAN:'.        000184
           DISPLAY 'EMPNO = ', EMPNO.                                   000184
           DISPLAY 'TIME = ', TSTAMP1.                                  000184
           DISPLAY 'UTILITY INTERVENTION, PROGRAM MUST WAIT'.           000185
           DISPLAY 'PROGRAM INCREMENTED UNTIL:            ', BIRTHYEAR. 000186
           DISPLAY '    '.                                              000184
                                                                        000174
           EXEC SQL SELECT MIN(YEAR(BIRTHDATE))                         000179
                      INTO :BIRTHYEAR                                   000180
                      FROM EMPLOYEE                                     000181
           END-EXEC.                                                    000182
                                                                        000169
           EXEC SQL SELECT CURRENT TIMESTAMP                            000131
                      INTO :TSTAMP                                      000132
                      FROM SYSIBM.SYSDUMMY1                             000133
           END-EXEC.                                                    000134
           EXEC SQL SET :TSTAMP1 = SUBSTR(:TSTAMP,12,11)                000131
           END-EXEC.                                                    000134
           DISPLAY 'AFTER TRIAL TO READ EMPLOYEE VIA TS SCAN:'.         000184
           DISPLAY 'EMPNO = ', EMPNO.                                   000184
           DISPLAY 'TIME = ', TSTAMP1.                                  000184
           DISPLAY 'UTILITY INTERVENTION, PROGRAM MUST WAIT'.           000185
           DISPLAY 'PROGRAM INCREMENTED UNTIL:            ', BIRTHYEAR. 000186
           DISPLAY '    '.                                              000184
           GO TO READSTART.                                             000187
      *****************************************************             000188
      * READ ALL EMPLOYEES, INCREMENT THE BIRTH DATE      *             000189
      *****************************************************             000190
       READEMPL.                                                        000191
      *    READ ONE EMPNO INTO HOST VARIABLE EMPNO:
           EXEC SQL FETCH C1 INTO :DCLEMPL        END-EXEC.             000192
                                                                        000193
      *    START WITH YEAR 0001 IF YEAR 8000 IS REACHED:
           EXEC SQL SELECT MIN(YEAR(BIRTHDATE)) INTO :CURRYEAR
                            FROM EMPLOYEE
                           WHERE EMPNO = :EMPNO   END-EXEC.

           IF CURRYEAR = 8000 THEN
                EXEC SQL UPDATE EMPLOYEE
                            SET BIRTHDATE = '01.01.0001'
                          WHERE EMPNO = :EMPNO    END-EXEC.

      *    INCREMENT THE YEAR OF BIRTH:
           EXEC SQL UPDATE EMPLOYEE                                     000194
                       SET BIRTHDATE = BIRTHDATE + 1 YEAR               000195
                     WHERE EMPNO = :EMPNO         END-EXEC.             000196

       READEMPL-END.                                                    000203
./ ADD NAME=RG01A                                                       004110
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=0M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..RG01A,UTPROC=''
//***************************************************************
//*  LOAD UTILITY
//***************************************************************
//SYSPRINT DD  SYSOUT=*
//DSNUPROC.SYSREC DD DSN=&SYSUID..CV87.TSEMPL.DATA,
//     DISP=OLD
//DSNUPROC.SYSDISC DD DSN=&SYSUID..CV87.LOAD.EMPLOYEE.ERROR1,
//     DISP=(MOD,CATLG),
//     SPACE=(16384,(20,20),,,ROUND),
//     UNIT=SYSDA
//DSNUPROC.SYSUT1 DD DSN=&SYSUID..SYSUT1,
//     DISP=(MOD,DELETE,CATLG),
//     SPACE=(16384,(20,20),,,ROUND),
//     UNIT=SYSDA
//DSNUPROC.SORTOUT DD DSN=&SYSUID..SORTOUT,
//     DISP=(MOD,DELETE,CATLG),
//     SPACE=(16384,(20,20),,,ROUND),
//     UNIT=SYSDA
//DSNUPROC.SYSERR DD DSN=&SYSUID..SYSERR,
//     DISP=(MOD,DELETE,CATLG),
//     SPACE=(16384,(20,20),,,ROUND),
//     UNIT=SYSDA
//DSNUPROC.SYSMAP DD DSN=&SYSUID..SYSMAP,
//     DISP=(MOD,DELETE,CATLG),
//     SPACE=(16384,(20,20),,,ROUND),
//     UNIT=SYSDA
//DSNUPROC.SYSIN    DD  *
LOAD DATA RESUME YES INTO TABLE EMPLOYEE PART 1
     WHEN (1:1) = 'I'
     (EMPNO          POSITION (  3:  8) CHAR
     ,FIRST_NAME     POSITION ( 11: 30) CHAR
     ,MIDDLE_INITIAL POSITION ( 33: 33) CHAR
     ,SEX            POSITION ( 49: 49) CHAR
     ,BIRTHDATE      POSITION ( 54: 63) DATE EXTERNAL
     ,PHONE          POSITION ( 66: 69) CHAR
     ,HIRING_DATE    POSITION ( 73: 82) DATE EXTERNAL
     ,JOB            POSITION ( 86:105) CHAR
     ,EDUCATION      POSITION (115:116) INTEGER EXTERNAL
     ,SALARY         POSITION (120:129) DECIMAL EXTERNAL
     ,BONUS          POSITION (133:142) DECIMAL EXTERNAL
     ,COMMISSION     POSITION (146:155) DECIMAL EXTERNAL
     ,DEPTNO         POSITION (158:160) CHAR
     ,LOCID          POSITION (166:175) CHAR
     ,LAST_NAME      POSITION (178:192) CHAR
     )
//
./ ADD NAME=RG01B                                                       004210
SET CURRENT SQLID = USER
;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20000' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20002' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20004' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20006' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20008' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20010' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20012' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20014' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20016' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20018' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20020' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20022' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20024' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20026' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20028' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20030' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20032' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20034' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20036' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20038' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20040' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20042' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20044' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20046' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20048' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20050' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20052' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20054' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20056' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20058' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20060' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20062' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20064' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20066' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20068' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20070' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20072' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20074' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20076' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20078' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20080' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20082' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20084' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20086' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20088' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20090' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20092' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20094' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20096' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20098' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20100' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20102' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20104' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20106' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20108' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20110' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20112' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20114' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20116' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20118' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20120' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20122' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20124' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20126' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20128' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20130' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20132' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20134' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20136' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20138' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20140' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20142' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20144' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20146' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20148' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20150' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20152' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20154' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20156' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20158' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20160' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20162' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20164' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20166' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20168' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20170' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20172' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20174' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20176' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20178' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20180' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20182' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20184' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20186' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20188' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20190' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20192' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20194' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20196' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20198' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20200' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20202' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20204' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20206' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20208' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20210' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20212' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20214' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20216' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20218' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20220' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20222' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20224' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20226' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20228' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20230' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20232' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20234' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20236' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20238' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20240' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20242' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20244' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20246' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20248' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20250' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20252' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20254' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20256' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20258' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20260' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20262' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20264' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20266' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20268' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20270' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20272' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20274' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20276' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20278' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20280' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20282' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20284' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20286' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20288' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20290' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20292' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20294' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20296' ;
UPDATE EMPLOYEE SET LAST_NAME =
                   'SMITH (TEXT ENLARGED TO CAUSE INDIRECT REFERENCES)'
               WHERE EMPNO = 'U20298' ;
./ ADD NAME=RG01C                                                       004310
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..RG01C,UTPROC=''
//**********************************************************
//*  RUNSTATS UTILITY
//*
//*  PLEASE FILL IN ALL ________ WITH APPROPRIATE VALUES
//*
//**********************************************************
//SYSPRINT DD  SYSOUT=*
//DSNUPROC.SYSIN    DD  *
________ ________ WWV8707D.TSEMPL TABLE (ALL) INDEX (ALL)
//
./ ADD NAME=RG01D                                                       004410
  SELECT A.TSNAME
       , A.PARTITION
       , A.CARD
       , A.NEARINDREF
       , A.FARINDREF
  FROM SYSIBM.SYSTABLEPART A, SYSIBM.SYSTABLESPACE B
  WHERE A.DBNAME = B.DBNAME
    AND A.TSNAME = B.NAME
    AND A.TSNAME = 'TSEMPL'
    AND B.CREATOR = USER
  ORDER BY PARTITION
  ;
./ ADD NAME=RG02                                                        004510
  CREATE TABLESPACE TSMTAB                                              000700
         IN WWV8707D                                                    000800
         USING STOGROUP WWV8707S                                        000900
               PRIQTY 10                                                001000
               SECQTY 10                                                001100
         SEGSIZE 8                                                      001200
  ;                                                                     001300
  CREATE TABLE OREORG_MTAB                                              001400
       ( TYPE                 CHAR(1) NOT NULL                          001500
       , SOURCE_RID           CHAR(5) NOT NULL                          001600
       , TARGET_XRID          CHAR(9) NOT NULL                          001700
       , LRSN                 CHAR(6) NOT NULL                          001800
       )                                                                001900
      IN WWV8707D.TSMTAB                                                002000
  ;                                                                     002100
  CREATE UNIQUE INDEX IXMTAB                                            002200
      ON OREORG_MTAB                                                    002300
       ( SOURCE_RID ASC, TYPE, TARGET_XRID, LRSN )                      002400
  ;                                                                     002500
./ ADD NAME=RG03A                                                       004610
//TSOUA07C JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//*****************************************************************     000005
//*                                                                     000006
//*  PRECOMPILE, COMPILE, AND LINK COBOL BATCH PROGRAM "OREOPRG":       000007
//*                                                                     000008
//*  UPDATE DATES OF BIRTH IN THE EMPLOYEE TABLE                        000008
//*                                                                     000008
//*****************************************************************     000009
//DSNAICOB EXEC DSNAICOB,MEM=OREOPRG,                                   000010
//         USER=&SYSUID.,                                               000011
//         COND=(4,LT),                                                 000012
//         PARM.PC='HOST(IBMCOB),APOST,APOSTSQL,SOURCE,XREF',           000013
//         PARM.COB='APOST,XREF,RES'                                    000014
//*
//* THE SOURCE PROGRAM IS STORED IN:
//PC.SYSIN     DD DISP=SHR,DSN=&SYSUID..CV87.CNTL(OREOPRG)              000016
//*
//* SPECIFY THE OUTPUT DBRM MEMBER -
//* NAME IT LIKE THE CNTL MEMBER CONTAINING THE SOURCE:
//DBRMLIB      DD DISP=SHR,DSN=&SYSUID..CV87.DBRMLIB(_______)           000014
//*
//PC.SYSLIB    DD DUMMY                                                 000015
//LKED.SYSLIB  DD DISP=SHR,DSN=CEE.SCEELKED
//*
//* SPECIFY YOUR PRIVATE LOADLIB:
//LKED.SYSLMOD DD DISP=SHR,DSN=&SYSUID..CV87._______                    000208
//*
//*    DB2 LANGUAGE INTERFACE DSNELI FOR TSO ATTACHMENT
//*    AND NAME OF OUTPUT LOAD MODULE (R=REPLACE):
//LKED.SYSIN     DD *
 INCLUDE SYSLIB(DSNELI)
 NAME OREOPRG(R)
/*
./ ADD NAME=RG03B                                                       004710
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),    000001
//         MSGCLASS=Q,CLASS=G,REGION=4M                                 000002
//JOBLIB   DD  DSN=DBDSNA.DB2A10.SDSNEXIT,DISP=SHR                      000004
//         DD  DSN=DBDSNA.DB2A10.SDSNLOAD,DISP=SHR                      000010
//*****************************************************************     000300
//*                                                                     000400
//*  BIND THE PROGRAM "OREOPRG":                                        000500
//*  UPDATE THE EMPLOYEE TABLE DURING REORG                             000600
//*                                                                     000700
//*****************************************************************     000800
//*                                                                     000810
//*  SPECIFY:                                                           000820
//*  - THE COLLECTION NAME    (USERID WITH TRAILING "C")                000821
//*  - THE DBRM MEMBER NAME                                             000822
//*  - THE PLAN NAME          (USERID WITH TRAILING "A")                000824
//*  - QUALIFIED PACKAGE NAME (COLLECTION-ID.PACKAGE-NAME)              000825
//*                                                                     000826
//*****************************************************************     000830
//STEP1    EXEC PGM=IKJEFT01,DYNAMNBR=20,COND=(4,LT)                    001000
//DBRMLIB  DD DISP=SHR,DSN=&SYSUID..CV87.DBRMLIB                        001200
//SYSPRINT DD SYSOUT=*                                                  001300
//SYSTSPRT DD SYSOUT=*                                                  001400
//SYSUDUMP DD SYSOUT=*                                                  001500
//SYSOUT   DD SYSOUT=*                                                  001600
//SYSTSIN DD *                                                          001700
                                                                        001710
 DSN SYSTEM (DSNA)                                                      001800
                                                                        001900
 BIND PACKAGE   (_______C)            -                                 001910
      MEMBER    (________)            -                                 001920
      OWNER     (TSOUA07 )            -                                 001930
      QUALIFIER (TSOUA07 )            -                                 001940
      ACTION    (REPLACE )            -                                 001950
      ISOLATION (CS)                  -                                 001960
      VALIDATE  (BIND)                                                  001970
                                                                        001980
 BIND PLAN      (_______A)            -                                 001990
      PKLIST    (_______C.________)   -                                 001991
      OWNER     (TSOUA07 )            -                                 001992
      ACTION    (REPLACE ) RETAIN                                       001993
//                                                                      002500
./ ADD NAME=RG04                                                        004810
//TSOUA07P JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),    000004
//         MSGCLASS=Q,CLASS=G,REGION=4M                                 000005
//JOBLIB   DD  DSN=DBDSNA.DB2A10.SDSNEXIT,DISP=SHR                      000006
//         DD  DSN=DBDSNA.DB2A10.SDSNLOAD,DISP=SHR                      000010
//**************************************************************        000020
//* COBOL BATCH JOB FOLLOWED BY REORG JOB TO RUN CONCURRENTLY           000030
//**************************************************************        000040
//*****************************************************************     000300
//*                                                                     000400
//*  RUN THE PROGRAM:                                                   000500
//*  UPDATE BIRTHDATE IN THE EMPLOYEE TABLE                             000600
//*                                                                     000700
//*****************************************************************     000800
//*                                                                     000900
//*  SPECIFY:                                                           000920
//*  - PROGRAM LOAD MODULE NAME                                         000921
//*  - PLAN NAME                                                        000922
//*                                                                     000923
//*****************************************************************     000930
//*                                                                     000940
//STEP1    EXEC PGM=IKJEFT01,DYNAMNBR=20,COND=(4,LT)                    001000
//SYSPRINT DD SYSOUT=*                                                  001200
//SYSTSPRT DD SYSOUT=*                                                  001300
//SYSUDUMP DD SYSOUT=*                                                  001400
//SYSOUT   DD SYSOUT=*                                                  001500
//SYSIN    DD *                                                         001600
01 <====== MAXIMUM RUNTIME IN MINUTES (TWO-DIGITS INPUT REQUIRED)       001700
//SYSTSIN DD *                                                          001800
 DSN SYSTEM (DSNA)                                                      001900
                                                                        002000
 RUN  PROGRAM (________)                    -                           002100
      PLAN    (_______A)                    -                           002200
      LIB     ('TSOUA07.CV87.LOADLIB')                                  002300
//*                                                                     002400
//TSOUA07R JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),    002500
//         MSGCLASS=Q,CLASS=G,REGION=4M                                 002600
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..RG04,UTPROC=''            002700
//*                                                                     002800
//**************************************************************        002900
//*  REORG TABLESPACE UTILITY (READ/WRITE MODE)                         003000
//*                                                                     003100
//*  PLEASE FILL IN ALL ________ WITH APPROPRIATE VALUES                003200
//*                                                                     003300
//**************************************************************        003400
//*                                                                     003500
//DSNUPROC.SYSCOPY DD DSN=&SYSUID..WWV8707D.TSEMPL.F.LP.P00000.RG04x,   003600
//     DISP=(MOD,CATLG),                                                003700
//     SPACE=(16384,(20,20),,,ROUND),                                   003800
//     UNIT=SYSDA                                                       003900
//DSNUPROC.SYSIN    DD  *                                               004000
________ ________ WWV8707D.TSEMPL                                       004100
      ________ ________                                                 004200
         ________ ________                                              004300
//                                                                      004500
./ ADD NAME=RG07                                                        004910
  SET CURRENT SQLID = USER
  ;
  DELETE FROM  EMPLOYEE
         WHERE EMPNO LIKE 'U2%'
  ;
./ ADD NAME=RU01                                                        005010
--
  CREATE TABLESPACE STATS IN DB07
  ;
  CREATE TABLE BRANCH
               ( BRNR        SMALLINT
               , STATE       CHAR(2)
               , CITY        CHAR(15)
               , STREET      CHAR(20)
               , MANAGER     CHAR(10) )
               IN DB07.STATS
  ;
  CREATE INDEX IXLOC ON BRANCH (STATE, CITY, STREET)
  ;
  CREATE INDEX IXMGR ON BRANCH (MANAGER)
  ;
  INSERT INTO BRANCH SELECT * FROM INST870.BRANCH
  ;
  SELECT * FROM BRANCH FETCH FIRST 10 ROWS ONLY
  ;
./ ADD NAME=RU02                                                        005110
RUNSTATS TABLESPACE ________.________
./ ADD NAME=RU03                                                        005210
  SELECT SUBSTR(NAME,1,8) AS NAME
       , COLTYPE, DEC(COLCARDF,5,2) AS COLCARDF
       , SUBSTR(HIGH2KEY,1,12) AS HIGH2KEY
       , SUBSTR(LOW2KEY,1,12) AS LOW2KEY
       , STATSTIME
    FROM SYSIBM.SYSCOLUMNS
   WHERE TBCREATOR = USER AND TBNAME = 'BRANCH'
  ;
  SELECT SUBSTR(NAME,1,10) AS NAME
       , DEC(FIRSTKEYCARDF,5,2) AS FIRSTKEYCARDF
       , DEC(FULLKEYCARDF, 5,2) AS FULLKEYCARDF
       , NLEAF,  NLEVELS
       , DEC(CLUSTERRATIOF,5,2) AS CLUSTERRATIOF
    FROM SYSIBM.SYSINDEXES
   WHERE CREATOR = USER AND TBNAME = 'BRANCH'
  ;
  SELECT SUBSTR(NAME,1,10) AS NAME, TYPE
       , DEC(FREQUENCYF,5,2) AS FREQUENCYF
       , SUBSTR(COLVALUE,  1, 14) AS COLVALUE
       , DEC(CARDF,5,2) AS CARDF
       , SUBSTR(HEX(COLGROUPCOLNO),1,12) AS COLGROUPCOLNO
       , NUMCOLUMNS, QUANTILENO
       , SUBSTR(LOWVALUE,  1, 10) AS LOWVALUE
       , SUBSTR(HIGHVALUE, 1, 10) AS HIGHVALUE
       , STATSTIME
    FROM SYSIBM.SYSCOLDIST
   WHERE TBOWNER = USER AND TBNAME = 'BRANCH'
   ORDER BY NUMCOLUMNS, NAME, TYPE, FREQUENCY DESC
  ;
./ ADD NAME=RU10                                                        005310
  SELECT *
    FROM INST870.VSYSCOLDIST
  ;
  DELETE FROM INST870.VSYSCOLDIST
   WHERE TBOWNER = USER AND TBNAME = 'BRANCH'
  ;
  SELECT *
    FROM INST870.VSYSCOLDIST
  ;
./ ADD NAME=UL01                                                        005410
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..UL01,UTPROC=''
//***********************************************************
//*  UNLOAD UTILITY
//*
//*  PLEASE FILL IN ALL ________ WITH APPROPRIATE VALUES
//*
//***********************************************************
//UNLOAD   DD  DSN=&SYSUID..CV87.WWV8707N.TSNEWT.P00000.UNLOAD,
//             DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//PUNCH    DD  DSN=&SYSUID..CV87.WWV8707N.TSNEWT.P00000.LOADCTL,
//             DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//SYSPRINT DD  SYSOUT=*
________ ________ WWV8707N.TSNEWT ________ ________:________
                  UNLDDN ________ PUNCHDDN ________
./ ADD NAME=UL02                                                        005510
//TSOUA07B JOB 30000030000026,TSOUA07,NOTIFY=&SYSUID,MSGLEVEL=(1,1),
//         MSGCLASS=Q,CLASS=G,REGION=4M
//UTIL EXEC DSNAUPRC,SYSTEM=DSNA,UID=&SYSUID..UL02,UTPROC=''
//***********************************************************
//*  UNLOAD UTILITY
//*
//*  PLEASE FILL IN ALL ________ WITH APPROPRIATE VALUES
//*
//***********************************************************
//UNLOAD1  DD  DSN=&SYSUID..CV87.WWV8707N.TSNEWT.P00001.UNLOAD,
//             DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//UNLOAD2  DD  DSN=&SYSUID..CV87.WWV8707N.TSNEWT.P00002.UNLOAD,
//             DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//UNLOAD3  DD  DSN=&SYSUID..CV87.WWV8707N.TSNEWT.P00003.UNLOAD,
//             DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//UNLOAD4  DD  DSN=&SYSUID..CV87.WWV8707N.TSNEWT.P00004.UNLOAD,
//             DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//UNLOAD5  DD  DSN=&SYSUID..CV87.WWV8707N.TSNEWT.P00005.UNLOAD,
//             DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//PUNCH1   DD  DSN=&SYSUID..CV87.WWV8707N.TSNEWT.P00001.LOADCTL,
//             DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//PUNCH2   DD  DSN=&SYSUID..CV87.WWV8707N.TSNEWT.P00002.LOADCTL,
//             DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//PUNCH3   DD  DSN=&SYSUID..CV87.WWV8707N.TSNEWT.P00003.LOADCTL,
//             DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//PUNCH4   DD  DSN=&SYSUID..CV87.WWV8707N.TSNEWT.P00004.LOADCTL,
//             DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//PUNCH5   DD  DSN=&SYSUID..CV87.WWV8707N.TSNEWT.P00005.LOADCTL,
//             DISP=(MOD,CATLG),SPACE=(TRK,(1,1)),UNIT=SYSDA
//SYSPRINT DD  SYSOUT=*
________ ________ WWV8707N.TSNEWT PART 1
                  UNLDDN ________ PUNCHDDN ________
________ ________ WWV8707N.TSNEWT PART 2
                  UNLDDN ________ PUNCHDDN ________
________ ________ WWV8707N.TSNEWT PART 3
                  UNLDDN ________ PUNCHDDN ________
________ ________ WWV8707N.TSNEWT PART 4
                  UNLDDN ________ PUNCHDDN ________
________ ________ WWV8707N.TSNEWT PART 5
                  UNLDDN ________ PUNCHDDN ________
./ ENDUP
><
