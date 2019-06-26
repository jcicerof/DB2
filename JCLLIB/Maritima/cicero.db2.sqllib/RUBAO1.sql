 SELECT  CDEMP, DTPROCES, CDSISEQP, VALOR, CDBANCO, CDAGENCIA, CDCONTA, 00010000
 FAVORECIDO, TPCREDITO, CHAVE                                           00020000
 FROM SQLUSER.TBCRECON                                                  00030000
 WHERE                                                                  00040000
     DTPROCES  >= '2008-01-01'                                          00050000
 AND DTPROCES  <= '2008-05-31'                                          00060000
 ORDER BY CDEMP                                                         00070000
 FOR FETCH ONLY WITH UR                                                 00071000
 ;                                                                      00080000
