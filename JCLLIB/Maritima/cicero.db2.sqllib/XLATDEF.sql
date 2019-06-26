DROP TABLESPACE DB2ADM.XLAT;                                            00020000
COMMIT;                                                                 00030000
                                                                        00040000
CREATE  TABLESPACE XLAT                                                 00050000
IN      DB2ADM                                                          00060000
USING   STOGROUP STGP33D                                                00070000
        PRIQTY 4800                                                     00080002
        SECQTY 4800                                                     00090002
        ERASE NO                                                        00100000
        FREEPAGE 0                                                      00110000
        PCTFREE 5                                                       00120000
        BUFFERPOOL BP1                                                  00130000
        LOCKSIZE ANY                                                    00140000
        CLOSE YES                                                       00150000
        LOCKMAX SYSTEM                                                  00160000
    ;                                                                   00170000
COMMIT;                                                                 00180000
CREATE  TABLE DB2ADM.XLAT                                               00190000
(       LPAR             CHAR ( 4 ) NOT NULL                            00200000
,       SSID             CHAR ( 4 ) NOT NULL                            00210000
,       DBNAME           CHAR ( 24 ) NOT NULL                           00220000
,       SPACENAME        CHAR ( 24 ) NOT NULL                           00230000
,       DBID             SMALLINT NOT NULL                              00240000
,       "OBID"           SMALLINT NOT NULL                              00250000
,       "PSID"           SMALLINT NOT NULL                              00260001
,       "ISOBID"         SMALLINT NOT NULL                              00270001
,       PGSIZE           SMALLINT NOT NULL                              00280000
,       "DSSIZE"         INTEGER  NOT NULL                              00290001
,       "NUMPARTS"       SMALLINT NOT NULL                              00300000
,       PIECESIZ         INTEGER  NOT NULL                              00310001
,       CREATOR          CHAR ( 24 ) NOT NULL                           00320000
,       NAME             CHAR ( 128 ) NOT NULL                          00330000
,       TYPE             CHAR ( 1 ) NOT NULL                            00331000
   )                                                                    00340000
IN      DB2ADM.XLAT                                                     00350000
   ;                                                                    00360000
COMMIT;                                                                 00370000
