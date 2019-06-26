--REBIND PACKAGE (MATBCOLE.AL504D1) ISOLATION(CS) EXPLAIN(YES)          00001010
--                                                                      00002010
SELECT *                                                                00003012
 FROM SYSIBM.SYSPACKAGE                                                 00006011
 WHERE VALID = 'N'                                                      00020007
   AND SUBSTR(COLLID,1,4) IN ('MAPB', 'MAPC', 'SSRF')                   00021009
 WITH UR;                                                               00030000
