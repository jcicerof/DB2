--                                                                      00001000
-- CREATE UNIQUE INDEX DSN81010.XDEPT1                                  00010000
-- ON DSN81010.DEPT                                                     00020000
-- (DEPTNO ASC)                                                         00030000
-- USING STOGROUP DSN8G100                                              00050000
-- PRIQTY 512                                                           00060000
-- SECQTY 64                                                            00070000
-- BUFFERPOOL BP1;                                                      00090034
                                                                        00120000
SELECT                                                                  00130004
 'CREATE '||                                                            00130102
    CASE                                                                00131002
      WHEN A.UNIQUERULE = 'D' THEN ''                                   00132003
      WHEN A.UNIQUERULE = 'P' THEN 'UNIQUE '                            00133012
      WHEN A.UNIQUERULE = 'U' THEN 'UNIQUE '                            00133112
    END ||                                                              00134002
 'INDEX '||STRIP(A.CREATOR)||'.'||STRIP(A.NAME),                        00140015
 A.CREATOR,A.NAME,0,1                                                   00141021
  FROM SYSIBM.SYSINDEXES A                                              00142018
 WHERE STRIP(A.TBCREATOR)||'.'||STRIP(A.TBNAME) = 'SYSIBM.SYSINDEXES'   00145036
UNION ALL                                                               00173312
SELECT                                                                  00174006
 '    ON '||STRIP(A.TBCREATOR)||'.'||STRIP(A.TBNAME),                   00179115
 A.CREATOR,A.NAME,0,2                                                   00179221
  FROM SYSIBM.SYSINDEXES A,                                             00179306
       SYSIBM.SYSINDEXPART B                                            00179419
 WHERE STRIP(A.TBCREATOR)||'.'||STRIP(A.TBNAME) = 'SYSIBM.SYSINDEXES'   00179536
   AND B.IXCREATOR = A.CREATOR                                          00180115
   AND B.IXNAME    = A.NAME                                             00180215
UNION ALL                                                               00180824
SELECT                                                                  00180915
 '       '||                                                            00181022
 CASE                                                                   00181122
   WHEN COLSEQ = 1 THEN '('                                             00181222
   WHEN COLSEQ > 1 THEN ','                                             00181322
 END ||                                                                 00181422
 STRIP(C.COLNAME)||' '||                                                00181522
 CASE                                                                   00181615
   WHEN ORDERING = 'A' THEN 'ASC'                                       00181715
   WHEN ORDERING = 'D' THEN 'DESC'                                      00181815
 END ||                                                                 00181916
 CASE                                                                   00182015
   WHEN COLSEQ < COLCOUNT THEN ' '                                      00182138
   WHEN COLSEQ = COLCOUNT THEN ')'                                      00182223
 END                                                                    00182315
 ,A.CREATOR,A.NAME,COLSEQ,3                                             00182421
  FROM SYSIBM.SYSINDEXES A,                                             00182515
       SYSIBM.SYSINDEXPART B,                                           00183015
       SYSIBM.SYSKEYS C                                                 00184015
 WHERE STRIP(A.TBCREATOR)||'.'||STRIP(A.TBNAME) = 'SYSIBM.SYSINDEXES'   00184136
   AND B.IXCREATOR = A.CREATOR                                          00187015
   AND B.IXNAME    = A.NAME                                             00188015
   AND C.IXCREATOR = A.CREATOR                                          00189015
   AND C.IXNAME    = A.NAME                                             00189115
UNION ALL                                                               00189229
SELECT                                                                  00189425
 ' USING STOGROUP '||STRIP(B.STORNAME),                                 00189526
 A.CREATOR,A.NAME,9999999,4                                             00189627
  FROM SYSIBM.SYSINDEXES A,                                             00189725
       SYSIBM.SYSINDEXPART B                                            00189825
 WHERE STRIP(A.TBCREATOR)||'.'||STRIP(A.TBNAME) = 'SYSIBM.SYSINDEXES'   00189936
   AND B.IXCREATOR = A.CREATOR                                          00190225
   AND B.IXNAME    = A.NAME                                             00191025
UNION ALL                                                               00192029
SELECT                                                                  00193029
 ' PRIQTY '||CASE                                                       00194031
               WHEN PQTY = -1 THEN -1                                   00194131
               ELSE STRIP(CHAR(PQTY*4))                                 00194233
             END ||                                                     00194333
 ' SECQTY '||CASE                                                       00194431
               WHEN SQTY = -1 THEN -1                                   00194531
               ELSE STRIP(CHAR(SQTY*4))                                 00194633
             END ||                                                     00194733
 ';',                                                                   00194831
 A.CREATOR,A.NAME,9999999,5                                             00195029
  FROM SYSIBM.SYSINDEXES A,                                             00196029
       SYSIBM.SYSINDEXPART B                                            00197029
 WHERE STRIP(A.TBCREATOR)||'.'||STRIP(A.TBNAME) = 'SYSIBM.SYSINDEXES'   00197136
   AND B.IXCREATOR = A.CREATOR                                          00199129
   AND B.IXNAME    = A.NAME                                             00199229
UNION ALL                                                               00199334
SELECT                                                                  00199434
 ' BUFFERPOOL '||STRIP(BPOOL),                                          00199535
 A.CREATOR,A.NAME,9999999,6                                             00204034
  FROM SYSIBM.SYSINDEXES A,                                             00205034
       SYSIBM.SYSINDEXPART B                                            00206034
 WHERE STRIP(A.TBCREATOR)||'.'||STRIP(A.TBNAME) = 'SYSIBM.SYSINDEXES'   00206136
   AND B.IXCREATOR = A.CREATOR                                          00209034
   AND B.IXNAME    = A.NAME                                             00209134
UNION ALL                                                               00209234
SELECT                                                                  00209334
 ';',                                                                   00209534
 A.CREATOR,A.NAME,9999999,7                                             00209634
  FROM SYSIBM.SYSINDEXES A                                              00209834
 WHERE STRIP(A.TBCREATOR)||'.'||STRIP(A.TBNAME) = 'SYSIBM.SYSINDEXES'   00209936
 ORDER BY 2,3,4,5                                                       00220034
