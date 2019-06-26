--                                                                      00010001
  SET CURRENT SQLID='DBA1ADM';                                          00020001
--                                                                      00030001
  DROP TABLESPACE DDBA0T00.TEST2;                                       00040001
  COMMIT;                                                               00050001
                                                                        00060001
  CREATE TABLESPACE TEST2                                               00070001
    IN DDBA0T00                                                         00080001
    USING STOGROUP GDAP0T00                                             00090001
    PRIQTY 48   SECQTY 48                                               00100001
    FREEPAGE 0 PCTFREE 0                                                00110001
    BUFFERPOOL BP1;                                                     00120001
--                                                                      00130001
  COMMIT;                                                               00140001
--                                                                      00150001
------------------------------------------------------------------------00160001
--    TABLE=DBA1ADM.MAPA_S3_COMM_LIAB IN DDBA0T00.SS3SAT03              00170001
------------------------------------------------------------------------00180001
--                                                                      00190001
  CREATE TABLE DBA1ADM.TEST2                                            00200001
     (CUSTID               INTEGER NOT NULL WITH DEFAULT,               00210001
      NAME                 CHAR(40) NOT NULL WITH DEFAULT,              00220001
      VALOR                DEC(12,4) NOT NULL WITH DEFAULT)             00230001
    IN DDBA0T00.TEST2                                                   00240001
    AUDIT NONE                                                          00250001
    DATA CAPTURE NONE                                                   00260001
    CCSID      EBCDIC                                                   00270001
    NOT VOLATILE;                                                       00280001
--                                                                      00290001
  COMMIT;                                                               00300001
--                                                                      00310001
------------------------------------------------------------------------00320001
-- DATABASE=DDBA0T00                                                    00330001
--    INDEX=DBA1ADM.XS3PAT0A ON DBA1ADM.MAPA_S3_COMM_LIAB               00340001
------------------------------------------------------------------------00350001
--                                                                      00360001
  CREATE UNIQUE INDEX DBA1ADM.XTEST2                                    00370001
    ON DBA1ADM.TEST2                                                    00380001
     (CUSTID                ASC)                                        00390001
    USING STOGROUP GDAP0T00                                             00400001
    PRIQTY 48 SECQTY 48                                                 00410001
    FREEPAGE 0 PCTFREE 0                                                00420001
    BUFFERPOOL BP2;                                                     00430001
--                                                                      00440001
  COMMIT;                                                               00450001
--                                                                      00460001
  INSERT INTO DBA1ADM.TEST2                                             00470001
   VALUES (1, 'TEST', 3.1415);                                          00480001
  INSERT INTO DBA1ADM.TEST2                                             00490001
   VALUES (2, 'TEST', 11.0);                                            00500001
  INSERT INTO DBA1ADM.TEST2                                             00510001
   VALUES (3, 'TEST', 17);                                              00520001
  INSERT INTO DBA1ADM.TEST2                                             00530001
   VALUES (4, 'TEST', 2.7182);                                          00540001
