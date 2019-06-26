----------------------------------------------------------------------- 00076800
--THE FOLLOWING STATEMENT CREATES THE SAMPLE TABLESPACE FOR THE V7.1    00077600
--SAMPLE PLAN_TABLE.                                                    00078400
--                                                                      00079200
--CREATE TABLESPACE PLANTABL                                            00080000
--   IN DDB2ADM                                                         00090000
--   USING STOGROUP DSN8G!!0                                            00100000
--     PRIQTY 20                                                        00101000
--     SECQTY 20                                                        00102000
--     ERASE NO                                                         00103000
--   LOCKSIZE PAGE LOCKMAX SYSTEM                                       00104000
--   BUFFERPOOL BP0                                                     00105000
--   CLOSE NO                                                           00106000
--   CCSID EBCDIC;                                                      00108000
--                                                                      00110000
                                                                        00120000
----------------------------------------------------------------------- 00122000
--THE FOLLOWING STATEMENT CREATES THE V7.1 SAMPLE PLAN_TABLE.           00124000
                                                                        00126000
  CREATE TABLE CICERO.PLAN_TABLE                                        00128000
        ( "QUERYNO"            INTEGER      NOT NULL,                   00137990
          "QBLOCKNO"           SMALLINT     NOT NULL,                   00145980
          "APPLNAME"           CHAR(8)      NOT NULL,                   00153970
          "PROGNAME"           CHAR(8)      NOT NULL,                   00161960
          "PLANNO"             SMALLINT     NOT NULL,                   00169950
          "METHOD"             SMALLINT     NOT NULL,                   00177940
          "CREATOR"            CHAR(8)      NOT NULL,                   00185930
          "TNAME"              CHAR(18)     NOT NULL,                   00193920
          "TABNO"              SMALLINT     NOT NULL,                   00201910
          "ACCESSTYPE"         CHAR(2)      NOT NULL,                   00209900
          "MATCHCOLS"          SMALLINT     NOT NULL,                   00217890
          "ACCESSCREATOR"      CHAR(8)      NOT NULL,                   00225880
          "ACCESSNAME"         CHAR(18)     NOT NULL,                   00233870
          "INDEXONLY"          CHAR(1)      NOT NULL,                   00241860
          "SORTN_UNIQ"         CHAR(1)      NOT NULL,                   00249850
          "SORTN_JOIN"         CHAR(1)      NOT NULL,                   00257840
          "SORTN_ORDERBY"      CHAR(1)      NOT NULL,                   00265830
          "SORTN_GROUPBY"      CHAR(1)      NOT NULL,                   00273820
          "SORTC_UNIQ"         CHAR(1)      NOT NULL,                   00281810
          "SORTC_JOIN"         CHAR(1)      NOT NULL,                   00289800
          "SORTC_ORDERBY"      CHAR(1)      NOT NULL,                   00297790
          "SORTC_GROUPBY"      CHAR(1)      NOT NULL,                   00305780
          "TSLOCKMODE"         CHAR(3)      NOT NULL,                   00313770
          "TIMESTAMP"          CHAR(16)     NOT NULL,                   00321760
          "REMARKS"            VARCHAR(254) NOT NULL,                   00329750
          "PREFETCH"           CHAR(1)      NOT NULL WITH DEFAULT,      00337740
          "COLUMN_FN_EVAL"     CHAR(1)      NOT NULL WITH DEFAULT,      00345730
          "MIXOPSEQ"           SMALLINT     NOT NULL WITH DEFAULT,      00353720
          "VERSION"            VARCHAR(64)  NOT NULL WITH DEFAULT,      00361710
          "COLLID"             CHAR(18)     NOT NULL WITH DEFAULT,      00369700
          "ACCESS_DEGREE"      SMALLINT,                                00377690
          "ACCESS_PGROUP_ID"   SMALLINT,                                00385680
          "JOIN_DEGREE"        SMALLINT,                                00393670
          "JOIN_PGROUP_ID"     SMALLINT,                                00401660
          "SORTC_PGROUP_ID"    SMALLINT,                                00409650
          "SORTN_PGROUP_ID"    SMALLINT,                                00417640
          "PARALLELISM_MODE"   CHAR(1),                                 00425630
          "MERGE_JOIN_COLS"    SMALLINT,                                00433620
          "CORRELATION_NAME"   CHAR(18),                                00441610
          "PAGE_RANGE"         CHAR(1)      NOT NULL WITH DEFAULT,      00449600
          "JOIN_TYPE"          CHAR(1)      NOT NULL WITH DEFAULT,      00457590
          "GROUP_MEMBER"       CHAR(8)      NOT NULL WITH DEFAULT,      00465580
          "IBM_SERVICE_DATA"   VARCHAR(254) NOT NULL WITH DEFAULT,      00473570
          "WHEN_OPTIMIZE"      CHAR(1)      NOT NULL WITH DEFAULT,      00481560
          "QBLOCK_TYPE"        CHAR(6)      NOT NULL WITH DEFAULT,      00489550
          "BIND_TIME"          TIMESTAMP    NOT NULL WITH DEFAULT,      00497540
          "OPTHINT"            CHAR(8)      NOT NULL WITH DEFAULT,      00505530
          "HINT_USED"          CHAR(8)      NOT NULL WITH DEFAULT,      00513520
          "PRIMARY_ACCESSTYPE" CHAR(1)      NOT NULL WITH DEFAULT,      00521510
          "PARENT_QBLOCKNO"    SMALLINT     NOT NULL WITH DEFAULT,      00529500
          "TABLE_TYPE"         CHAR(1)                                  00537490
        )                                                               00545480
      IN DATABASE DB2ADM                                                00553470
   CCSID EBCDIC;                                                        00561460
COMMIT;                                                                 00573000
                                                                        00574000
----------------------------------------------------------------------- 00575000
--THE FOLLOWING STATEMENT CREATES THE V7.1 SAMPLE DSN_FUNCTION_TABLE.   00575020
                                                                        00575040
  CREATE TABLE CICERO.DSN_FUNCTION_TABLE                                00575060
        ( "QUERYNO"            INTEGER      NOT NULL WITH DEFAULT,      00575090
          "QBLOCKNO"           INTEGER      NOT NULL WITH DEFAULT,      00575100
          "APPLNAME"           CHAR(8)      NOT NULL WITH DEFAULT,      00575110
          "PROGNAME"           CHAR(8)      NOT NULL WITH DEFAULT,      00575120
          "COLLID"             CHAR(18)     NOT NULL WITH DEFAULT,      00575130
          "GROUP_MEMBER"       CHAR(8)      NOT NULL WITH DEFAULT,      00575140
          "EXPLAIN_TIME"       TIMESTAMP    NOT NULL WITH DEFAULT,      00575150
          "SCHEMA_NAME"        CHAR(8)      NOT NULL WITH DEFAULT,      00575160
          "FUNCTION_NAME"      CHAR(18)     NOT NULL WITH DEFAULT,      00575170
          "SPEC_FUNC_NAME"     CHAR(18)     NOT NULL WITH DEFAULT,      00575180
          "FUNCTION_TYPE"      CHAR(2)      NOT NULL WITH DEFAULT,      00575190
          "VIEW_CREATOR"       CHAR(8)      NOT NULL WITH DEFAULT,      00575200
          "VIEW_NAME"          CHAR(18)     NOT NULL WITH DEFAULT,      00575210
          "PATH"               VARCHAR(254) NOT NULL WITH DEFAULT,      00575220
          "FUNCTION_TEXT"      VARCHAR(254) NOT NULL WITH DEFAULT       00575230
        )                                                               00575240
      IN DATABASE DB2ADM                                                00575250
   CCSID EBCDIC;                                                        00575260
COMMIT;                                                                 00575440
                                                                        00575460
----------------------------------------------------------------------- 00575480
--THE FOLLOWING STATEMENT CREATES THE V7.1 SAMPLE DSN_STATEMNT_TABLE.   00575500
                                                                        00575520
  CREATE TABLE CICERO.DSN_STATEMNT_TABLE                                00575540
        ( "QUERYNO"            INTEGER      NOT NULL WITH DEFAULT,      00575570
          "APPLNAME"           CHAR(8)      NOT NULL WITH DEFAULT,      00575580
          "PROGNAME"           CHAR(8)      NOT NULL WITH DEFAULT,      00575590
          "COLLID"             CHAR(18)     NOT NULL WITH DEFAULT,      00575600
          "GROUP_MEMBER"       CHAR(8)      NOT NULL WITH DEFAULT,      00575610
          "EXPLAIN_TIME"       TIMESTAMP    NOT NULL WITH DEFAULT,      00575620
          "STMT_TYPE"          CHAR(6)      NOT NULL WITH DEFAULT,      00575630
          "COST_CATEGORY"      CHAR(1)      NOT NULL WITH DEFAULT,      00575640
          "PROCMS"             INTEGER      NOT NULL WITH DEFAULT,      00575650
          "PROCSU"             INTEGER      NOT NULL WITH DEFAULT,      00575660
          "REASON"             VARCHAR(254) NOT NULL WITH DEFAULT       00575670
        )                                                               00575680
      IN DATABASE DB2ADM                                                00575690
   CCSID EBCDIC;                                                        00575700
COMMIT;                                                                 00575910
                                                                        00575940
----------------------------------------------------------------------- 00575970
--THE FOLLOWING STATEMENT CREATES AN INDEX ON THE V7.1 SAMPLE           00576000
--PLAN_TABLE THAT CAN BE USED BY THE DB2 OPTIMIZER TO RETRIEVE ROWS     00577000
--FOR OPTIMIZATION HINTS.                                               00578000
                                                                        00579000
  CREATE INDEX CICERO.PLAN_TABLE_HINT_IX                                00580000
            ON CICERO.PLAN_TABLE                                        00581000
        ( "QUERYNO",                                                    00582690
          "APPLNAME",                                                   00583380
          "PROGNAME",                                                   00584070
          "VERSION",                                                    00584760
          "COLLID",                                                     00585450
          "OPTHINT" )                                                   00586140
     USING STOGROUP STGP40I                                             00587000
       PRIQTY 96                                                        00588000
       ERASE NO                                                         00589000
     BUFFERPOOL BP0                                                     00590000
     CLOSE NO;                                                          00591000
COMMIT;                                                                 00592000
