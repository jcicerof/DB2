--                                                                      00010000
-- LISTA OS DADOS DATA ULTIMA DATA CARREGADA                            00011000
--                                                                      00012000
SELECT DATA,                                                            00013000
   DSNAME,HI_A_RBA,HI_U_RBA,DBNAME,SPACENAM,EXTENTS                     00014000
  FROM DBA1ADM.HSTVSAM                                                  00015000
   WHERE DSNAME = 'UCSDE.DSNDBD.DUCS0PAT.SA4S0P00.I0001.A019'           00015101
