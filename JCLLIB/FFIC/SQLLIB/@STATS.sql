--SELECT DBNAME, TSNAME, CREATOR, NAME, YEAR(STATSTIME)                 00010003
--  FROM SYSIBM.SYSTABLES                                               00020003
-- WHERE TYPE ='T'                                                      00030003
--;                                                                     00031003
SELECT YEAR(STATSTIME), COUNT(*)                                        00040002
  FROM SYSIBM.SYSTABLES                                                 00050002
 WHERE TYPE ='T'                                                        00060002
 GROUP BY YEAR(STATSTIME)                                               00070002
