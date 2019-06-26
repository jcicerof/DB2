 SELECT  CDEMP, DTPROCES, CDSISEQP, VALOR, CDBANCO, CDAGENCIA, CDCONTA, 00010000
 FAVORECIDO, TPCREDITO, CHAVE                                           00020000
 FROM SQLUSER.TBCRECON                                                  00030000
 WHERE                                                                  00040000
     DTPROCES  >= '2008-01-01'                                          00050000
 AND DTPROCES  <= '2008-05-31'                                          00060000
 ORDER BY CDEMP                                                         00070000
 FOR FETCH ONLY WITH UR                                                 00071001
 ;                                                                      00080000
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
 FOR FETCH ONLY WITH UR                                                 00181001
 ;                                                                      00190000
 SELECT  CDEMP, DTIPS, SISTEMA , VLCHQ, CDBCO, CDAGN, NRCCO, NMFAV,     00200000
 CDCHVATU                                                               00210000
 FROM SQLUSER.EMISSAOCHEQUE                                             00220000
 WHERE                                                                  00230000
     DTIPS     >= '2008-01-01'                                          00240000
 AND DTIPS     <= '2008-05-31'                                          00250000
 ORDER BY CDEMP                                                         00260000
 FOR FETCH ONLY WITH UR                                                 00261001
 ;                                                                      00270000
