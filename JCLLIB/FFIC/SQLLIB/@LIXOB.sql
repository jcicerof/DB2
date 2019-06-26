SELECT B.CREATOR,B.NAME,MAX(A.TIMESTAMP)                                00010003
  FROM SYSIBM.SYSCOPY A,                                                00020000
       SYSIBM.SYSTABLES B                                               00030000
 WHERE B.TYPE = 'T'                                                     00040000
   AND A.DBNAME = B.DBNAME                                              00050000
   AND A.TSNAME = B.TSNAME                                              00060000
   AND B.CREATOR = 'ERSPROD'                                            00070000
   AND B.NAME LIKE 'MACT%'                                              00080008
   AND A.ICTYPE IN ('R','S')                                            00090005
GROUP BY B.CREATOR,B.NAME                                               00100004
ORDER BY 3                                                              00110006
