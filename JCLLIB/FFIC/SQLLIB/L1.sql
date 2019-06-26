SELECT A.CREATOR,A.NAME,
--SELECT DISTINCT
       B.GRANTEE
--  ,B.SELECTAUTH,B.INSERTAUTH,B.DELETEAUTH,B.UPDATEAUTH
  FROM SYSIBM.SYSTABLES A,
       SYSIBM.SYSTABAUTH B
 WHERE A.TYPE = 'T'
-- AND A.CREATOR IN ('DB2TEST', 'DB2ACPT')
   AND SUBSTR(A.NAME,1,5) IN ('CLRT_', 'CBRT_')
   AND A.CREATOR = B.TCREATOR
   AND A.NAME    = B.TTNAME
   AND B.GRANTEE LIKE 'ZZ%'
   AND 'Y' IN (B.SELECTAUTH) --,B.INSERTAUTH,B.DELETEAUTH,B.UPDATEAUTH)