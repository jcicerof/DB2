--                                                                      00000112
-- INSERT TABLESPACES                                                   00000212
INSERT INTO DB2ADM.XLAT                                                 00001013
SELECT 'MRTP','DB2P',                                                   00010013
       A.DBNAME, A.NAME, A.DBID, B.OBID, A.PSID, -1,                    00011013
       A.PGSIZE, A.DSSIZE,A.PARTITIONS,-1,                              00011113
       B.CREATOR,B.NAME,B.TYPE                                          00011213
  FROM SYSIBM.SYSTABLESPACE A                                           00020013
     , SYSIBM.SYSTABLES B                                               00030013
 WHERE B.TSNAME = A.NAME                                                00060013
   AND B.DBNAME = A.DBNAME                                              00070013
   AND B.TYPE   = 'T'                                                   00071013
;                                                                       00071113
                                                                        00071212
-- INSERT INDEXSPACES                                                   00072012
INSERT INTO DB2ADM.XLAT                                                 00073012
SELECT 'MRTP','DB2P',                                                   00078012
       I.DBNAME, I.INDEXSPACE, I.DBID, I.OBID, -1, I.ISOBID,            00079012
       I.PGSIZE, -1,A.PARTITIONS,I.PIECESIZE,                           00080012
       I.CREATOR,I.NAME,'I'                                             00090012
  FROM SYSIBM.SYSINDEXES I                                              00100012
     , SYSIBM.SYSTABLESPACE A                                           00110012
     , SYSIBM.SYSTABLES B                                               00120012
 WHERE B.TSNAME = A.NAME                                                00130012
   AND B.DBNAME = A.DBNAME                                              00140012
   AND B.TYPE   = 'T'                                                   00150012
   AND I.TBNAME = B.NAME                                                00160012
   AND I.TBCREATOR = B.CREATOR                                          00170012
;                                                                       00180012
