--                                                                      00001002
-- CHECK DOS REPORTS RMM                                                00010001
--                                                                      00030000
SELECT SUBSYS, DBNAME,TSNAME,DSNUM, MAX(DSNAME)                         00040023
  FROM (                                                                00040123
        SELECT SUBSTR(DSNAME,6,4) AS SUBSYS                             00040223
             , DBNAME, TSNAME, DSNUM                                    00041023
             , MAX(DSNAME) AS DSNAME                                    00050023
        --   , TIMESTAMP                                                00060023
        --   , JOBNAME                                                  00080023
          FROM SYSIBM.SYSCOPY                                           00090023
         WHERE DSNAME LIKE '%X.DB2%'                                    00100023
           AND ICTYPE = 'F'                                             00110023
           AND SUBSTR(JOBNAME,1,4) <> 'IBM1'                            00170023
           AND TIMESTAMP <= '2014-08-26-13.55.38.000000' --HORA ABARS   00180025
         GROUP BY DBNAME, TSNAME, DSNUM, DSNAME) AS TEMP                00190023
 GROUP BY SUBSYS, DBNAME, TSNAME, DSNUM                                 00191023
;                                                                       00201013
