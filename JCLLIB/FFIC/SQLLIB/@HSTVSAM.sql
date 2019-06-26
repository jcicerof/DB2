@@ERRO - PARA EXECUTAR RETIRAR ESTA LINHA;                              00010007
                                                                        00020007
SET CURRENT SQLID='DBA1ADM';                                            00021002
                                                                        00022002
-- -DROP TABLESPACE DDBA0T00.HSTVSAM;                                   00023006
COMMIT;                                                                 00024004
CREATE TABLESPACE HSTVSAM                                               00030000
    IN DDBA0T00                                                         00040003
    USING STOGROUP GDAP0T00                                             00050003
    PRIQTY 22800                                                        00060000
    SECQTY 2400                                                         00070000
    ERASE NO                                                            00080000
    PCTFREE 5                                                           00090000
    BUFFERPOOL BP1                                                      00100000
    LOCKSIZE ANY                                                        00110000
    CLOSE NO                                                            00120000
    COMPRESS YES                                                        00130000
;                                                                       00140000
COMMIT;                                                                 00150000
                                                                        00160000
CREATE TABLE DBA1ADM.HSTVSAM                                            00170000
(                                                                       00180000
    DATA      DATE         NOT NULL WITH DEFAULT,                       00190000
    HORA      TIME         NOT NULL WITH DEFAULT,                       00200000
    DSNAME    CHAR(44)     NOT NULL,                                    00210000
    HI_A_RBA  FLOAT        NOT NULL,                                    00220000
    HI_U_RBA  FLOAT        NOT NULL,                                    00230000
    DBNAME    CHAR(8)      NOT NULL,                                    00240000
    SPACENAM  CHAR(8)      NOT NULL                                     00250000
)                                                                       00260000
    IN DDBA0T00.HSTVSAM                                                 00270004
;                                                                       00280000
COMMIT;                                                                 00290000
                                                                        00300000
COMMENT ON TABLE DBA1ADM.HSTVSAM IS                                     00310000
'CONTEM OS DADOS DE HIGH ALLOCATION E HIGH UTILIZATION DO VSAM DB2'     00320000
;                                                                       00330000
COMMENT ON DBA1ADM.HSTVSAM                                              00340000
(DATA      IS 'DATA DO LOAD'                                            00350000
,HORA      IS 'HORA DO LOAD'                                            00360000
,DSNAME    IS 'NOME DO DATASET VSAM'                                    00370000
,HI_A_RBA  IS 'HIGH ALLOCATION RBA'                                     00380000
,HI_U_RBA  IS 'HIGH ALLOCATION RBA'                                     00390000
,DBNAME    IS 'NOME DO DATABASE'                                        00400000
,SPACENAM  IS 'NOME DO SPACENAME')                                      00410000
;                                                                       00420000
COMMIT;                                                                 00430000
                                                                        00440000
CREATE INDEX DBA1ADM.HSTVSAM_I1                                         00450005
    ON DBA1ADM.HSTVSAM(DATA,DSNAME)                                     00460000
    USING STOGROUP GDAP0T00                                             00470004
        PRIQTY 22800                                                    00480000
        SECQTY 2400                                                     00490000
    PCTFREE 5                                                           00500000
    BUFFERPOOL BP2                                                      00510000
    CLOSE NO                                                            00520000
    COPY NO                                                             00530000
                                                                        00540000
;                                                                       00550000
COMMIT;                                                                 00560000
ALTER TABLE DBA1ADM.HSTVSAM                                             00570000
  ADD EXTENTS INTEGER NOT NULL WITH DEFAULT;                            00580000
COMMIT;                                                                 00590000
