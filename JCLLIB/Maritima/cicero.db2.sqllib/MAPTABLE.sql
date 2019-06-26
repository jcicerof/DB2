CREATE TABLESPACE MAPTABLE                                              00010001
       IN DB2ADM                                                        00010101
       USING STOGROUP STGP57D                                           00010401
             PRIQTY 192000                                              00010503
             SECQTY 50000                                               00010603
       BUFFERPOOL BP1                                                   00010701
       SEGSIZE 4;                                                       00011001
COMMIT;                                                                 00012001
CREATE TABLE SYSADM.MAPTABLE                                            00020001
       (TYPE CHAR(1) NOT NULL                                           00030000
       , SOURCE_RID CHAR(5) NOT NULL                                    00040000
       , TARGET_XRID CHAR(9) NOT NULL                                   00050000
       , LRSN CHAR(6) NOT NULL)                                         00060001
     IN DB2ADM.MAPTABLE;                                                00061001
COMMIT;                                                                 00062001
                                                                        00063001
CREATE UNIQUE INDEX SYSADM.MAPINDEX ON SYSADM.MAPTABLE                  00070001
     (SOURCE_RID ASC, TYPE, TARGET_XRID, LRSN)                          00080001
       USING STOGROUP STGP16I                                           00110001
           PRIQTY 50000                                                 00111003
           SECQTY 50000                                                 00112003
       BUFFERPOOL BP2                                                   00120001
;                                                                       00130001
