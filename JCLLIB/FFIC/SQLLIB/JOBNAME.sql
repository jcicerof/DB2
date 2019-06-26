SELECT DISTINCT 'DB2D', JOBNAME                                         00010000
  FROM SYSIBM.SYSCOPY                                                   00020000
 WHERE ICTYPE IN ('F')                                                  00030000
   AND ICDATE BETWEEN '100105' AND '100531'                             00040000
   AND SUBSTR(DSNAME,1,9) = 'DSSX.DB2D'                                 00050001
