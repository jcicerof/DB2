--                                                                      00010000
-- LISTA OS DADOS DATA ULTIMA DATA CARREGADA                            00011000
--                                                                      00012000
SELECT DATA,                                                            00015400
   DSNAME,HI_A_RBA,HI_U_RBA,DBNAME,SPACENAM,EXTENTS                     00015500
  FROM DBA1ADM.HSTVSAM                                                  00015700
   WHERE DATA = (SELECT MAX(DATA) FROM DBA1ADM.HSTVSAM)                 00015800
--   AND SUBSTR(DBNAME,1,5) = 'DUBS0'                                   00015908
--   AND SUBSTR(SPACENAM,1,4) = 'SAPS'                                  00016007
     AND SUBSTR(DSNAME,1,21) IN ( 'UBSDE.DSNDBD.DUBS0P00'               00016108
                                 ,'UBSDT.DSNDBD.DUBS0T00'               00016208
                                 ,'UBSDA.DSNDBD.DUBS0A00'               00016308
                                 ,'UBSD5.DSNDBD.DUBS0BFT'               00016408
                                 ,'UBSD5.DSNDBD.DUBS0BAP'               00016508
                                 ,'UBSD5.DSNDBD.DUBS0BBS'               00016608
                                 ,'UBSD5.DSNDBD.DUBS0BCP'               00016708
                                 ,'UBSD5.DSNDBD.DUBS0BLT'               00016808
                                 ,'UBSD5.DSNDBD.DUBS0BMK'               00016908
                                 ,'UBSD5.DSNDBD.DUBS0BPD'               00017008
                                 ,'UBSD5.DSNDBD.DUBS0BTT'               00017108
                                 ,'UBSD5.DSNDBD.DUBS0BYS')              00017208
;                                                                       00018000
