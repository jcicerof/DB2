SELECT *                                                                00010000
  FROM SYSIBM.SYSTABLES A                                               00011000
     , SYSIBM.SYSTABLESPACE B                                           00012000
WHERE A.DBNAME = B.DBNAME                                               00020000
  AND A.TSNAME = B.NAME                                                 00020100
  AND A.TYPE   = 'T'                                                    00020201
  AND B.LOCKRULE <> 'R'                                                 00020304
  AND A.NAME IN (                                                       00021000
        'PROPOSTAONBASE'                                                00030000
      , 'PROPIMPONBASE'                                                 00040000
      , 'ANEXOONBASE'                                                   00050000
      , 'ANEXOBXAONBASE'                                                00060000
      , 'RESTPROPONBASE'                                                00070000
      , 'PROPOSTAONBASEAUD'                                             00080000
      , 'CONTREMIELT'                                                   00090000
      , 'LOGERREMIELT'                                                  00100000
      , 'LOGMSGERR'                                                     00110000
      , 'LOGREGISTROORC'                                                00120000
      , 'LOGREGISTROPPS'                                                00130000
      , 'LOGREGISTROSGR'                                                00140000
      , 'CTLPPSGRN'                                                     00150000
      , 'CTLPPSGRNITE'                                                  00160000
      , 'RESTRICAOPPSGRN'                                               00170000
      , 'PROPKITWCONTR')                                                00180000
