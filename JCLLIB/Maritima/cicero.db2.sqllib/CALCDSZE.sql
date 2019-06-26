SELECT CHAR('//'||CHAR(STRIP(NAME), 9)||                                00010000
   'EXEC PROC=RECBKP,SS='||SUBSTR(STRIP(DBNAME), 1, 2)||                00020000
   ',TS='||STRIP(NAME)||',DT=&DT,', 80),                                00030000
   SUBSTR(STRIP(DBNAME), 1, 2), NAME, 1                                 00040000
  FROM SYSIBM.SYSTABLESPACE                                             00050000
 WHERE SUBSTR(DBNAME, 1, 4) = 'DBSS'                                    00060000
UNION ALL                                                               00070000
SELECT CHAR('//           '||                                           00080000
   'XLAT='||''''||                                                      00090000
   CASE                                                                 00100000
     WHEN PARTITIONS > 0 THEN ',NUMPARTS('||STRIP(CHAR(PARTITIONS))||')'00110000
     ELSE ''                                                            00120000
   END                                                                  00130000
   ||                                                                   00140000
   CASE                                                                 00150000
     WHEN DSSIZE = 2097152 THEN ',DSSIZE(2G)'                           00160000
     WHEN DSSIZE = 4194304 THEN ',DSSIZE(4G)'                           00170000
     WHEN DSSIZE = 8388608 THEN ',DSSIZE(8G)'                           00180000
     WHEN DSSIZE = 16777216 THEN ',DSSIZE(16G)'                         00190000
     ELSE ''                                                            00200000
   END                                                                  00210000
   ||                                                                   00220000
   CASE                                                                 00230000
     WHEN PGSIZE = 4 THEN ',PAGESIZE(4K)'                               00240000
     WHEN PGSIZE = 8 THEN ',PAGESIZE(8K)'                               00250000
     WHEN PGSIZE = 16 THEN ',PAGESIZE(16K)'                             00260000
     WHEN PGSIZE = 32 THEN ',PAGESIZE(32K)'                             00270000
     ELSE ''                                                            00280000
   END                                                                  00290000
   ||'''', 80)                                                          00300000
  ,SUBSTR(STRIP(DBNAME), 1, 2), NAME, 2                                 00310000
  FROM SYSIBM.SYSTABLESPACE                                             00320000
 WHERE SUBSTR(DBNAME, 1, 4) = 'DBSS'                                    00330000
 ORDER BY 3, 4                                                          00340000
;                                                                       00350000
