SELECT DISTINCT JOBNAME                                                 00000108
  FROM SYSIBM.SYSTABLES T,                                              00000501
       SYSIBM.SYSCOPY C                                                 00000604
 WHERE T.DBNAME = C.DBNAME                                              00000704
   AND T.TSNAME = C.TSNAME                                              00000804
   AND C.ICTYPE = 'F'                                                   00000904
   AND T.TYPE = 'T'                                                     00001004
   AND C.TIMESTAMP >= CURRENT TIMESTAMP - 45 DAYS                       00001104
   AND T.CREATOR IN ('QSTACPT')                                         00001204
   AND T.NAME IN (                                                      00001304
      'QSTT_COUNTY'                                                     00001404
     ,'QSTT_ISO_ADDRESS'                                                00001504
     ,'QSTT_ISO_LAT_LONG'                                               00001604
     ,'QSTT_ISO_TABLE'                                                  00001704
     ,'QSTT_OBJECT'                                                     00001804
     ,'QSTT_PRIDE_CD_CONV'                                              00001904
     ,'QSTT_RISK_APPR'                                                  00002004
     ,'QSTT_TERRITORY')                                                 00003004
;                                                                       00006601
--FIM;                                                                  00006709
SELECT DISTINCT 'INCLUDE TABLESPACE '||                                 00006804
       STRIP(T.DBNAME)||'.'||STRIP(T.TSNAME)||                          00006904
' -- '||STRIP(T.CREATOR)||'.'||STRIP(T.NAME),                           00007004
S.NTABLES                                                               00007104
  FROM SYSIBM.SYSTABLES T,                                              00007204
       SYSIBM.SYSTABLESPACE S                                           00007304
 WHERE T.DBNAME = S.DBNAME                                              00007404
   AND T.TSNAME = S.NAME                                                00007504
   AND T.TYPE = 'T'                                                     00007604
   AND T.CREATOR IN ('QSTACPT')                                         00007704
   AND T.NAME IN (                                                      00007804
      'QSTT_COUNTY'                                                     00007904
     ,'QSTT_ISO_ADDRESS'                                                00008004
     ,'QSTT_ISO_LAT_LONG'                                               00008104
     ,'QSTT_ISO_TABLE'                                                  00008204
     ,'QSTT_OBJECT'                                                     00008304
     ,'QSTT_PRIDE_CD_CONV'                                              00008404
     ,'QSTT_RISK_APPR'                                                  00008504
     ,'QSTT_TERRITORY')                                                 00008604
;                                                                       00008704
--FIM;                                                                  00008804
SELECT DISTINCT                                                         00008904
       STRIP(X.DBNAME)||'.'||STRIP(X.INDEXSPACE)||                      00009004
' -- '|| STRIP(X.CREATOR)||'.'||STRIP(X.NAME)                           00009104
  FROM SYSIBM.SYSINDEXES X                                              00009204
 WHERE X.TBCREATOR IN ('QSTACPT')                                       00009304
   AND X.TBNAME IN (                                                    00009404
      'QSTT_COUNTY'                                                     00009504
     ,'QSTT_ISO_ADDRESS'                                                00009604
     ,'QSTT_ISO_LAT_LONG'                                               00009704
     ,'QSTT_ISO_TABLE'                                                  00009804
     ,'QSTT_OBJECT'                                                     00009904
     ,'QSTT_PRIDE_CD_CONV'                                              00010004
     ,'QSTT_RISK_APPR'                                                  00010104
     ,'QSTT_TERRITORY')                                                 00010204
;                                                                       00010304
--FIM;                                                                  00010410
SELECT DISTINCT 'FREE PACKAGE ('||STRIP(COLLID)||'.'||STRIP(NAME)||')'  00010504
  FROM SYSIBM.SYSPACKAGE                                                00010604
 WHERE OWNER IN ('QSTACPT','DB2ACPT','DB2PRVT','QSTTEST')               00010704
   AND NAME IN (                                                        00010804
       'QSTTCNVP'                                                       00010904
      ,'QSTTCOVC'                                                       00011004
      ,'QSTPUTER'                                                       00011104
      ,'QSTPBF05'                                                       00011204
      ,'QSTPBF06'                                                       00011304
      ,'QSTPBF15'                                                       00011404
      ,'QSTTGQTE'                                                       00011504
      ,'QSTTPQTE'                                                       00011604
      ,'QSTOF01'                                                        00011704
      ,'QSTTGCTY'                                                       00011804
      ,'QSTTSRIO'                                                       00011904
      ,'QSTPURSK'                                                       00012004
      ,'QSTTGLOC'                                                       00012104
      ,'QSTTPLOC'                                                       00012204
      ,'QSTTPTER'                                                       00012304
      ,'QSTTRSKA'                                                       00012404
      ,'QSTTRSKB'                                                       00012504
      ,'QSTTTERR')                                                      00013004
;                                                                       00016702
--FIM;                                                                  00016802
SELECT DISTINCT 'FREE PLAN ('||STRIP(NAME)||')'                         00016902
  FROM SYSIBM.SYSPLAN                                                   00017002
WHERE CREATOR IN ('DB2ACPT','QSTACPT','QSTTEST')                        00017102
  AND NAME IN (                                                         00017202
     'QST4CLTR'                                                         00017302
    ,'QST4GPRD'                                                         00017402
    ,'QST7CLTR'                                                         00017502
    ,'QST7UCTY'                                                         00017602
    ,'QSTECLTR'                                                         00017702
    ,'QSTEGPRD'                                                         00017802
    ,'QSTPBF05'                                                         00017902
    ,'QSTPCLTR'                                                         00018002
    ,'QSTPGPRD'                                                         00018102
    ,'QSTPGQTE'                                                         00018202
    ,'QSTPMHRM'                                                         00018302
    ,'QSTPPQTE'                                                         00018402
    ,'QSTPSRSG'                                                         00018502
    ,'QSTPTERR'                                                         00018602
    ,'QSTPUCLT'                                                         00018702
    ,'QSTPURSK'                                                         00018802
    ,'QSTPUTER'                                                         00018902
    ,'QSTPWTRC'                                                         00019002
    ,'QSTPZISO')                                                        00019102
;                                                                       00020102
--FIM;                                                                  00020202
SELECT DISTINCT                                                         00020300
'DROP TABLESPACE '||STRIP(T.DBNAME)||'.'||STRIP(T.TSNAME)||             00020400
'; -- '||STRIP(T.CREATOR)||'.'||STRIP(T.NAME)                           00020500
  FROM SYSIBM.SYSTABLES T                                               00020600
 WHERE T.TYPE = 'T'                                                     00020700
   AND T.CREATOR IN ('QSTACPT')                                         00020802
   AND T.NAME IN (                                                      00020902
      'QSTT_COUNTY'                                                     00021002
     ,'QSTT_ISO_ADDRESS'                                                00021102
     ,'QSTT_ISO_LAT_LONG'                                               00021202
     ,'QSTT_ISO_TABLE'                                                  00021302
     ,'QSTT_OBJECT'                                                     00021402
     ,'QSTT_PRIDE_CD_CONV'                                              00021502
     ,'QSTT_RISK_APPR'                                                  00021602
     ,'QSTT_TERRITORY')                                                 00021702
;                                                                       00027400
--FIM;                                                                  00027502
--DB='DQST0B00', TS='SCCS0B00';                                         00027600
SELECT 'DB='||''''||                                                    00027700
       STRIP(T.DBNAME)||''''||', TS='||''''||                           00027800
       STRIP(T.TSNAME)||''''||';'                                       00027900
  FROM SYSIBM.SYSTABLES T,                                              00028000
       SYSIBM.SYSTABLESPACE S                                           00028100
 WHERE T.DBNAME = S.DBNAME                                              00028200
   AND T.TSNAME = S.NAME                                                00028300
   AND T.TYPE = 'T'                                                     00028400
   AND T.CREATOR IN ('QSTACPT')                                         00028502
   AND T.NAME IN (                                                      00028602
      'QSTT_COUNTY'                                                     00028702
     ,'QSTT_ISO_ADDRESS'                                                00028802
     ,'QSTT_ISO_LAT_LONG'                                               00028902
     ,'QSTT_ISO_TABLE'                                                  00029002
     ,'QSTT_OBJECT'                                                     00029102
     ,'QSTT_PRIDE_CD_CONV'                                              00029202
     ,'QSTT_RISK_APPR'                                                  00029302
     ,'QSTT_TERRITORY')                                                 00029402
;                                                                       00029502
--FIM;                                                                  00036002
