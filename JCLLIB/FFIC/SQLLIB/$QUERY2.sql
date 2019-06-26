--
-- OBJETOS SEM BACKUP E JOBS BACKUP SEMANAIS
--
SELECT  '1) 01DAYS:',COUNT(T.DBNAME||'.'||T.TSNAME)
FROM SYSIBM.SYSTABLEPART T
WHERE T.DBNAME NOT IN ('DLCDB')
AND   T.DBNAME NOT LIKE 'BMC%'
AND   T.DBNAME NOT LIKE 'DSN%'
AND   T.DBNAME NOT LIKE 'SYS%'
AND   T.DBNAME NOT LIKE 'DB2%'
AND   T.DBNAME NOT LIKE 'DBA%'
AND   T.DBNAME NOT LIKE 'EDADB2%'
AND   T.DBNAME NOT LIKE 'PTDB%'
AND   T.DBNAME NOT LIKE 'CC390%'
AND   T.DBNAME NOT LIKE 'ABENDAID%'
AND   T.DBNAME NOT LIKE 'ADBDC%'
AND   T.DBNAME NOT LIKE 'TEMP%'
AND   T.DBNAME NOT LIKE 'WRKPM%'
AND NOT EXISTS
  (SELECT * FROM SYSIBM.SYSCOPY C
   WHERE (T.PARTITION = C.DSNUM OR C.DSNUM=0)
          AND C.DBNAME = T.DBNAME
          AND C.TSNAME = T.TSNAME
          AND ICTYPE = 'F'
          AND TIMESTAMP > (CURRENT TIMESTAMP - 1 DAYS))
--------------------------------------------------------
                   UNION
--------------------------------------------------------
SELECT  '2) 07DAYS:',COUNT(T.DBNAME||'.'||T.TSNAME)
FROM SYSIBM.SYSTABLEPART T
WHERE T.DBNAME NOT IN ('DLCDB')
AND   T.DBNAME NOT LIKE 'BMC%'
AND   T.DBNAME NOT LIKE 'DSN%'
AND   T.DBNAME NOT LIKE 'SYS%'
AND   T.DBNAME NOT LIKE 'DB2%'
AND   T.DBNAME NOT LIKE 'DBA%'
AND   T.DBNAME NOT LIKE 'EDADB2%'
AND   T.DBNAME NOT LIKE 'PTDB%'
AND   T.DBNAME NOT LIKE 'CC390%'
AND   T.DBNAME NOT LIKE 'ABENDAID%'
AND   T.DBNAME NOT LIKE 'ADBDC%'
AND   T.DBNAME NOT LIKE 'TEMP%'
AND   T.DBNAME NOT LIKE 'WRKPM%'
AND NOT EXISTS
  (SELECT * FROM SYSIBM.SYSCOPY C
   WHERE (T.PARTITION = C.DSNUM OR C.DSNUM=0)
          AND C.DBNAME = T.DBNAME
          AND C.TSNAME = T.TSNAME
          AND ICTYPE = 'F'
          AND TIMESTAMP > (CURRENT TIMESTAMP - 7 DAYS))
--------------------------------------------------------
                   UNION
--------------------------------------------------------
SELECT '3) 14DAYS:',COUNT(T.DBNAME||'.'||T.TSNAME)
FROM SYSIBM.SYSTABLEPART T
WHERE T.DBNAME NOT IN ('DLCDB')
AND   T.DBNAME NOT LIKE 'BMC%'
AND   T.DBNAME NOT LIKE 'DSN%'
AND   T.DBNAME NOT LIKE 'SYS%'
AND   T.DBNAME NOT LIKE 'DB2%'
AND   T.DBNAME NOT LIKE 'DBA%'
AND   T.DBNAME NOT LIKE 'EDADB2%'
AND   T.DBNAME NOT LIKE 'PTDB%'
AND   T.DBNAME NOT LIKE 'CC390%'
AND   T.DBNAME NOT LIKE 'ABENDAID%'
AND   T.DBNAME NOT LIKE 'ADBDC%'
AND   T.DBNAME NOT LIKE 'TEMP%'
AND   T.DBNAME NOT LIKE 'WRKPM%'
AND NOT EXISTS
  (SELECT * FROM SYSIBM.SYSCOPY C
   WHERE (T.PARTITION = C.DSNUM OR C.DSNUM=0)
          AND C.DBNAME = T.DBNAME
          AND C.TSNAME = T.TSNAME
          AND ICTYPE = 'F'
          AND TIMESTAMP > (CURRENT TIMESTAMP - 14 DAYS))
--------------------------------------------------------
                   UNION
--------------------------------------------------------
SELECT '4) 21DAYS:',COUNT(T.DBNAME||'.'||T.TSNAME)
FROM SYSIBM.SYSTABLEPART T
WHERE T.DBNAME NOT IN ('DLCDB')
AND   T.DBNAME NOT LIKE 'BMC%'
AND   T.DBNAME NOT LIKE 'DSN%'
AND   T.DBNAME NOT LIKE 'SYS%'
AND   T.DBNAME NOT LIKE 'DB2%'
AND   T.DBNAME NOT LIKE 'DBA%'
AND   T.DBNAME NOT LIKE 'EDADB2%'
AND   T.DBNAME NOT LIKE 'PTDB%'
AND   T.DBNAME NOT LIKE 'CC390%'
AND   T.DBNAME NOT LIKE 'ABENDAID%'
AND   T.DBNAME NOT LIKE 'ADBDC%'
AND   T.DBNAME NOT LIKE 'TEMP%'
AND   T.DBNAME NOT LIKE 'WRKPM%'
AND NOT EXISTS
  (SELECT * FROM SYSIBM.SYSCOPY C
   WHERE (T.PARTITION = C.DSNUM OR C.DSNUM=0)
          AND C.DBNAME = T.DBNAME
          AND C.TSNAME = T.TSNAME
          AND ICTYPE = 'F'
          AND TIMESTAMP > (CURRENT TIMESTAMP - 21 DAYS))
--------------------------------------------------------
                   UNION
--------------------------------------------------------
SELECT '5) 28DAYS:',COUNT(T.DBNAME||'.'||T.TSNAME)
FROM SYSIBM.SYSTABLEPART T
WHERE T.DBNAME NOT IN ('DLCDB')
AND   T.DBNAME NOT LIKE 'BMC%'
AND   T.DBNAME NOT LIKE 'DSN%'
AND   T.DBNAME NOT LIKE 'SYS%'
AND   T.DBNAME NOT LIKE 'DB2%'
AND   T.DBNAME NOT LIKE 'DBA%'
AND   T.DBNAME NOT LIKE 'EDADB2%'
AND   T.DBNAME NOT LIKE 'PTDB%'
AND   T.DBNAME NOT LIKE 'CC390%'
AND   T.DBNAME NOT LIKE 'ABENDAID%'
AND   T.DBNAME NOT LIKE 'ADBDC%'
AND   T.DBNAME NOT LIKE 'TEMP%'
AND   T.DBNAME NOT LIKE 'WRKPM%'
AND NOT EXISTS
  (SELECT * FROM SYSIBM.SYSCOPY C
   WHERE (T.PARTITION = C.DSNUM OR C.DSNUM=0)
          AND C.DBNAME = T.DBNAME
          AND C.TSNAME = T.TSNAME
          AND ICTYPE = 'F'
          AND TIMESTAMP > (CURRENT TIMESTAMP - 28 DAYS))
--------------------------------------------------------
                   UNION
--------------------------------------------------------
SELECT '6) OVER28DAYS',COUNT(T.DBNAME||'.'||T.TSNAME)
FROM SYSIBM.SYSTABLEPART T
WHERE T.DBNAME NOT IN ('DLCDB')
AND   T.DBNAME NOT LIKE 'BMC%'
AND   T.DBNAME NOT LIKE 'DSN%'
AND   T.DBNAME NOT LIKE 'SYS%'
AND   T.DBNAME NOT LIKE 'DB2%'
AND   T.DBNAME NOT LIKE 'DBA%'
AND   T.DBNAME NOT LIKE 'EDADB2%'
AND   T.DBNAME NOT LIKE 'PTDB%'
AND   T.DBNAME NOT LIKE 'CC390%'
AND   T.DBNAME NOT LIKE 'ABENDAID%'
AND   T.DBNAME NOT LIKE 'ADBDC%'
AND   T.DBNAME NOT LIKE 'TEMP%'
AND   T.DBNAME NOT LIKE 'WRKPM%'
AND NOT EXISTS
  (SELECT * FROM SYSIBM.SYSCOPY C
   WHERE (T.PARTITION = C.DSNUM OR C.DSNUM=0)
          AND C.DBNAME = T.DBNAME
          AND C.TSNAME = T.TSNAME
          AND ICTYPE = 'F'
          AND TIMESTAMP > (CURRENT TIMESTAMP - 365 DAYS))
--------------------------------------------------------
                   UNION
--------------------------------------------------------
SELECT 'TOTAL BASELINE DB25:',COUNT(T.DBNAME||'.'||T.TSNAME)
FROM SYSIBM.SYSTABLEPART T
WHERE T.DBNAME NOT IN ('DLCDB')
AND   T.DBNAME NOT LIKE 'BMC%'
AND   T.DBNAME NOT LIKE 'DSN%'
AND   T.DBNAME NOT LIKE 'SYS%'
AND   T.DBNAME NOT LIKE 'DB2%'
AND   T.DBNAME NOT LIKE 'DBA%'
AND   T.DBNAME NOT LIKE 'EDADB2%'
AND   T.DBNAME NOT LIKE 'PTDB%'
AND   T.DBNAME NOT LIKE 'CC390%'
AND   T.DBNAME NOT LIKE 'ABENDAID%'
AND   T.DBNAME NOT LIKE 'ADBDC%'
AND   T.DBNAME NOT LIKE 'TEMP%'
AND   T.DBNAME NOT LIKE 'WRKPM%';
