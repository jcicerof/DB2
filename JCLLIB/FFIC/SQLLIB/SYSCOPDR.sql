SELECT DBNAME, TSNAME, DSNUM                                            00070099
     , MAX(DSNAME) AS DSNAME                                            00070199
     , MAX(TIMESTAMP) AS TIMESTAMP                                      00070299
     , JOBNAME                                                          00080084
  FROM SYSIBM.SYSCOPY                                                   00090084
 WHERE DSNAME LIKE '%X.DB2%'                                            00100099
   AND ICTYPE = 'F'                                                     00110084
   AND SUBSTR(JOBNAME,1,4) <> 'IBM1'                                    00160084
   AND TIMESTAMP <= '2012-08-29-09.18.34.000000' --HORA RELATORIO ABARS 00170099
 GROUP BY DBNAME, TSNAME, DSNUM, JOBNAME                                00180099
 ORDER BY 4                                                             00190084
; FIM;                                                                  00200086
SELECT DBNAME, TSNAME, DSNUM, MAX(DSNAME), MAX(TIMESTAMP), 'DB2P'       00210086
     , JOBNAME                                                          00220086
  FROM SYSIBM.SYSCOPY                                                   00230086
 WHERE DSNAME LIKE '%X.DB2P%'                                           00240086
   AND ICTYPE = 'F'                                                     00250086
   AND DSNAME LIKE 'PMXX.DB2P.DPMX0P05.SSJN0P00.P00000%'                00260086
-- AND DBNAME IN ('DMAD0P00'                                            00270086
--               ,'DMAD0P01'                                            00280086
--               ,'TATPDB02')                                           00290086
-- AND TSNAME = 'SSUN0P00'                                              00300086
   AND SUBSTR(JOBNAME,1,4) <> 'IBM1'                                    00310086
   AND TIMESTAMP <= '2011-09-19-09.59.02.000000' --HORA RELATORIO ABARS 00320086
 GROUP BY DBNAME, TSNAME, DSNUM, JOBNAME                                00330086
 ORDER BY 4                                                             00340086
;                                                                       00350086
