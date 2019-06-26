SELECT DBNAME, TSNAME, ICTYPE, ICDATE, ICTIME, JOBNAME                  00010001
  FROM SYSIBM.SYSCOPY                                                   00011001
 WHERE ICTYPE = 'Q'                                                     00020000
 ORDER BY TIMESTAMP DESC                                                00030002
