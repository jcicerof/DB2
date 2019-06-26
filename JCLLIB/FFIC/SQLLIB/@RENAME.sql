SELECT                                                                  00010000
'RENAME TABLE '||STRIP(CREATOR)||'.'||STRIP(NAME)||' TO O_'||           00020000
STRIP(NAME)||';'                                                        00030000
  FROM SYSIBM.SYSTABLES                                                 00040000
 WHERE DBNAME = 'DIRB0TTP'                                              00050000
   AND TSNAME LIKE 'SIRB%'                                              00051002
   AND TYPE ='T'                                                        00060000
UNION ALL                                                               00070001
SELECT                                                                  00080001
'RENAME INDEX '||STRIP(A.CREATOR)||'.'||STRIP(A.NAME)||' TO O_'||       00090002
STRIP(A.NAME)||';'                                                      00100003
  FROM SYSIBM.SYSINDEXES A,                                             00110002
       SYSIBM.SYSTABLES B                                               00111002
 WHERE A.TBNAME = B.NAME                                                00112002
   AND A.TBCREATOR = B.CREATOR                                          00113002
   AND B.TYPE = 'T'                                                     00114002
   AND A.DBNAME = 'DIRB0TTP'                                            00120002
   AND B.TSNAME LIKE 'SIRB%'                                            00130002
