  SET CURRENT SQLID = 'SYSADM';                                         00010000
  COMMIT;                                                               00020000
                                                                        00021000
  CREATE TABLESPACE CADAPOL IN DB2ADM                                   00030000
  USING  STOGROUP   STGP72D                                             00050000
  PRIQTY            200000                                              00060000
  SECQTY            100000                                              00070000
  ERASE             NO                                                  00080000
  COMPRESS          YES                                                 00090000
  PCTFREE           0                                                   00100000
  FREEPAGE          0                                                   00101001
  BUFFERPOOL        BP1                                                 00110000
  LOCKSIZE ANY;                                                         00120000
  COMMIT;                                                               00130000
                                                                        00131000
  CREATE TABLE DB2ADM.CADAPOL                                           00140000
    LIKE ANO2000.CADAPOL                                                00150000
      IN DB2ADM.CADAPOL;                                                00160000
  COMMIT;                                                               00170000
