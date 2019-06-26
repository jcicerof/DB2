-- VERIFICA SE O STG DO TS E O MESMO DO DB                              00010000
                                                                        00020000
SELECT DISTINCT B.DBNAME, B.TSNAME, MAX(B.PARTITION),                   00030004
       A.STGROUP, B.STORNAME,                                           00031007
       B.CREATEDTS, B.ALTEREDTS                                         00032007
  FROM SYSIBM.SYSDATABASE A,                                            00040000
       SYSIBM.SYSTABLEPART B                                            00050000
 WHERE A.NAME = B.DBNAME                                                00060002
   AND A.STGROUP <> B.STORNAME                                          00070003
   AND A.STGROUP <> 'SYSDEFLT'                                          00080005
   AND B.STORNAME <> ''                                                 00081006
   AND (B.CREATEDTS <> '0001-01-01-00.00.00.000000'                     00082009
   OR   B.ALTEREDTS <> '0001-01-01-00.00.00.000000')                    00083009
 GROUP BY B.DBNAME, B.TSNAME, A.STGROUP, B.STORNAME,                    00090007
       B.CREATEDTS, B.ALTEREDTS                                         00100007
