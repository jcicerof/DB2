DROP TABLESPACE DB2ADM.CICEROTS;                                        00001003
COMMIT;                                                                 00002003
CREATE  TABLESPACE CICEROTS                                             00010000
IN      DB2ADM                                                          00020000
USING   STOGROUP STGP20D                                                00030004
                     PRIQTY 48                                          00040001
                     SECQTY 48                                          00050001
                     ERASE NO                                           00060000
                     FREEPAGE 0                                         00070000
                     PCTFREE 0                                          00080000
           BUFFERPOOL BP1                                               00090000
           LOCKSIZE ROW                                                 00100000
           CLOSE NO                                                     00110000
           LOCKMAX SYSTEM                                               00120000
           CCSID EBCDIC                                                 00130000
    ;                                                                   00140000
   COMMIT WORK;                                                         00150000
CREATE  TABLE DB2ADM.CICEROTB                                           00160003
(       SIGLAUF CHAR ( 2 ) NOT NULL                                     00170000
,       NMUF CHAR ( 30 ) NOT NULL                                       00180000
   )                                                                    00190000
IN      DB2ADM.CICEROTS                                                 00200000
   CCSID         EBCDIC                                                 00210000
   ;                                                                    00220000
COMMIT WORK;                                                            00230000
CREATE  INDEX DB2ADM.CICEROIX ON DB2ADM.CICEROTB                        00240003
(       SIGLAUF ASC                                                     00250000
          )                                                             00260000
USING   STOGROUP STGP17I                                                00270004
                     PRIQTY 48                                          00280000
                     SECQTY 48                                          00290000
                     ERASE NO                                           00300000
                     FREEPAGE 0                                         00310000
                     PCTFREE 10                                         00320000
           BUFFERPOOL BP2                                               00330000
           CLOSE NO                                                     00340000
           PIECESIZE 2G                                                 00350000
    ;                                                                   00360000
   COMMIT WORK;                                                         00370000
