SELECT                                                                  00010046
     CHAR('INCLUDE TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(TSNAME),80), 00010247
     CREATOR,NAME,CREATEDTS                                             00010347
  FROM SYSIBM.SYSTABLES A                                               00011016
WHERE A.TYPE = 'T'                                                      00020001
  AND A.CREATOR IN ('ANO2000', 'MAREXCLU', 'MARHISTO', 'MARITIMA',      00020118
                    'TECINFOR', 'SQLUSER')                              00020218
  AND NOT EXISTS (SELECT '1' FROM SYSIBM.SYSCOPY B                      00021001
                   WHERE B.DBNAME = A.DBNAME                            00030000
                     AND B.TSNAME = A.TSNAME                            00040012
                     AND B.ICTYPE IN ('X','W')                          00041041
                     AND B.ICDATE >= '080601'                           00042037
                     AND B.TIMESTAMP >=(CURRENT_TIMESTAMP - 90 DAYS))   00043049
;                                                                       00060007
FIM;                                                                    00061035
SELECT * FROM SYSIBM.SYSTABLES                                          00070034
WHERE DBNAME = 'DBNOVA'                                                 00080034
  AND TSNAME = 'CORATU'                                                 00090034
