SELECT A.CREATOR,A.NAME,A.DBNAME,A.TSNAME                               00010000
  FROM SYSIBM.SYSTABLES A,                                              00011000
       SYSIBM.SYSTABLESPACE B                                           00012000
 WHERE B.SEGSIZE = 0                                                    00020000
   AND A.TYPE = 'T'                                                     00030000
   AND A.DBNAME = B.DBNAME                                              00040000
   AND A.TSNAME = B.NAME                                                00050000
