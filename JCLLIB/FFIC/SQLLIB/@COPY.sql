SELECT DISTINCT DBNAME,AUTHID,JOBNAME,ICTYPE, MAX(ICDATE) AS ICDATE     00010020
  FROM SYSIBM.SYSCOPY                                                   00020000
 WHERE DBNAME IN ('DMAR0P00',                                           00050019
                  'DMAD0A00',                                           00060017
                  'DMAD0A01',                                           00070017
                  'DMAD0P00',                                           00080017
                  'DMAD0P01',                                           00090017
                  'DMAD0T00',                                           00100017
                  'DMAD0T01')                                           00110017
   AND ICTYPE IN ('F', 'I')                                             00111017
 GROUP BY DBNAME,AUTHID,JOBNAME,ICTYPE, ICDATE                          00120021
