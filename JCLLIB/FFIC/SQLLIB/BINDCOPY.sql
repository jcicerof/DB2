--BIND PACKAGE({LOCATION.}COLLECTION)                                   00020000
--  COPY(COLLECTION.PACKAGE)                                            00030000
--  ACTION(ADD)                                                         00040000
--  QUAL(DB2TEST)                                                       00050000
--  OWNER(DB2TEST)                                                      00060000
--  VALID(B)                                                            00070000
--  ISOL(UR)                                                            00080000
--  REL(C)                                                              00090000
--  EXPL(YES)                                                           00100000
--  CURRENTD(N)                                                         00110000
--  DEGREE(1)                                                           00120000
--  DYNAMICRULES(RUN)                                                   00130000
--  KEEPDYNAMIC(N)                                                      00140000
--  REOPT(NONE)                                                         00150000
--  DBPROTOCOL(D)                                                       00160000
--  ENCODING(         37)                                               00170000
--  IMMEDWRITE(N)                                                       00180000
--  ROUNDING(HALFEVEN)                                                  00190000
SELECT                                                                  00200000
  'BIND PACKAGE('||SUBSTR(NAME,1,3)||'P_'||STRIP(NAME)||')'             00210016
  ,COLLID,NAME,1                                                        00220000
  FROM SYSIBM.SYSPACKAGE                                                00230000
 WHERE COLLID LIKE 'CONVTOV10'                                          00240000
UNION ALL                                                               00250000
SELECT                                                                  00260000
  '  COPY('||STRIP(COLLID)||'.'||STRIP(NAME)||')'                       00270001
  ,COLLID,NAME,2                                                        00280000
  FROM SYSIBM.SYSPACKAGE                                                00290000
 WHERE COLLID LIKE 'CONVTOV10'                                          00300000
UNION ALL                                                               00301002
SELECT                                                                  00302002
  '  ACTION(ADD)'                                                       00303002
  ,COLLID,NAME,3                                                        00304002
  FROM SYSIBM.SYSPACKAGE                                                00305002
 WHERE COLLID LIKE 'CONVTOV10'                                          00306002
UNION ALL                                                               00307002
SELECT                                                                  00308002
  '  QUAL('||STRIP(QUALIFIER)||') OWNER('||STRIP(OWNER)||')'            00309004
  ,COLLID,NAME,4                                                        00309102
  FROM SYSIBM.SYSPACKAGE                                                00309202
 WHERE COLLID LIKE 'CONVTOV10'                                          00309302
UNION ALL                                                               00309402
SELECT                                                                  00309502
  '  VALID('||STRIP(VALIDATE)||') ISOL('||                              00309603
  CASE                                                                  00309703
    WHEN ISOLATION = 'R' THEN 'RR'                                      00309803
    WHEN ISOLATION = 'S' THEN 'CS'                                      00309903
    WHEN ISOLATION = 'T' THEN 'RS'                                      00310003
    WHEN ISOLATION = 'U' THEN 'UR'                                      00310103
    ELSE ''                                                             00310503
  END||')'                                                              00310603
  ,COLLID,NAME,5                                                        00310703
  FROM SYSIBM.SYSPACKAGE                                                00310803
 WHERE COLLID LIKE 'CONVTOV10'                                          00311002
UNION ALL                                                               00312005
SELECT                                                                  00313005
  '  REL('||STRIP(RELEASE)||') EXPL('||                                 00314005
  CASE                                                                  00315005
    WHEN EXPLAIN = 'N' THEN 'NO'                                        00316005
    WHEN EXPLAIN = 'Y' THEN 'YES'                                       00317005
  END||')'                                                              00319205
  ,COLLID,NAME,6                                                        00319305
  FROM SYSIBM.SYSPACKAGE                                                00319405
 WHERE COLLID LIKE 'CONVTOV10'                                          00319505
UNION ALL                                                               00319606
SELECT                                                                  00319706
  '  CURRENTD('||                                                       00319917
  CASE                                                                  00320017
    WHEN DEFERPREP = 'A' THEN 'YES'                                     00320117
    WHEN DEFERPREP = 'B' THEN 'NO'                                      00320217
    WHEN DEFERPREP = 'C' THEN 'YES'                                     00320317
    ELSE ' '                                                            00322419
  END||') DEGREE('||STRIP(DEGREE)||')'                                  00322519
  ,COLLID,NAME,7                                                        00323006
  FROM SYSIBM.SYSPACKAGE                                                00324006
 WHERE COLLID LIKE 'CONVTOV10'                                          00325006
UNION ALL                                                               00326006
SELECT                                                                  00327006
  '  DYNAMICRULES('||                                                   00328006
  CASE                                                                  00328106
    WHEN DYNAMICRULES = 'B' THEN 'BIND'                                 00328206
    WHEN DYNAMICRULES = 'D' THEN 'DEFINEBIND'                           00328306
    WHEN DYNAMICRULES = 'E' THEN 'DEFINERUN'                            00328406
    WHEN DYNAMICRULES = 'H' THEN 'INVOKEBIND'                           00328506
    WHEN DYNAMICRULES = 'I' THEN 'INVOKERUN'                            00328606
    WHEN DYNAMICRULES = 'R' THEN 'RUN'                                  00328706
    ELSE ' '                                                            00328806
  END||') KEEPDYNAMIC('||STRIP(KEEPDYNAMIC)||')'                        00328908
  ,COLLID,NAME,8                                                        00329007
  FROM SYSIBM.SYSPACKAGE                                                00329106
 WHERE COLLID LIKE 'CONVTOV10'                                          00329206
UNION ALL                                                               00329309
SELECT                                                                  00329409
  '  REOPT('||                                                          00329509
  CASE                                                                  00329609
    WHEN REOPTVAR = 'A' THEN 'AUTO'                                     00329709
    WHEN REOPTVAR = 'N' THEN 'NONE'                                     00329809
    WHEN REOPTVAR = 'Y' THEN 'ALWAYS'                                   00329909
    WHEN REOPTVAR = '1' THEN 'ONCE'                                     00330009
    ELSE ' '                                                            00333009
  END||') DBPROTOCOL(D)'                                                00334009
  ,COLLID,NAME,9                                                        00335009
  FROM SYSIBM.SYSPACKAGE                                                00336009
 WHERE COLLID LIKE 'CONVTOV10'                                          00337009
UNION ALL                                                               00338012
SELECT                                                                  00339009
  '  ENCODING('||STRIP(CHAR(ENCODING_CCSID))||') IMMEDWRITE('||         00339113
  CASE                                                                  00339209
    WHEN IMMEDWRITE = 'N' THEN 'NO'                                     00339309
    WHEN IMMEDWRITE = 'Y' THEN 'YES'                                    00339409
    WHEN IMMEDWRITE = '1' THEN 'PH1'                                    00339509
  END||')'                                                              00340009
  ,COLLID,NAME,10                                                       00340109
  FROM SYSIBM.SYSPACKAGE                                                00340209
 WHERE COLLID LIKE 'CONVTOV10'                                          00341009
UNION ALL                                                               00341112
SELECT                                                                  00343009
  '  ROUNDING('||                                                       00344009
  CASE                                                                  00345009
    WHEN ROUNDING = 'C' THEN 'CEILING'                                  00346009
    WHEN ROUNDING = 'D' THEN 'DOWN'                                     00346109
    WHEN ROUNDING = 'F' THEN 'FLOOR'                                    00346209
    WHEN ROUNDING = 'G' THEN 'HALFDOWN'                                 00346309
    WHEN ROUNDING = 'E' THEN 'HALFEVEN'                                 00346409
    WHEN ROUNDING = 'H' THEN 'HALFUP'                                   00346509
    WHEN ROUNDING = 'U' THEN 'UP'                                       00346609
    ELSE ' '                                                            00346709
  END||')'                                                              00349009
  ,COLLID,NAME,11                                                       00349109
  FROM SYSIBM.SYSPACKAGE                                                00349209
 WHERE COLLID LIKE 'CONVTOV10'                                          00349309
ORDER BY 2,3,4                                                          00350009
