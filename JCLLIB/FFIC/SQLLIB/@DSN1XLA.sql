--//EQ042T   EXEC PROC=RECBKP,TS=EQ042T,SS=EQ,DT=&DT,                   00010001
--//XLAT=',NUMPARTS(10),DSSIZE(2G),PAGESIZE(4K)'                        00020001
SELECT CHAR('//'||CHAR(STRIP(NAME), 9)||                                00030001
   'EXEC PROC=RECBKP,SS='||SUBSTR(STRIP(DBNAME), 1, 2)||                00040001
   ',TS='||STRIP(NAME)||',DT=&DT,', 80),                                00050001
   SUBSTR(STRIP(DBNAME), 1, 2), NAME, 1                                 00060001
  FROM SYSIBM.SYSTABLESPACE                                             00070001
 WHERE SUBSTR(DBNAME, 4, 2) IN ('AE', 'I0')                             00080002
UNION ALL                                                               00090001
SELECT CHAR('//           '||                                           00100001
   'XLAT='||''''||                                                      00110001
   CASE                                                                 00120001
     WHEN PARTITIONS > 0 THEN ',NUMPARTS('||STRIP(CHAR(PARTITIONS))||')'00130001
     ELSE ''                                                            00140001
   END                                                                  00150001
   ||                                                                   00160001
   CASE                                                                 00170001
     WHEN DSSIZE = 2097152 THEN ',DSSIZE(2G)'                           00180001
     WHEN DSSIZE = 4194304 THEN ',DSSIZE(4G)'                           00190001
     WHEN DSSIZE = 8388608 THEN ',DSSIZE(8G)'                           00200001
     WHEN DSSIZE = 16777216 THEN ',DSSIZE(16G)'                         00210001
     ELSE ''                                                            00220001
   END                                                                  00230001
   ||                                                                   00240001
   CASE                                                                 00250001
     WHEN PGSIZE = 4 THEN ',PAGESIZE(4K)'                               00260001
     WHEN PGSIZE = 8 THEN ',PAGESIZE(8K)'                               00270001
          WHEN PGSIZE = 16 THEN ',PAGESIZE(16K)'                        00280001
          WHEN PGSIZE = 32 THEN ',PAGESIZE(32K)'                        00290001
          ELSE ''                                                       00300001
        END                                                             00310001
        ||'''', 80)                                                     00320001
       ,SUBSTR(STRIP(DBNAME), 1, 2), NAME, 2                            00330001
       FROM SYSIBM.SYSTABLESPACE                                        00340001
      WHERE SUBSTR(DBNAME, 4, 2) IN ('AE', 'I0')                        00350002
      ORDER BY 3, 4                                                     00360001
     ;                                                                  00370001
