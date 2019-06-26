SELECT JOBNAME, ICDATE, ICTIME, ICTYPE, DSNAME                          00010003
  FROM SYSIBM.SYSCOPY                                                   00020000
 WHERE TIMESTAMP >= '2010-05-01-00.00.00.000000'                        00030001
   AND ICTYPE IN ('F', 'Q', 'I')                                        00031002
ORDER BY ICDATE, ICTIME                                                 00040000
