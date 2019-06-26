--  -START DB(DBEEAE) SPACENAM(*)            ACC(RW)                    00001000
SELECT DISTINCT                                                         00010000
'-STO DB('||STRIP(A.DBNAME)||') SPACE('||STRIP(A.NAME)||')'             00010102
,A.DBNAME,A.NAME,1                                                      00010200
FROM SYSIBM.SYSTABLESPACE A                                             00010300
WHERE A.BPOOL = 'BP26'                                                  00060005
UNION ALL                                                               00060100
SELECT DISTINCT                                                         00061000
'-STA DB('||STRIP(A.DBNAME)||') SPACE('||STRIP(A.NAME)||') ACC(RW)'     00062002
,A.DBNAME,A.NAME,2                                                      00063000
FROM SYSIBM.SYSTABLESPACE A                                             00064000
WHERE A.BPOOL = 'BP26'                                                  00064105
ORDER BY 2,3,4                                                          00066000
;                                                                       00070000
SELECT DISTINCT                                                         00080001
'-STO DB('||STRIP(A.DBNAME)||') SPACE('||STRIP(A.INDEXSPACE)||')'       00090002
,A.DBNAME,A.INDEXSPACE,1                                                00100002
FROM SYSIBM.SYSINDEXES  A                                               00110001
WHERE A.BPOOL = 'BP27'                                                  00111005
UNION ALL                                                               00130001
SELECT DISTINCT                                                         00140001
'-STA DB('||STRIP(A.DBNAME)||') SPACE('||STRIP(A.INDEXSPACE)||          00141003
') ACC(RW)'                                                             00142004
,A.DBNAME,A.INDEXSPACE,2                                                00160002
FROM SYSIBM.SYSINDEXES  A                                               00170001
WHERE A.BPOOL = 'BP27'                                                  00171005
ORDER BY 2,3,4                                                          00190001
;                                                                       00200001
