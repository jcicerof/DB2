 SELECT CDEMP, DTEMICHE, SISTEMA, VRLIQUID, NRDOCTO, CDBCOPGT, CDAGEPGT,00090000
 CDCTAPGT, FAVORECIDO, CDCHVATU, CDSUCUR, NRCCUSTO, NRRECIBO            00100000
 FROM SQLUSER.TBSOLPGT                                                  00110000
 WHERE                                                                  00120000
     DTEMICHE  >= '2008-01-01'                                          00130000
 AND DTEMICHE  <= '2008-05-31'                                          00140000
 AND DTEXCSIS   = '1111-11-11'                                          00150000
 AND CDBCOPGT  >  0                                                     00160000
 AND CDAGEPGT  >  0                                                     00170000
 ORDER BY CDEMP                                                         00180000
 FOR FETCH ONLY WITH UR                                                 00181000
 ;                                                                      00190000
