--                                                                      00010000
-- LISTA OS DADOS METRICAS VSAM                                         00011000
--                                                                      00012000
                                                                        00012100
-- NUMERO DE DATASETS                                                   00012200
SELECT COUNT(*) AS #VSAM,                                               00013002
       DEC(SUM(HI_A_RBA)/1073741824,7,2) AS #GB,                        00013110
       COUNT(DISTINCT DBNAME) AS #DB                                    00014001
  FROM DBA1ADM.HSTVSAM                                                  00015000
   WHERE DATA = (SELECT MAX(DATA) FROM DBA1ADM.HSTVSAM)                 00015100
;                                                                       00015200
