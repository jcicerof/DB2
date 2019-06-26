--                                                                      00001000
-- DADOS PARA BASELINE VSAM                                             00002000
--                                                                      00003000
SELECT DBNAME,SPACENAM,HI_A_RBA                                         00004002
  FROM DBA1ADM.HSTVSAM                                                  00008000
   WHERE DATA = (SELECT MAX(DATA) FROM DBA1ADM.HSTVSAM)                 00008100
;                                                                       00008300
FIM;                                                                    00008400
--                                                                      00008500
-- LISTA OS DADOS DATA ULTIMA DATA CARREGADA                            00008600
--                                                                      00008700
SELECT DATA,                                                            00008800
   DSNAME,HI_A_RBA,HI_U_RBA,DBNAME,SPACENAM,EXTENTS                     00008900
  FROM DBA1ADM.HSTVSAM                                                  00009000
 WHERE DATA = (SELECT MAX(DATA) FROM DBA1ADM.HSTVSAM)                   00009100
;                                                                       00009200
--                                                                      00009300
-- RETORNA APENAS POR HIGH LEVEL (SOLICITACAO DA CRIS)                  00009400
--                                                                      00009500
SELECT DATA,                                                            00009600
   SUBSTR(DSNAME,1,LOCATE('.',DSNAME)-1) AS HIGHLEVEL,                  00009700
   SUM(HI_A_RBA) AS HI_A_RBA,SUM(HI_U_RBA) AS HI_U_RBA                  00009800
  FROM DBA1ADM.HSTVSAM                                                  00009900
 WHERE DATA NOT IN ('2011-02-02'                                        00010000
                   ,'2011-02-18'                                        00020000
                   ,'2011-02-28'                                        00030000
                   ,'2011-05-09'                                        00040000
                   ,'2012-10-01')                                       00050000
 GROUP BY DATA,SUBSTR(DSNAME,1,LOCATE('.',DSNAME)-1);                   00060000
