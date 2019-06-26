SELECT DISTINCT CHAR(' REBUILD INDEX (ALL) TABLESPACE '||               00000101
     STRIP(DBNAME)||'.'||STRIP(TSNAME),80)                              00000201
    ,DBNAME,TSNAME,1                                                    00000300
  FROM SYSIBM.SYSCOPY                                                   00000400
WHERE DSNAME LIKE 'DBA5.C027028.IC0%'                                   00000500
UNION                                                                   00000600
SELECT DISTINCT CHAR('   STATISTICS KEYCARD UPDATE ALL'                 00000702
    ,80)                                                                00000802
    ,DBNAME,TSNAME,2                                                    00000900
  FROM SYSIBM.SYSCOPY                                                   00001000
WHERE DSNAME LIKE 'DBA5.C027028.IC0%'                                   00002000
ORDER BY 2,3,4                                                          00003000
;                                                                       00004000
