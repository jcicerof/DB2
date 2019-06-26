SELECT CHAR('COPYTOCOPY TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(TSNAME) 00011003
            ,80)                                                        00011103
       ,DBNAME,TSNAME,1                                                 00012002
  FROM SYSIBM.SYSCOPY                                                   00020000
 WHERE ICTYPE = 'F'                                                     00030000
   AND ICDATE = '150314'                                                00040004
   AND DBNAME IN ('DCCI0A00', 'DCCI0T00')                               00050004
UNION                                                                   00060002
SELECT CHAR('  FROMCOPY '||STRIP(DSNAME), 80)                           00061003
       ,DBNAME,TSNAME,2                                                 00062002
  FROM SYSIBM.SYSCOPY                                                   00080002
 WHERE ICTYPE = 'F'                                                     00090002
   AND ICDATE = '150314'                                                00091004
   AND DBNAME IN ('DCCI0A00', 'DCCI0T00')                               00101004
UNION                                                                   00120002
SELECT CHAR('  COPYDDN (TPLTOCOPY)',80)                                 00130003
       ,DBNAME,TSNAME,3                                                 00140002
  FROM SYSIBM.SYSCOPY                                                   00150002
 WHERE ICTYPE = 'F'                                                     00160002
   AND ICDATE = '150314'                                                00161004
   AND DBNAME IN ('DCCI0A00', 'DCCI0T00')                               00171004
ORDER BY 2,3,4                                                          00190002
