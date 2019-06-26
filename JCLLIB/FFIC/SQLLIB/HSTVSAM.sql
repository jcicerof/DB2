--                                                                      00000199
-- LISTA OS DADOS DATA ULTIMA DATA CARREGADA                            00000299
--                                                                      00000399
SELECT DATA,                                                            00000499
   DSNAME,HI_A_RBA,HI_U_RBA,DBNAME,SPACENAM,EXTENTS                     00000599
  FROM DBA1ADM.HSTVSAM                                                  00000799
--   WHERE EXTENTS = 202                                                00000899
-- WHERE DSNAME IN ('CLID5.DSNDBD.DCLI0B00.SEWN0B00.I0001.A004')        00000999
--                 ,'CLID5.DSNDBD.DCLI0B00.SEWN0B00.I0001.A004'         00001099
--                 ,'CLID5.DSNDBD.DCLI0B00.SEWN0B00.I0001.A001'         00001199
--                 ,'CLID5.DSNDBD.DCLI0B00.SEWN0B00.I0001.A002'         00001299
--                 ,'CLID5.DSNDBD.DCLI0B00.SEWN0B00.I0001.A003'         00001399
--                 ,'CLID5.DSNDBD.DCLI0B00.SEWN0B00.I0001.A004')        00001499
   WHERE DATA = (SELECT MAX(DATA) FROM DBA1ADM.HSTVSAM)                 00001599
--   AND EXTENTS >= 75                                                  00001699
 ORDER BY DATA DESC                                                     00001799
;                                                                       00001899
FIM;                                                                    00001999
--                                                                      00002099
-- DADOS PARA BASELINE VSAM                                             00002199
--                                                                      00003099
SELECT DATA,                                                            00008599
       COUNT(DISTINCT DBNAME) AS #DB,                                   00008699
       BIGINT(SUM(HI_A_RBA))/(1024*1024*1024) AS #GB,                   00008799
       COUNT(DSNAME) AS #VSAM                                           00008899
  FROM DBA1ADM.HSTVSAM                                                  00008999
   WHERE DATA = (SELECT MAX(DATA) FROM DBA1ADM.HSTVSAM)                 00009099
 GROUP BY DATA                                                          00009299
;                                                                       00009399
--                                                                      00017174
-- RETORNA APENAS POR HIGH LEVEL (SOLICITACAO DA CRIS)                  00018074
--                                                                      00019074
SELECT DATA,                                                            00020074
   SUBSTR(DSNAME,1,LOCATE('.',DSNAME)-1) AS HIGHLEVEL,                  00030074
   SUM(HI_A_RBA) AS HI_A_RBA,SUM(HI_U_RBA) AS HI_U_RBA                  00040074
  FROM DBA1ADM.HSTVSAM                                                  00050074
 WHERE DATA NOT IN ('2011-02-02'                                        00060074
                   ,'2011-02-18'                                        00070074
                   ,'2011-02-28'                                        00080074
                   ,'2011-05-09'                                        00090075
                   ,'2012-10-01')                                       00091075
 GROUP BY DATA,SUBSTR(DSNAME,1,LOCATE('.',DSNAME)-1);                   00100074
