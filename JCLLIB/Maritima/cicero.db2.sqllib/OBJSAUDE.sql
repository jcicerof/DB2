SELECT DBNAME, COUNT(*)                                                 00010001
  FROM SYSIBM.SYSTABLES                                                 00020000
 WHERE SUBSTR(NAME,1,2) IN ('SS', 'SA')                                 00030000
   AND TYPE = 'T'                                                       00040000
 GROUP BY DBNAME                                                        00041001
FOR READ ONLY WITH UR;                                                  00050000
SELECT DISTINCT STRIP(DBNAME)||'.'||STRIP(TSNAME),CREATOR,NAME          00060001
  FROM SYSIBM.SYSTABLES                                                 00070001
 WHERE SUBSTR(NAME,1,2) IN ('SS', 'SA')                                 00080001
   AND TYPE = 'T'                                                       00090001
FOR READ ONLY WITH UR;                                                  00100001
