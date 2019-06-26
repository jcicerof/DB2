--SELECT * FROM SYSIBM.SYSINDEXES                                       00010004
-- WHERE INDEXSPACE IN ('CNDG1C#2', 'CNDG1NHX')                         00020004
--WITH UR;                                                              00030004
--SELECT STRIP(CREATOR)||'.'||STRIP(NAME) FROM SYSIBM.SYSINDEXES        00040008
-- SELECT B.DBNAME, B.TSNAME,B.CARD FROM SYSIBM.SYSINDEXES A,           00041013
--               SYSIBM.SYSTABLES  B                                    00042013
--  WHERE A.FULLKEYCARD= -1                                             00050013
--    AND A.TBCREATOR = 'MARITIMA'                                      00060013
--    AND A.TBCREATOR = B.CREATOR                                       00070013
--    AND A.TBNAME    = B.NAME                                          00080013
-- ;                                                                    00081013
SELECT STRIP(DBNAME)||'.'||STRIP(TSNAME)                                00090015
  FROM SYSIBM.SYSTABLES                                                 00100011
 WHERE CARD = -1                                                        00110011
   AND TYPE = 'T'                                                       00120012
   AND CREATOR IN ('ANO2000', 'MARITIMA')                               00130014
