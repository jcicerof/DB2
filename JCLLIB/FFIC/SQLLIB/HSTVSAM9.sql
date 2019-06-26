--                                                                      00010000
-- DADOS PARA BASELINE VSAM                                             00011000
--                                                                      00012000
SELECT DBNAME                                                           00015403
     , BIGINT(SUM(HI_A_RBA))/(1024*1024) AS "#ALLOC(MB)"                00015607
     , BIGINT(SUM(HI_U_RBA))/(1024*1024) AS "#USED(MB)"                 00015707
     , COUNT(DSNAME) AS #VSAM                                           00015803
  FROM DBA1ADM.HSTVSAM                                                  00015902
   WHERE DATA = (SELECT MAX(DATA) FROM DBA1ADM.HSTVSAM)                 00016002
     AND DBNAME IN ('DCDI0P07'                                          00016102
                   ,'DCPI0P00'                                          00016202
                   ,'DCDI0A07'                                          00016302
                   ,'DCPI0A00')                                         00016402
 GROUP BY DBNAME                                                        00016502
;                                                                       00017000
