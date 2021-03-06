-- //12345678 EXEC PROC=ANALYSIS
-- //SYSTSIN DD *
-- PROFILE PREFIX(U807875)
-- REVOKE AASE     MM/DD/YYYY DZR
--
SELECT DISTINCT
   CHAR('//'||CHAR(STRIP(GRANTEE),8)||' EXEC PROC=ANALYSIS',80)
   ,STRIP(GRANTEE),1
  FROM SYSIBM.SYSTABAUTH
 WHERE GRANTEE LIKE 'ZZ%'
UNION ALL
SELECT DISTINCT
   CHAR('//SYSTSIN DD *',80)
   ,STRIP(GRANTEE),2
  FROM SYSIBM.SYSTABAUTH
 WHERE GRANTEE LIKE 'ZZ%'
UNION ALL
SELECT DISTINCT
   CHAR('PROFILE PREFIX(U807875)',80)
   ,STRIP(GRANTEE),3
  FROM SYSIBM.SYSTABAUTH
 WHERE GRANTEE LIKE 'ZZ%'
UNION ALL
SELECT DISTINCT
   CHAR('REVOKE '||CHAR(STRIP(GRANTEE),8)||' MM/DD/YYYY DBA',80)
   ,STRIP(GRANTEE),4
  FROM SYSIBM.SYSTABAUTH
 WHERE GRANTEE LIKE 'ZZ%'
 ORDER BY 2,3
