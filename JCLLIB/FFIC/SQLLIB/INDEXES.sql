SELECT A.DBNAME, A.TSNAME, A.CREATOR, A.NAME,                           00010000
       B.CREATOR, B.NAME, B.INDEXSPACE                                  00011001
  FROM SYSIBM.SYSINDEXES B                                              00020000
     , SYSIBM.SYSTABLES A                                               00030000
 WHERE A.DBNAME = 'DCDI0P07'                                            00040000
   AND A.CREATOR = 'FINPROD'                                            00050000
   AND B.TBCREATOR = A.CREATOR                                          00060000
   AND B.TBNAME = A.NAME                                                00070000
   AND A.TYPE = 'T'                                                     00071000
                                                                        00080000
