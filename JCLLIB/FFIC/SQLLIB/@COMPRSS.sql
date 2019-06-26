SELECT A.DBNAME, A.TSNAME, A.CREATOR, A.NAME, A.RECLENGTH,              00001000
       SUM(B.LENGTH), 1.000*SUM(B.LENGTH)/A.RECLENGTH                   00003000
  FROM SYSIBM.SYSTABLES A                                               00004000
     , SYSIBM.SYSCOLUMNS B                                              00006000
   WHERE A.TYPE = 'T'                                                   00008000
     AND A.CREATOR = B.TBCREATOR                                        00009200
     AND A.NAME = B.TBNAME                                              00009300
     AND B.COLTYPE IN ('CHAR', 'VARCHAR')                               00009500
   GROUP BY A.DBNAME, A.TSNAME, A.CREATOR, A.NAME, A.RECLENGTH          00009700
   ORDER BY 7 DESC                                                      00009800
;                                                                       00009900
FIM;                                                                    00010000
SELECT DISTINCT A.DBNAME, A.TSNAME, A.CREATOR, A.NAME, A.RECLENGTH,     00011000
       B.COMPRESS,                                                      00020000
       C.NAME,C.COLTYPE,C.LENGTH                                        00021000
  FROM SYSIBM.SYSTABLES A                                               00030000
     , SYSIBM.SYSTABLEPART  B                                           00031000
     , SYSIBM.SYSCOLUMNS    C                                           00032000
   WHERE --A.NAME LIKE 'QSTT%' AND                                      00040000
         A.TYPE = 'T'                                                   00041000
     AND A.DBNAME = B.DBNAME                                            00042000
     AND A.TSNAME = B.TSNAME                                            00043000
     AND A.CREATOR = C.TBCREATOR                                        00044000
     AND A.NAME = C.TBNAME                                              00045000
     AND B.PARTITION > 0                                                00046000
     AND C.COLTYPE IN ('CHAR', 'VARCHAR')                               00047000
     AND A.NAME = 'ROST_BO_AUDIT_TRL'                                   00047100
;                                                                       00051000
SELECT A.DBNAME, A.TSNAME, A.CREATOR, A.NAME, A.RECLENGTH,              00240000
--     B.COMPRESS,                                                      00250000
       SUM(C.LENGTH)                                                    00260000
  FROM SYSIBM.SYSTABLES A                                               00270000
--   , SYSIBM.SYSTABLEPART  B                                           00280000
     , SYSIBM.SYSCOLUMNS    C                                           00290000
   WHERE --A.NAME LIKE 'QSTT%' AND                                      00300000
         A.TYPE = 'T'                                                   00310000
--   AND A.DBNAME = B.DBNAME                                            00320000
--   AND A.TSNAME = B.TSNAME                                            00330000
     AND A.CREATOR = C.TBCREATOR                                        00340000
     AND A.NAME = C.TBNAME                                              00350000
--   AND B.PARTITION > 0                                                00360000
     AND C.COLTYPE IN ('CHAR', 'VARCHAR')                               00370000
     AND A.NAME = 'ROST_BO_AUDIT_TRL'                                   00380000
   GROUP BY A.DBNAME, A.TSNAME, A.CREATOR, A.NAME, A.RECLENGTH          00390000
--  ,B.COMPRESS                                                         00400000
