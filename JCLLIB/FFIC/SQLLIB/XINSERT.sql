--                                                                      00001000
--                                                                      00003000
SELECT DISTINCT 'INSERT INTO '||STRIP(T.CREATOR)||                      00010014
'.UCST_ICD10_TABLE (',                                                  00011014
       T.CREATOR,T.NAME,1,0,' '                                         00020012
  FROM SYSIBM.SYSTABLES T,                                              00100000
       SYSIBM.SYSTABLESPACE S,                                          00110000
       SYSIBM.SYSTABLEPART P,                                           00120000
       SYSIBM.SYSCOLUMNS C                                              00121000
 WHERE T.TYPE = 'T'                                                     00130000
   AND T.NAME = 'UCST_ICD10_TABLE'                                      00140014
   AND S.DBNAME = T.DBNAME                                              00150000
   AND S.NAME = T.TSNAME                                                00160000
   AND P.TSNAME = T.TSNAME                                              00170000
   AND P.DBNAME = T.DBNAME                                              00180000
-- AND P.STORNAME <> ' '                                                00190000
   AND C.TBCREATOR = T.CREATOR                                          00200000
   AND C.TBNAME    = T.NAME                                             00210000
UNION ALL                                                               00220011
SELECT '   '||STRIP(C.NAME)||                                           00230001
      CASE WHEN T.COLCOUNT = C.COLNO  THEN ')'                          00232002
           ELSE ','                                                     00233002
      END,                                                              00234007
       T.CREATOR,T.NAME,2,C.COLNO,C.NAME                                00240011
  FROM SYSIBM.SYSTABLES T,                                              00250000
       SYSIBM.SYSTABLESPACE S,                                          00260000
       SYSIBM.SYSTABLEPART P,                                           00270000
       SYSIBM.SYSCOLUMNS C                                              00280000
 WHERE T.TYPE = 'T'                                                     00290000
   AND T.NAME = 'UCST_ICD10_TABLE'                                      00300014
   AND S.DBNAME = T.DBNAME                                              00310000
   AND S.NAME = T.TSNAME                                                00320000
   AND P.TSNAME = T.TSNAME                                              00330000
   AND P.DBNAME = T.DBNAME                                              00340000
-- AND P.STORNAME <> ' '                                                00350000
   AND C.TBCREATOR = T.CREATOR                                          00360000
   AND C.TBNAME    = T.NAME                                             00370000
UNION ALL                                                               00370211
SELECT DISTINCT 'SELECT ',                                              00371000
       T.CREATOR,T.NAME,3,0,' '                                         00372012
  FROM SYSIBM.SYSTABLES T,                                              00373000
       SYSIBM.SYSTABLESPACE S,                                          00374000
       SYSIBM.SYSTABLEPART P,                                           00375000
       SYSIBM.SYSCOLUMNS C                                              00376000
 WHERE T.TYPE = 'T'                                                     00377000
   AND T.NAME = 'UCST_ICD10_TABLE'                                      00377114
   AND S.DBNAME = T.DBNAME                                              00379000
   AND S.NAME = T.TSNAME                                                00379100
   AND P.TSNAME = T.TSNAME                                              00379200
   AND P.DBNAME = T.DBNAME                                              00379300
-- AND P.STORNAME <> ' '                                                00379400
   AND C.TBCREATOR = T.CREATOR                                          00379500
   AND C.TBNAME    = T.NAME                                             00379600
UNION ALL                                                               00379700
SELECT '   '||STRIP(C.NAME)||                                           00379913
      CASE WHEN T.COLCOUNT = C.COLNO  THEN ' '                          00380013
           ELSE ','                                                     00380113
      END,                                                              00380213
       T.CREATOR,T.NAME,4,C.COLNO,C.NAME                                00380311
  FROM SYSIBM.SYSTABLES T,                                              00381000
       SYSIBM.SYSTABLESPACE S,                                          00382000
       SYSIBM.SYSTABLEPART P,                                           00383000
       SYSIBM.SYSCOLUMNS C                                              00384000
 WHERE T.TYPE = 'T'                                                     00385000
   AND T.NAME = 'UCST_ICD10_TABLE'                                      00385114
   AND S.DBNAME = T.DBNAME                                              00387000
   AND S.NAME = T.TSNAME                                                00388000
   AND P.TSNAME = T.TSNAME                                              00389000
   AND P.DBNAME = T.DBNAME                                              00389100
-- AND P.STORNAME <> ' '                                                00389200
   AND C.TBCREATOR = T.CREATOR                                          00389300
   AND C.TBNAME    = T.NAME                                             00389400
UNION ALL                                                               00389500
SELECT DISTINCT '  FROM '||STRIP(T.CREATOR)||'.UCST_ICD10_TABLE_PREV;', 00389615
       T.CREATOR,T.NAME,5,0,' '                                         00389713
  FROM SYSIBM.SYSTABLES T,                                              00389800
       SYSIBM.SYSTABLESPACE S,                                          00389900
       SYSIBM.SYSTABLEPART P,                                           00390000
       SYSIBM.SYSCOLUMNS C                                              00390100
 WHERE T.TYPE = 'T'                                                     00391000
   AND T.NAME = 'UCST_ICD10_TABLE'                                      00391114
   AND S.DBNAME = T.DBNAME                                              00393000
   AND S.NAME = T.TSNAME                                                00394000
   AND P.TSNAME = T.TSNAME                                              00395000
   AND P.DBNAME = T.DBNAME                                              00396000
-- AND P.STORNAME <> ' '                                                00397000
   AND C.TBCREATOR = T.CREATOR                                          00398000
   AND C.TBNAME    = T.NAME                                             00399000
ORDER BY 2,3,4,5,6                                                      00400007
