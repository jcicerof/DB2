--SELECT DBNAME, TSNAME, MAX(PARTITION)                                 00010005
--  FROM SYSIBM.SYSTABLEPART                                            00020005
-- WHERE VCATNAME = 'MACDE'                                             00021005
-- GROUP BY DBNAME, TSNAME                                              00030005
SELECT A.IXCREATOR, A.IXNAME, B.DBNAME, B.INDEXSPACE,MAX(PARTITION)     00040006
  FROM SYSIBM.SYSINDEXPART A,                                           00050006
       SYSIBM.SYSINDEXES B                                              00050107
 WHERE A.VCATNAME = 'MACDE'                                             00051006
   AND A.IXCREATOR = B.CREATOR                                          00051106
   AND A.IXNAME    = B.NAME                                             00051206
 GROUP BY A.IXCREATOR, A.IXNAME,B.DBNAME, B.INDEXSPACE                  00052006
