SELECT DBNAME,CREATOR,NAME,LOCATION                                     00000129
  FROM SYSIBM.SYSTABLES                                                 00000229
 WHERE DBNAME LIKE 'DMMM%P00';                                          00000329
FIM;                                                                    00000429
SELECT DISTINCT DBNAME, JOBNAME, 'REMOTESITE'                           00000526
  FROM SYSIBM.SYSCOPY                                                   00000621
 WHERE ICTYPE = 'F'                                                     00000721
   AND ICDATE > '140201'                                                00000821
   AND SUBSTR(DSNAME,4,1) = 'X'                                         00000922
   AND DBNAME LIKE 'DMMM%P00'                                           00001025
UNION ALL                                                               00001124
SELECT DISTINCT DBNAME, JOBNAME, 'LOCALSITE'                            00001226
  FROM SYSIBM.SYSCOPY                                                   00001324
 WHERE ICTYPE = 'F'                                                     00001424
   AND ICDATE > '140201'                                                00001524
   AND SUBSTR(DSNAME,4,1) <> 'X'                                        00001624
   AND DBNAME LIKE 'DMMM%P00'                                           00001727
ORDER BY 1,3, 2;                                                        00001828
FIM;                                                                    00001924
SELECT DBNAME, TSNAME, NPAGESF, INT(LOG10(NPAGESF)) AS LOG              00002024
  FROM SYSIBM.SYSCOPY                                                   00003019
 WHERE ICTYPE = 'F'                                                     00004019
   AND ICDATE >='140308'                                                00005020
   AND NPAGESF > 0                                                      00005119
   ORDER BY NPAGESF DESC;                                               00005319
FIM;                                                                    00006019
SELECT LOG, COUNT(*) FROM (                                             00006116
SELECT DBNAME, TSNAME, NPAGESF, INT(LOG10(NPAGESF)) AS LOG              00006216
  FROM SYSIBM.SYSCOPY                                                   00006316
 WHERE ICTYPE = 'F'                                                     00006416
   AND ICDATE > '140201'                                                00006516
   AND NPAGESF > 0) AS A                                                00006616
   GROUP BY LOG;                                                        00006716
-- ORDER BY NPAGESF DESC;                                               00006816
FIM;                                                                    00006916
SELECT DBNAME, TSNAME, JOBNAME, DSNAME, TIMESTAMP,                      00007011
       ICUNIT, DEVTYPE, DSVOLSER                                        00008011
  FROM SYSIBM.SYSCOPY                                                   00009011
 WHERE ICTYPE = 'F'                                                     00009111
   AND ICDATE > '140213';                                               00009211
FIM;                                                                    00009311
--UNLOAD TABLESPACE DIRB0PPS.SIRBM76A                                   00010003
--  FROMCOPY DAPE.DB2Q.DIRB0PPS.SIRBM76A.P00000.G0198V00                00020003
                                                                        00030000
SELECT 'UNLOAD TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(TSNAME),         00040000
       DBNAME, TSNAME, 1, COPYPAGESF                                    00050007
  FROM SYSIBM.SYSCOPY                                                   00060000
 WHERE DBNAME = 'DUBS0P00'                                              00070000
   AND ICTYPE = 'F'                                                     00080000
   AND DSNAME LIKE '%.DB2P.%'                                           00090000
   AND ICDATE = '121020'                                                00100002
   AND ICBACKUP = ' '                                                   00101005
UNION ALL                                                               00110004
SELECT '  FROMCOPY '||STRIP(DSNAME),                                    00120006
       DBNAME, TSNAME, 2, COPYPAGESF                                    00130007
  FROM SYSIBM.SYSCOPY                                                   00140004
 WHERE DBNAME = 'DUBS0P00'                                              00150004
   AND ICTYPE = 'F'                                                     00160004
   AND DSNAME LIKE '%.DB2P.%'                                           00170004
   AND ICDATE = '121020'                                                00180004
   AND ICBACKUP = ' '                                                   00181005
UNION ALL                                                               00182008
SELECT '  PUNCHDDN DDPUN UNLDDN DDREC',                                 00183008
       DBNAME, TSNAME, 3, COPYPAGESF                                    00184008
  FROM SYSIBM.SYSCOPY                                                   00185008
 WHERE DBNAME = 'DUBS0P00'                                              00186008
   AND ICTYPE = 'F'                                                     00187008
   AND DSNAME LIKE '%.DB2P.%'                                           00188008
   AND ICDATE = '121020'                                                00189008
   AND ICBACKUP = ' '                                                   00189108
ORDER BY 5 DESC, 2,3,4                                                  00190007
