SELECT *                                                                00010000
  FROM SYSIBM.SYSCOPY A,                                                00020000
       SYSIBM.SYSTABLESPACE B                                           00021000
 WHERE A.DBNAME = B.DBNAME                                              00022000
   AND A.TSNAME = B.NAME                                                00023000
   AND A.DBNAME = 'DCDI0A00'                                            00024000
   AND A.ICTYPE IN ('R', 'S')                                           00025001
 ORDER BY A.TIMESTAMP                                                   00026002
