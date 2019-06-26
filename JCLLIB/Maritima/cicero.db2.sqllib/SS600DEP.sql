--SELECT DISTINCT BQUALIFIER, BNAME                                     00000114
SELECT *                                                                00000214
  FROM SYSIBM.SYSPACKDEP                                                00000314
 WHERE DNAME = 'PW01A'                                                  00000417
   AND BTYPE IN ('T')                                                   00000514
-- AND BNAME = 'PW01A'                                                  00000616
-- GROUP BY DNAME, BNAME, BQUALIFIER                                    00000715
  FOR READ ONLY WITH UR;                                                00000815
SELECT * FROM SYSIBM.SYSTABLES                                          00000915
 WHERE NAME LIKE 'SS%'                                                  00001015
   AND TYPE ='T'                                                        00001115
   AND TSNAME = 'SSSEGTIT';                                             00001215
   FIM                                                                  00001315
SELECT DBNAME, TSNAME, COUNT(*)                                         00001415
  FROM SYSIBM.SYSTABLES                                                 00001515
 WHERE NAME LIKE 'SS%'                                                  00001615
   AND TYPE ='T'                                                        00002009
 GROUP BY DBNAME, TSNAME                                                00003010
 HAVING COUNT(*) > 1                                                    00003109
  FOR READ ONLY WITH UR;                                                00004009
