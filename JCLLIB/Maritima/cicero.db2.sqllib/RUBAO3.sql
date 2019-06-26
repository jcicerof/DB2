 SELECT  CDEMP, DTIPS, SISTEMA , VLCHQ, CDBCO, CDAGN, NRCCO, NMFAV,     00200000
 CDCHVATU                                                               00210000
 FROM SQLUSER.EMISSAOCHEQUE                                             00220000
 WHERE                                                                  00230000
     DTIPS     >= '2008-01-01'                                          00240000
 AND DTIPS     <= '2008-05-31'                                          00250000
 ORDER BY CDEMP                                                         00260000
 FOR FETCH ONLY WITH UR                                                 00261000
 ;                                                                      00270000
