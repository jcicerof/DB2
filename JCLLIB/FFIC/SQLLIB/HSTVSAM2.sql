--                                                                      00010017
-- RETORNA APENAS POR HIGH LEVEL (SOLICITACAO DA CRIS)                  00010117
--                                                                      00011017
SELECT DATA,                                                            00012014
   SUBSTR(DSNAME,1,LOCATE('.',DSNAME)-1) AS HIGHLEVEL,                  00013015
   SUM(HI_A_RBA) AS HI_A_RBA,SUM(HI_U_RBA) AS HI_U_RBA                  00013115
  FROM DBA1ADM.HSTVSAM                                                  00014000
 WHERE DATA NOT IN ('2011-02-02'                                        00014119
                   ,'2011-02-18'                                        00014219
                   ,'2011-02-28'                                        00014319
                   ,'2011-05-09')                                       00014419
 GROUP BY DATA,SUBSTR(DSNAME,1,LOCATE('.',DSNAME)-1);                   00015017
