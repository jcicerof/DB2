------------------------------------------------------------------------
--                                                                    --
-- DATABASE 2 ADMINISTRATION TOOL (DB2 ADMIN) , PROGRAM 5655-W34      --
--                                                                    --
-- ADB2GEN  -  EXTRACT OBJECT DEFINITIONS FROM THE DB2 CATALOG TABLES --
--                                                                    --
-- INPUT PREPARED ON : DB2A (1012 )   EXTRACT TIME : 2015-01-30 07:12 --
-- THIS EXTRACT JOB ACTUALLY RUN ON A DB2 VERSION 1015  SYSTEM        --
--                                                                    --
-- CATALOG VALUES OVERRIDDEN : NONE
--                                                                    --
-- GENERATE : SG=Y DB=Y TS=Y TB=Y VW=Y IX=Y SY=Y AL=Y LB=Y CM=Y FK=Y  --
--            TG=Y UT=N UF=N SP=N SQ=N RO=N TC=N                      --
-- GRANTS   : SG=Y DB=N TS=Y TB=Y VW=Y SC=N UT=N UF=N SP=N SQ=N       --
--                                                                    --
------------------------------------------------------------------------
------------------------------------------------------------------------
--                                                                    --
-- ADB2GEN: GENERATE DDL FOR TABLE SPACE=V10TEST1 IN DATABASE DDBA0T00 --
--                                                                    --
------------------------------------------------------------------------
--
------------------------------------------------------------------------
-- DATABASE=DDBA0T00 STOGROUP=SYSDEFLT
-- TABLE SPACE=DDBA0T00.V10TEST1
------------------------------------------------------------------------
--
--SET CURRENT SQLID='IBM1LLJ';
--
  CREATE TABLESPACE V10TEST1
    IN DDBA0T00
    USING STOGROUP SYSDEFLT
    PRIQTY 200 SECQTY 100
    ERASE  NO
    FREEPAGE 0 PCTFREE 5
    GBPCACHE CHANGED
    TRACKMOD YES
    LOGGED
    BUFFERPOOL BP0
    LOCKSIZE PAGE
    LOCKMAX 0
    CLOSE NO
    COMPRESS NO
    CCSID      EBCDIC
    DEFINE YES
    MAXROWS 255;
--
  COMMIT;
--
------------------------------------------------------------------------
--    TABLE=IBM1JCF.SLOG IN DDBA0T00.V10TEST1
------------------------------------------------------------------------
--
--SET CURRENT SQLID='DLC';
--
  CREATE TABLE IBM1JCF.SLOG
     (NAME                 VARCHAR(30) FOR SBCS DATA NOT NULL,
      CREATOR              CHAR(8) FOR SBCS DATA NOT NULL,
      VERSION              SMALLINT NOT NULL,
      STATS_USERID         CHAR(8) FOR SBCS DATA NOT NULL,
      STATS_TIMESTAMP      TIMESTAMP NOT NULL)
    IN DDBA0T00.V10TEST1
    AUDIT NONE
    DATA CAPTURE NONE
    WITH RESTRICT ON DROP
    CCSID      EBCDIC
    NOT VOLATILE
    APPEND NO  ;
--
  COMMIT;
--
------------------------------------------------------------------------
-- DATABASE=DDBA0T00
--    INDEX=IBM1JCF.SLOG_IX ON IBM1JCF.SLOG
------------------------------------------------------------------------
--
  CREATE INDEX IBM1JCF.SLOG_IX
    ON IBM1JCF.SLOG
     (NAME                  ASC,
      CREATOR               ASC,
      STATS_TIMESTAMP       DESC)
    PADDED
    USING STOGROUP SYSDEFLT
    PRIQTY 52 SECQTY 52
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    CLUSTER
    COMPRESS NO
    BUFFERPOOL BP0
    CLOSE NO
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;
--
  COMMIT;
--
------------------------------------------------------------------------
-- DATABASE=DDBA0T00
--    INDEX=IBM1JCF.SLOG_IX2 ON IBM1JCF.SLOG
------------------------------------------------------------------------
--
  CREATE INDEX IBM1JCF.SLOG_IX2
    ON IBM1JCF.SLOG
     (STATS_TIMESTAMP       DESC)
    USING STOGROUP SYSDEFLT
    PRIQTY 52 SECQTY 52
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    BUFFERPOOL BP0
    CLOSE NO
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;
--
  COMMIT;
--
------------------------------------------------------------------------
--    TABLE=IBM1JCF.SYSCOLSTATS IN DDBA0T00.V10TEST1
------------------------------------------------------------------------
--
  CREATE TABLE IBM1JCF.SYSCOLSTATS
     (TBOWNER              CHAR(8) FOR SBCS DATA NOT NULL,
      TBNAME               VARCHAR(18) FOR SBCS DATA NOT NULL,
      NAME                 VARCHAR(18) FOR SBCS DATA NOT NULL,
      "PARTITION"          SMALLINT NOT NULL,
      VERSION              SMALLINT NOT NULL,
      STATSTIME            TIMESTAMP NOT NULL,
      COLCARD              INTEGER NOT NULL,
      HIGHKEY              CHAR(8) FOR SBCS DATA NOT NULL,
      HIGH2KEY             CHAR(8) FOR SBCS DATA NOT NULL,
      LOWKEY               CHAR(8) FOR SBCS DATA NOT NULL,
      LOW2KEY              CHAR(8) FOR SBCS DATA NOT NULL)
    IN DDBA0T00.V10TEST1
    AUDIT NONE
    DATA CAPTURE NONE
    WITH RESTRICT ON DROP
    CCSID      EBCDIC
    NOT VOLATILE
    APPEND NO  ;
--
  COMMIT;
--
------------------------------------------------------------------------
-- DATABASE=DDBA0T00
--    INDEX=IBM1JCF.SYSCOLSTATS_IX ON IBM1JCF.SYSCOLSTATS
------------------------------------------------------------------------
--
  CREATE INDEX IBM1JCF.SYSCOLSTATS_IX
    ON IBM1JCF.SYSCOLSTATS
     (TBOWNER               ASC,
      TBNAME                ASC,
      NAME                  ASC,
      "PARTITION"           ASC,
      STATSTIME             DESC)
    PADDED
    USING STOGROUP SYSDEFLT
    PRIQTY 52 SECQTY 52
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    CLUSTER
    COMPRESS NO
    BUFFERPOOL BP0
    CLOSE NO
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;
--
  COMMIT;
--
------------------------------------------------------------------------
--    TABLE=IBM1JCF.SYSCOLUMNS IN DDBA0T00.V10TEST1
------------------------------------------------------------------------
--
  CREATE TABLE IBM1JCF.SYSCOLUMNS
     (TBCREATOR            CHAR(8) FOR SBCS DATA NOT NULL,
      TBNAME               VARCHAR(18) FOR SBCS DATA NOT NULL,
      NAME                 VARCHAR(18) FOR SBCS DATA NOT NULL,
      VERSION              SMALLINT NOT NULL,
      STATSTIME            TIMESTAMP NOT NULL,
      COLCARDF             FLOAT NOT NULL,
      HIGH2KEY             CHAR(8) FOR SBCS DATA NOT NULL,
      LOW2KEY              CHAR(8) FOR SBCS DATA NOT NULL)
    IN DDBA0T00.V10TEST1
    AUDIT NONE
    DATA CAPTURE NONE
    WITH RESTRICT ON DROP
    CCSID      EBCDIC
    NOT VOLATILE
    APPEND NO  ;
--
  COMMIT;
--
------------------------------------------------------------------------
-- DATABASE=DDBA0T00
--    INDEX=IBM1JCF.SYSCOLUMNS_IX ON IBM1JCF.SYSCOLUMNS
------------------------------------------------------------------------
--
  CREATE INDEX IBM1JCF.SYSCOLUMNS_IX
    ON IBM1JCF.SYSCOLUMNS
     (TBCREATOR             ASC,
      TBNAME                ASC,
      NAME                  ASC,
      STATSTIME             DESC)
    PADDED
    USING STOGROUP SYSDEFLT
    PRIQTY 52 SECQTY 52
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    CLUSTER
    COMPRESS NO
    BUFFERPOOL BP0
    CLOSE NO
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;
--
  COMMIT;
--
------------------------------------------------------------------------
--    TABLE=IBM1JCF.SYSINDEXES IN DDBA0T00.V10TEST1
------------------------------------------------------------------------
--
  CREATE TABLE IBM1JCF.SYSINDEXES
     (TBCREATOR            CHAR(8) FOR SBCS DATA NOT NULL,
      TBNAME               VARCHAR(18) FOR SBCS DATA NOT NULL,
      CREATOR              CHAR(8) FOR SBCS DATA NOT NULL,
      NAME                 VARCHAR(18) FOR SBCS DATA NOT NULL,
      VERSION              SMALLINT NOT NULL,
      STATSTIME            TIMESTAMP NOT NULL,
      SPACEF               FLOAT NOT NULL,
      CLUSTERRATIOF        FLOAT NOT NULL,
      FIRSTKEYCARDF        FLOAT NOT NULL,
      FULLKEYCARDF         FLOAT NOT NULL,
      NLEAF                INTEGER NOT NULL,
      NLEVELS              SMALLINT NOT NULL,
      CLUSTERED            CHAR(1) FOR SBCS DATA NOT NULL)
    IN DDBA0T00.V10TEST1
    AUDIT NONE
    DATA CAPTURE NONE
    WITH RESTRICT ON DROP
    CCSID      EBCDIC
    NOT VOLATILE
    APPEND NO  ;
--
  COMMIT;
--
------------------------------------------------------------------------
-- DATABASE=DDBA0T00
--    INDEX=IBM1JCF.SYSINDEXES_IX ON IBM1JCF.SYSINDEXES
------------------------------------------------------------------------
--
  CREATE INDEX IBM1JCF.SYSINDEXES_IX
    ON IBM1JCF.SYSINDEXES
     (TBCREATOR             ASC,
      TBNAME                ASC,
      CREATOR               ASC,
      NAME                  ASC,
      STATSTIME             DESC)
    PADDED
    USING STOGROUP SYSDEFLT
    PRIQTY 52 SECQTY 52
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    CLUSTER
    COMPRESS NO
    BUFFERPOOL BP0
    CLOSE NO
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;
--
  COMMIT;
--
------------------------------------------------------------------------
-- DATABASE=DDBA0T00
--    INDEX=IBM1JCF.SYSINDEXES_IX2 ON IBM1JCF.SYSINDEXES
------------------------------------------------------------------------
--
  CREATE INDEX IBM1JCF.SYSINDEXES_IX2
    ON IBM1JCF.SYSINDEXES
     (CREATOR               ASC,
      NAME                  ASC,
      STATSTIME             DESC)
    PADDED
    USING STOGROUP SYSDEFLT
    PRIQTY 52 SECQTY 52
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    BUFFERPOOL BP0
    CLOSE NO
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;
--
  COMMIT;
--
------------------------------------------------------------------------
--    TABLE=IBM1JCF.SYSINDEXPART IN DDBA0T00.V10TEST1
------------------------------------------------------------------------
--
  CREATE TABLE IBM1JCF.SYSINDEXPART
     (IXCREATOR            CHAR(8) FOR SBCS DATA NOT NULL,
      IXNAME               VARCHAR(18) FOR SBCS DATA NOT NULL,
      "PARTITION"          SMALLINT NOT NULL,
      VERSION              SMALLINT NOT NULL,
      STATSTIME            TIMESTAMP NOT NULL,
      CARDF                FLOAT NOT NULL,
      SPACEF               FLOAT NOT NULL,
      PQTY                 INTEGER NOT NULL,
      SQTY                 SMALLINT NOT NULL,
      DSNUM                INTEGER NOT NULL,
      EXTENTS              INTEGER NOT NULL,
      NEAROFFPOSF          FLOAT NOT NULL,
      FAROFFPOSF           FLOAT NOT NULL,
      LEAFDIST             INTEGER NOT NULL,
      LEAFNEAR             INTEGER NOT NULL,
      LEAFFAR              INTEGER NOT NULL,
      PSEUDO_DEL_ENTRIES   INTEGER NOT NULL,
      SECQTYI              INTEGER NOT NULL)
    IN DDBA0T00.V10TEST1
    AUDIT NONE
    DATA CAPTURE NONE
    WITH RESTRICT ON DROP
    CCSID      EBCDIC
    NOT VOLATILE
    APPEND NO  ;
--
  COMMIT;
--
------------------------------------------------------------------------
-- DATABASE=DDBA0T00
--    INDEX=IBM1JCF.SYSINDEXPART_IX ON IBM1JCF.SYSINDEXPART
------------------------------------------------------------------------
--
  CREATE INDEX IBM1JCF.SYSINDEXPART_IX
    ON IBM1JCF.SYSINDEXPART
     (IXCREATOR             ASC,
      IXNAME                ASC,
      "PARTITION"           ASC,
      STATSTIME             DESC)
    PADDED
    USING STOGROUP SYSDEFLT
    PRIQTY 52 SECQTY 52
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    CLUSTER
    COMPRESS NO
    BUFFERPOOL BP0
    CLOSE NO
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;
--
  COMMIT;
--
------------------------------------------------------------------------
--    TABLE=IBM1JCF.SYSINDEXSTATS IN DDBA0T00.V10TEST1
------------------------------------------------------------------------
--
  CREATE TABLE IBM1JCF.SYSINDEXSTATS
     (OWNER                CHAR(8) FOR SBCS DATA NOT NULL,
      NAME                 VARCHAR(18) FOR SBCS DATA NOT NULL,
      "PARTITION"          SMALLINT NOT NULL,
      VERSION              SMALLINT NOT NULL,
      STATSTIME            TIMESTAMP NOT NULL,
      CLUSTERRATIOF        FLOAT NOT NULL,
      FIRSTKEYCARDF        FLOAT NOT NULL,
      FULLKEYCARDF         FLOAT NOT NULL,
      NLEAF                INTEGER NOT NULL,
      NLEVELS              SMALLINT NOT NULL,
      KEYCOUNTF            FLOAT NOT NULL)
    IN DDBA0T00.V10TEST1
    AUDIT NONE
    DATA CAPTURE NONE
    WITH RESTRICT ON DROP
    CCSID      EBCDIC
    NOT VOLATILE
    APPEND NO  ;
--
  COMMIT;
--
------------------------------------------------------------------------
-- DATABASE=DDBA0T00
--    INDEX=IBM1JCF.SYSINDEXSTATS_IX ON IBM1JCF.SYSINDEXSTATS
------------------------------------------------------------------------
--
  CREATE INDEX IBM1JCF.SYSINDEXSTATS_IX
    ON IBM1JCF.SYSINDEXSTATS
     (OWNER                 ASC,
      NAME                  ASC,
      "PARTITION"           ASC,
      STATSTIME             DESC)
    PADDED
    USING STOGROUP SYSDEFLT
    PRIQTY 52 SECQTY 52
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    CLUSTER
    COMPRESS NO
    BUFFERPOOL BP0
    CLOSE NO
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;
--
  COMMIT;
--
------------------------------------------------------------------------
--    TABLE=IBM1JCF.SYSTABLEPART IN DDBA0T00.V10TEST1
------------------------------------------------------------------------
--
  CREATE TABLE IBM1JCF.SYSTABLEPART
     (DBNAME               CHAR(8) FOR SBCS DATA NOT NULL,
      TSNAME               CHAR(8) FOR SBCS DATA NOT NULL,
      "PARTITION"          SMALLINT NOT NULL,
      VERSION              SMALLINT NOT NULL,
      STATSTIME            TIMESTAMP NOT NULL,
      CARDF                FLOAT NOT NULL,
      SPACEF               FLOAT NOT NULL,
      PQTY                 INTEGER NOT NULL,
      SQTY                 SMALLINT NOT NULL,
      DSNUM                INTEGER NOT NULL,
      EXTENTS              INTEGER NOT NULL,
      NEARINDREF           INTEGER NOT NULL,
      FARINDREF            INTEGER NOT NULL,
      PERCACTIVE           SMALLINT NOT NULL,
      PERCDROP             SMALLINT NOT NULL,
      PAGESAVE             SMALLINT NOT NULL,
      SECQTYI              INTEGER NOT NULL)
    IN DDBA0T00.V10TEST1
    AUDIT NONE
    DATA CAPTURE NONE
    WITH RESTRICT ON DROP
    CCSID      EBCDIC
    NOT VOLATILE
    APPEND NO  ;
--
  COMMIT;
--
------------------------------------------------------------------------
-- DATABASE=DDBA0T00
--    INDEX=IBM1JCF.SYSTABLEPART_IX ON IBM1JCF.SYSTABLEPART
------------------------------------------------------------------------
--
  CREATE INDEX IBM1JCF.SYSTABLEPART_IX
    ON IBM1JCF.SYSTABLEPART
     (DBNAME                ASC,
      TSNAME                ASC,
      "PARTITION"           ASC,
      STATSTIME             DESC)
    USING STOGROUP SYSDEFLT
    PRIQTY 52 SECQTY 52
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    CLUSTER
    COMPRESS NO
    BUFFERPOOL BP0
    CLOSE NO
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;
--
  COMMIT;
--
------------------------------------------------------------------------
--    TABLE=IBM1JCF.SYSTABLES IN DDBA0T00.V10TEST1
------------------------------------------------------------------------
--
  CREATE TABLE IBM1JCF.SYSTABLES
     (CREATOR              CHAR(8) FOR SBCS DATA NOT NULL,
      NAME                 VARCHAR(18) FOR SBCS DATA NOT NULL,
      DBNAME               CHAR(8) FOR SBCS DATA NOT NULL,
      TSNAME               CHAR(8) FOR SBCS DATA NOT NULL,
      VERSION              SMALLINT NOT NULL,
      STATSTIME            TIMESTAMP NOT NULL,
      CARDF                FLOAT NOT NULL,
      SPACEF               FLOAT NOT NULL,
      NPAGESF              FLOAT NOT NULL,
      AVGROWLEN            INTEGER NOT NULL,
      PCTPAGES             SMALLINT NOT NULL,
      PCTROWCOMP           SMALLINT NOT NULL)
    IN DDBA0T00.V10TEST1
    AUDIT NONE
    DATA CAPTURE NONE
    WITH RESTRICT ON DROP
    CCSID      EBCDIC
    NOT VOLATILE
    APPEND NO  ;
--
  COMMIT;
--
------------------------------------------------------------------------
-- DATABASE=DDBA0T00
--    INDEX=IBM1JCF.SYSTABLES_IX ON IBM1JCF.SYSTABLES
------------------------------------------------------------------------
--
  CREATE INDEX IBM1JCF.SYSTABLES_IX
    ON IBM1JCF.SYSTABLES
     (CREATOR               ASC,
      NAME                  ASC,
      STATSTIME             DESC)
    PADDED
    USING STOGROUP SYSDEFLT
    PRIQTY 52 SECQTY 52
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    CLUSTER
    COMPRESS NO
    BUFFERPOOL BP0
    CLOSE NO
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;
--
  COMMIT;
--
------------------------------------------------------------------------
-- DATABASE=DDBA0T00
--    INDEX=IBM1JCF.SYSTABLES_IX2 ON IBM1JCF.SYSTABLES
------------------------------------------------------------------------
--
  CREATE INDEX IBM1JCF.SYSTABLES_IX2
    ON IBM1JCF.SYSTABLES
     (DBNAME                ASC,
      TSNAME                ASC,
      STATSTIME             DESC)
    USING STOGROUP SYSDEFLT
    PRIQTY 52 SECQTY 52
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    BUFFERPOOL BP0
    CLOSE NO
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;
--
  COMMIT;
--
------------------------------------------------------------------------
--    TABLE=IBM1JCF.SYSTABLESPACE IN DDBA0T00.V10TEST1
------------------------------------------------------------------------
--
  CREATE TABLE IBM1JCF.SYSTABLESPACE
     (DBNAME               CHAR(8) FOR SBCS DATA NOT NULL,
      NAME                 VARCHAR(18) FOR SBCS DATA NOT NULL,
      VERSION              SMALLINT NOT NULL,
      STATSTIME            TIMESTAMP NOT NULL,
      NACTIVEF             FLOAT NOT NULL)
    IN DDBA0T00.V10TEST1
    AUDIT NONE
    DATA CAPTURE NONE
    WITH RESTRICT ON DROP
    CCSID      EBCDIC
    NOT VOLATILE
    APPEND NO  ;
--
  COMMIT;
--
------------------------------------------------------------------------
-- DATABASE=DDBA0T00
--    INDEX=IBM1JCF.SYSTABLESPACE_IX ON IBM1JCF.SYSTABLESPACE
------------------------------------------------------------------------
--
  CREATE INDEX IBM1JCF.SYSTABLESPACE_IX
    ON IBM1JCF.SYSTABLESPACE
     (DBNAME                ASC,
      NAME                  ASC,
      STATSTIME             DESC)
    PADDED
    USING STOGROUP SYSDEFLT
    PRIQTY 52 SECQTY 52
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    CLUSTER
    COMPRESS NO
    BUFFERPOOL BP0
    CLOSE NO
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;
--
  COMMIT;
--
------------------------------------------------------------------------
--    TABLE=IBM1JCF.SYSTABSTATS IN DDBA0T00.V10TEST1
------------------------------------------------------------------------
--
  CREATE TABLE IBM1JCF.SYSTABSTATS
     (DBNAME               CHAR(8) FOR SBCS DATA NOT NULL,
      TSNAME               CHAR(8) FOR SBCS DATA NOT NULL,
      OWNER                CHAR(8) FOR SBCS DATA NOT NULL,
      NAME                 VARCHAR(18) FOR SBCS DATA NOT NULL,
      "PARTITION"          SMALLINT NOT NULL,
      VERSION              SMALLINT NOT NULL,
      STATSTIME            TIMESTAMP NOT NULL,
      CARDF                FLOAT NOT NULL,
      NPAGES               INTEGER NOT NULL,
      NACTIVE              INTEGER NOT NULL,
      PCTPAGES             SMALLINT NOT NULL,
      PCTROWCOMP           SMALLINT NOT NULL)
    IN DDBA0T00.V10TEST1
    AUDIT NONE
    DATA CAPTURE NONE
    WITH RESTRICT ON DROP
    CCSID      EBCDIC
    NOT VOLATILE
    APPEND NO  ;
--
  COMMIT;
--
------------------------------------------------------------------------
-- DATABASE=DDBA0T00
--    INDEX=IBM1JCF.SYSTABSTATS_IX ON IBM1JCF.SYSTABSTATS
------------------------------------------------------------------------
--
  CREATE INDEX IBM1JCF.SYSTABSTATS_IX
    ON IBM1JCF.SYSTABSTATS
     (OWNER                 ASC,
      NAME                  ASC,
      "PARTITION"           ASC,
      STATSTIME             DESC)
    PADDED
    USING STOGROUP SYSDEFLT
    PRIQTY 52 SECQTY 52
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    CLUSTER
    COMPRESS NO
    BUFFERPOOL BP0
    CLOSE NO
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;
--
  COMMIT;
--
------------------------------------------------------------------------
-- DATABASE=DDBA0T00
--    INDEX=IBM1JCF.SYSTABSTATS_IX2 ON IBM1JCF.SYSTABSTATS
------------------------------------------------------------------------
--
  CREATE INDEX IBM1JCF.SYSTABSTATS_IX2
    ON IBM1JCF.SYSTABSTATS
     (DBNAME                ASC,
      TSNAME                ASC,
      "PARTITION"           ASC,
      STATSTIME             DESC)
    USING STOGROUP SYSDEFLT
    PRIQTY 52 SECQTY 52
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    BUFFERPOOL BP0
    CLOSE NO
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;
--
  COMMIT;
--
--  REBIND PACKAGE(#PACKAGES#.HAA#ERSI.(PM40848))
--
--  REBIND PACKAGE(HAAC410.HAA#BCLR.(PRD0410))
--
--  REBIND PACKAGE(HAAC410.HAA#ERSI.(PRD0410))
--
--  REBIND PACKAGE(HAAC410.HAA#ERSU.(PRD0410))
--
--  REBIND PACKAGE(HAAC410.HAA#ESTI.(PRD0410))
--
--  REBIND PACKAGE(HAAC410.HAA#ETGI.(PRD0410))
--
--  REBIND PACKAGE(HAAC410S.HAA#ERSI.(PRD0410))
--
--  REBIND PACKAGE(HAAV220.HAA#BCLR)
--
--  REBIND PACKAGE(HAAV220.HAA#ERSI)
--
--  REBIND PACKAGE(HAAV220.HAA#ESTI)
--
--  REBIND PACKAGE(HAAV220S.HAA#ERSI)
--
--  REBIND PACKAGE(HAAV310.HAA#BCLR.(PM12078))
--
--  REBIND PACKAGE(HAAV310.HAA#BCLR.(PM31932))
--
--  REBIND PACKAGE(HAAV310.HAA#ERSI.(PM16606))
--
--  REBIND PACKAGE(HAAV310.HAA#ERSI.(PM40848))
--
--  REBIND PACKAGE(HAAV310.HAA#ERSU.(PM12078))
--
--  REBIND PACKAGE(HAAV310.HAA#ERSU.(PM16607))
--
--  REBIND PACKAGE(HAAV310.HAA#ESTI.(PM12078))
--
--  REBIND PACKAGE(HAAV310.HAA#ESTI.(PM16607))
--
--  REBIND PACKAGE(HAAV310.HAA#ETGI.(PK78851))
--
--  REBIND PACKAGE(HAAV310.HAA#ETGI.(PM16607))
--
--  REBIND PACKAGE(HAAV310S.HAA#ERSI.(PM16606))
--
--  REBIND PACKAGE(HAAV310S.HAA#ERSI.(PM40848))
--
------------------------------------------------------------------------
-- ADB2GEN - END OF GENERATED DDL                                     --
------------------------------------------------------------------------
--
