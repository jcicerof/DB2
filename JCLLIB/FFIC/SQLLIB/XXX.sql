SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       DBNAME,CREATOR,NAME,
       CASE
         WHEN TYPE = 'T' THEN 'TABLE'
         WHEN TYPE = 'V' THEN 'VIEW'
         WHEN TYPE = 'A' THEN 'ALIAS'
         ELSE TYPE
       END AS TYPE
  FROM SYSIBM.SYSTABLES
 WHERE SUBSTR(DBNAME,1,3) NOT IN ('DSN')
