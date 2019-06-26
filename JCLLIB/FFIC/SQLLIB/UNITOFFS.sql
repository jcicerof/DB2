SELECT DISTINCT SUBSTR(DSNAME,6,4),JOBNAME
  FROM SYSIBM.SYSCOPY
 WHERE TIMESTAMP >= CURRENT TIMESTAMP - 45 DAYS
   AND DSNAME LIKE '%X.DB2%'
