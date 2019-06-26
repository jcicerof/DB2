SELECT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       DSNAME, DBNAME, TSNAME, ICDATE, RAND() AS RANDOM
  FROM SYSIBM.SYSCOPY
 WHERE TIMESTAMP >= '2017-01-01-00.00.00.000000'
   AND TIMESTAMP <  '2017-04-01-00.00.00.000000'
   AND ICTYPE = 'F'
   AND DSNAME LIKE '%.DB2Q.%'
   AND SUBSTR(DSNAME,4,1) <> 'X'
 ORDER BY RANDOM DESC
 FETCH FIRST 60 ROWS ONLY;
