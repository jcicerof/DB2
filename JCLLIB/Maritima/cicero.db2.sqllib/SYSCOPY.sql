SELECT * FROM SYSIBM.SYSCOPY A                                          00001299
-- SELECT DISTINCT A.DBNAME,A.TSNAME FROM SYSIBM.SYSCOPY A              00001399
 WHERE                                                                  00001499
--     A.DBNAME = 'DBEEOR'                                              00001599
       A.TSNAME IN ('ORCIPNIV')                                         00001699
   AND A.ICTYPE   IN ('W')                                              00001799
-- AND A.AUTHID   = 'CA7ONL'                                            00001999
-- AND A.DBNAME = 'DB2ADM'                                              00002099
-- AND A.TIMESTAMP='2008-02-16-20.00.54.622236'                         00002199
-- AND A.TSNAME IN (SELECT B.TSNAME                                     00002299
--                    FROM SYSIBM.SYSTABLES B                           00002399
--                   WHERE --B.CREATOR = 'TECINFOR'                     00002499
--                         B.NAME IN ('CORRETOR'                        00002599
--                                   ,'CORRTCOM'                        00002699
--                                   ,'CORRTSUS')                       00002799
--                     AND B.TYPE = 'T')                                00002899
   ORDER BY A.DBNAME, A.TSNAME, A.TIMESTAMP DESC                        00002999
WITH UR;                                                                00003099
