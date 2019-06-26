DROP TABLESPACE DB2ADM.REPLICTI;                                        00001001
COMMIT;                                                                 00002001
CREATE TABLESPACE REPLICTI                                              00010000
    IN DB2ADM                                                           00020000
    USING STOGROUP STGP22D                                              00030000
        PRIQTY 4272                                                     00040000
        SECQTY 432                                                      00050000
    COMPRESS YES                                                        00060001
    BUFFERPOOL BP1                                                      00070000
    LOCKSIZE  ANY                                                       00080000
    LOCKMAX SYSTEM                                                      00090000
    CLOSE NO                                                            00100000
    MAXROWS 255                                                         00110000
;                                                                       00120000
COMMIT;                                                                 00130000
                                                                        00140000
CREATE TABLE DB2ADM.REPLICATION                                         00150000
(                                                                       00160000
    NMCDTB   CHAR(80)    NOT NULL,                                      00170002
    QTDLINES INTEGER     NOT NULL,                                      00180000
    DTMES    DATE        NOT NULL,                                      00190000
    HRS      TIME        NOT NULL                                       00200000
)                                                                       00210000
    IN DB2ADM.REPLICTI                                                  00220000
    CCSID EBCDIC                                                        00230000
;                                                                       00240000
COMMIT;                                                                 00250000
                                                                        00260000
COMMENT ON TABLE DB2ADM.REPLICATION IS                                  00270000
'TABELA DE CONTROLE DAS REPLICACOES'                                    00280000
;                                                                       00290000
COMMENT ON COLUMN DB2ADM.REPLICATION.NMCDTB IS                          00300000
'NOME DAS CDTABLES'                                                     00310000
;                                                                       00320000
COMMENT ON COLUMN DB2ADM.REPLICATION.QTDLINES IS                        00330000
'QUANTIDADES DE LINHAS NAS CDTABLES'                                    00340000
;                                                                       00350000
COMMENT ON COLUMN DB2ADM.REPLICATION.DTMES IS                           00360000
'DATA DO DIA DAS CDTABLES'                                              00370000
;                                                                       00380000
COMMENT ON COLUMN DB2ADM.REPLICATION.HRS IS                             00390000
'HORA DA REPLICACAO NAS CDTABLES'                                       00400000
;                                                                       00410000
COMMIT;                                                                 00420000
                                                                        00430000
CREATE UNIQUE INDEX DB2ADM.REPLICATION_IX1                              00440000
    ON DB2ADM.REPLICATION(NMCDTB,DTMES,HRS)                             00450000
    USING STOGROUP STGP23I                                              00460000
        PRIQTY 480                                                      00470000
        SECQTY 240                                                      00480000
    PCTFREE 5                                                           00490000
    BUFFERPOOL BP2                                                      00500000
    CLOSE NO                                                            00510000
    COPY NO                                                             00520000
    ;                                                                   00530000
COMMIT;                                                                 00540000
                                                                        00550000
GRANT SELECT,INSERT,UPDATE,DELETE ON DB2ADM.REPLICATION TO              00560000
MVSPUSER,CSPPUSER,CA7ONL;                                               00570000
COMMIT;                                                                 00580000
