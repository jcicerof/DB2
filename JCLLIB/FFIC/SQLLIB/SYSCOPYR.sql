SELECT DBNAME, TSNAME, DSNUM, MAX(DSNAME) AS DSNAME,                    00010022
         MAX(TIMESTAMP) AS TIMESTAMP,                                   00011030
--       TIMESTAMP,                                                     00012030
       JOBNAME, SUBSTR(DSNAME,6,4) AS SUBSYS                            00020021
  FROM SYSIBM.SYSCOPY                                                   00030000
 WHERE DSNAME LIKE '%X.DB2%'                                            00040004
   AND ICTYPE = 'F'                                                     00050000
   AND SUBSTR(JOBNAME,1,4) <> 'IBM1'                                    00110000
   AND TIMESTAMP <= '2011-10-18-19.00.00.000000' --DECLARATION DATE     00120029
 GROUP BY DBNAME, TSNAME, DSNUM,                                        00130030
       JOBNAME, SUBSTR(DSNAME,6,4)                                      00131026
 ORDER BY 4                                                             00140009
;                                                                       00150024
