--
--
--
SELECT STRIP(GETVARIABLE('SYSIBM.SSID')) AS SSID,
       S.DBNAME, S.NAME, 'DB' AS CREATOR, '*' AS NAME,
       'DBID' AS TYPE, 0 AS ORDER,
       S.DBID AS IDENTIFIER
  FROM SYSIBM.SYSTABLESPACE S
UNION ALL
SELECT STRIP(GETVARIABLE('SYSIBM.SSID')) AS SSID,
       S.DBNAME, S.NAME, 'TS' AS CREATOR, '*' AS NAME,
       'PSID' AS TYPE, 1 AS ORDER,
       S.PSID AS IDENTIFIER
  FROM SYSIBM.SYSTABLESPACE S
UNION
SELECT STRIP(GETVARIABLE('SYSIBM.SSID')) AS SSID,
       S.DBNAME, S.NAME, T.CREATOR, T.NAME,
       'OBID' AS TYPE, 2 AS ORDER,
       T.OBID AS IDENTIFIER
  FROM SYSIBM.SYSTABLESPACE S,
       SYSIBM.SYSTABLES T
 WHERE S.DBNAME = T.DBNAME
   AND S.NAME = T.TSNAME
   AND T.TYPE = 'T'
ORDER BY 1,2,3,7,8;
FIM;
--
--
--
SELECT STRIP(GETVARIABLE('SYSIBM.SSID'))||'.'||
       STRIP(S.DBNAME)||'.'||STRIP(S.NAME)||'.'||
       STRIP(T.CREATOR)||'.'||STRIP(T.NAME) AS
       "SSID+DBNAME+TSNAME+CREATOR+TBNAME",
       'DBID' AS IDENTIFIER, 0 AS ORDER,
       S.DBID
  FROM SYSIBM.SYSTABLESPACE S,
       SYSIBM.SYSTABLES T
 WHERE S.DBNAME = T.DBNAME
   AND S.NAME = T.TSNAME
   AND T.TYPE = 'T'
UNION ALL
SELECT STRIP(GETVARIABLE('SYSIBM.SSID'))||'.'||
       STRIP(S.DBNAME)||'.'||STRIP(S.NAME)||'.'||
       STRIP(T.CREATOR)||'.'||STRIP(T.NAME) AS
       "SSID+DBNAME+TSNAME+CREATOR+TBNAME",
       'PSID' AS IDENTIFIER, 1 AS ORDER,
       S.PSID
  FROM SYSIBM.SYSTABLESPACE S,
       SYSIBM.SYSTABLES T
 WHERE S.DBNAME = T.DBNAME
   AND S.NAME = T.TSNAME
   AND T.TYPE = 'T'
UNION ALL
SELECT STRIP(GETVARIABLE('SYSIBM.SSID'))||'.'||
       STRIP(S.DBNAME)||'.'||STRIP(S.NAME)||'.'||
       STRIP(T.CREATOR)||'.'||STRIP(T.NAME) AS
       "SSID+DBNAME+TSNAME+CREATOR+TBNAME",
       'OBID' AS IDENTIFIER, 2 AS ORDER,
       T.OBID -- S.OBID (TS OBID)
  FROM SYSIBM.SYSTABLESPACE S,
       SYSIBM.SYSTABLES T
 WHERE S.DBNAME = T.DBNAME
   AND S.NAME = T.TSNAME
   AND T.TYPE = 'T'
ORDER BY 1,3;
--
--
--
SELECT STRIP(GETVARIABLE('SYSIBM.SSID')) AS SSID,
       S.DBNAME, S.NAME, T.CREATOR, T.NAME,
       STRIP(GETVARIABLE('SYSIBM.SSID'))||'.'||
       STRIP(S.DBNAME)||'.'||STRIP(S.NAME)||'.'||
       STRIP(T.CREATOR)||'.'||STRIP(T.NAME) AS NAME,
       S.DBID, S.PSID, T.OBID -- S.OBID (TS OBID)
  FROM SYSIBM.SYSTABLESPACE S,
       SYSIBM.SYSTABLES T
 WHERE S.DBNAME = T.DBNAME
   AND S.NAME = T.TSNAME
   AND T.TYPE = 'T';
--