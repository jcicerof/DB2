--                                                                      00010000
  SET CURRENT SQLID='DB2TEST';                                          00020000
--                                                                      00030000
  DROP TABLESPACE DMAPAT03.SDUPKEY0;                                    00031001
  COMMIT;                                                               00032001
                                                                        00033001
  CREATE TABLESPACE SDUPKEY0                                            00040000
    IN DMAPAT03                                                         00050000
    USING STOGROUP GMAPAT00                                             00060000
    PRIQTY 48   SECQTY 48                                               00070000
    FREEPAGE 0 PCTFREE 0                                                00080000
    BUFFERPOOL BP1;                                                     00090000
--                                                                      00100000
  COMMIT;                                                               00110000
--                                                                      00120000
------------------------------------------------------------------------00130000
--    TABLE=DB2TEST.MAPA_S3_COMM_LIAB IN DMAPAT03.SS3SAT03              00140000
------------------------------------------------------------------------00150000
--                                                                      00160000
  CREATE TABLE DB2TEST.TEST4DUPKEY                                      00170000
     (CUSTID               INTEGER NOT NULL WITH DEFAULT,               00180000
      NAME                 CHAR(40) NOT NULL WITH DEFAULT,              00190001
      VALOR                DEC(12,4) NOT NULL WITH DEFAULT)             00191001
    IN DMAPAT03.SDUPKEY0                                                00200000
    AUDIT NONE                                                          00210000
    DATA CAPTURE NONE                                                   00220000
    CCSID      EBCDIC                                                   00230000
    NOT VOLATILE;                                                       00240000
--                                                                      00250000
  COMMIT;                                                               00260000
--                                                                      00270000
------------------------------------------------------------------------00280000
-- DATABASE=DMAPAT03                                                    00290000
--    INDEX=DB2TEST.XS3PAT0A ON DB2TEST.MAPA_S3_COMM_LIAB               00300000
------------------------------------------------------------------------00310000
--                                                                      00320000
  CREATE UNIQUE INDEX DB2TEST.XDUPKEY0                                  00330000
    ON DB2TEST.TEST4DUPKEY                                              00340000
     (CUSTID                ASC)                                        00350000
    USING STOGROUP GMAPAT00                                             00360000
    PRIQTY 48 SECQTY 48                                                 00370000
    FREEPAGE 0 PCTFREE 0                                                00380000
    BUFFERPOOL BP2;                                                     00390000
--                                                                      00400000
  COMMIT;                                                               00410000
--                                                                      00420000
  INSERT INTO TABLE DB2TEST.TEST4DUPKEY                                 00430001
   VALUES (1, 'TEST', 3.1415);                                          00440001
  INSERT INTO TABLE DB2TEST.TEST4DUPKEY                                 00450001
   VALUES (2, 'TEST', 11.0);                                            00460001
  INSERT INTO TABLE DB2TEST.TEST4DUPKEY                                 00470001
   VALUES (3, 'TEST', 17);                                              00480001
  INSERT INTO TABLE DB2TEST.TEST4DUPKEY                                 00490001
   VALUES (4, 'TEST', 2.7182);                                          00500001
