SELECT DISTINCT                                                         00010002
       A.CREATOR, A.NAME, B.DBNAME, B.TSNAME, B.COMPRESS                00011002
  FROM SYSIBM.SYSTABLES A,                                              00020000
       SYSIBM.SYSTABLEPART B                                            00030000
 WHERE A.TYPE = 'T'                                                     00040000
   AND A.DBNAME = B.DBNAME                                              00050000
   AND A.TSNAME = B.TSNAME                                              00060000
