--
-- LISTA DE UTILITARIOS
--
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       A.DBNAME,C.JOBNAME,MAX(C.TIMESTAMP),
       CASE C.ICTYPE
            WHEN 'I' THEN 'COPY'
            WHEN 'F' THEN 'COPY'
            WHEN 'M' THEN 'MODIFY'
            WHEN 'Q' THEN 'QUIESCE'
            WHEN 'R' THEN 'LOAD REPLACE'
            WHEN 'S' THEN 'LOAD REPLACE'
            WHEN 'W' THEN 'REORG'
            WHEN 'X' THEN 'REORG'
            WHEN 'Y' THEN 'LOAD RESUME'
            WHEN 'Z' THEN 'LOAD RESUME'
       END AS JOBTYPE
  FROM SYSIBM.SYSTABLESPACE A,
       SYSIBM.SYSTABLES     B,
       SYSIBM.SYSCOPY   C
 WHERE A.DBNAME = C.DBNAME
   AND A.NAME = C.TSNAME
   AND C.ICTYPE IN ('F')
-- AND C.ICTYPE IN ('I','F','M','Q','R','S','W','X','Y','Z')
   AND SUBSTR(C.JOBNAME,1,3) NOT IN ('IBM')
-- AND B.TYPE = 'T'
   AND B.DBNAME = A.DBNAME
   AND B.TSNAME = A.NAME
   AND B.CREATOR IN ('DB2PRVT', 'DB2PRV2')
   AND B.NAME IN ('CLIENT_ADDRESS'
                 ,'CLIENT_ADDRESS_V'
                 ,'CLIENT_BILLING'
                 ,'CLIENT_CLAIM'
                 ,'CLIENT_CROSS_REF'
                 ,'CLIENT_HELP'
                 ,'CLIENT_KEYS'
                 ,'CLIENT_LICENSE'
                 ,'CLIENT_MENU'
                 ,'CLIENT_PHONE'
                 ,'CLIENT_POLICY'
                 ,'CLIENT_POLICY_V'
                 ,'CLIENT_SUMMARY'
                 ,'CLIENT_TAB'
                 ,'CLIENT_TAB_V'
                 ,'CLIENT_TAX'
                 ,'CLIENT_UCT'
                 ,'CLT_ADD_ADR_TEXT'
                 ,'CLT_ADD_NAME_TEXT'
                 ,'CLT_ADR_RELATION'
                 ,'CLT_ADR_RELATION_V'
                 ,'CLT_ADR_SEARCH'
                 ,'CLT_CLT_RELATION'
                 ,'CLT_CLT_VLD_REL'
                 ,'CLT_CONTACT_INFO'
                 ,'CLT_OBJ_RELATION'
                 ,'CLT_OBJ_RELATION_V'
                 ,'CLT_OTHER_OBJECTS'
                 ,'CLT_OWNING_SYSTE_V'
                 ,'CLT_OWNING_SYSTEM'
                 ,'CLT_REF_RELATION'
                 ,'CLT_TABLE_ID_GEN'
                 ,'CLT_TEMPLATE'
                 ,'CDI_DB_DUNBRAD'
                 ,'CDI_PA_PARR'
                 ,'CDI_SN_DBSCRUB'
                 ,'CLT_TABLE_ID_GEN'
                 ,'CLT_ADD_ADR_TEXT'
                 ,'CLT_ADD_NAME_TEXT'
                 ,'CLT_ADR_RELATION'
                 ,'BUSINESS_CLIENT'
                 ,'CLIENT_ADDRESS'
                 ,'CLIENT_BILLING'
                 ,'CLT_CONTACT_INFO'
                 ,'CLIENT_TAB'
                 ,'CLIENT_CLAIM'
                 ,'CLT_CLT_RELATION')
GROUP BY CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4),
       A.DBNAME,C.JOBNAME,C.ICTYPE;
--
--
--
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       A.DBNAME,A.NAME AS TSNAME,
       B.CREATOR,B.NAME,B.TYPE,
       C.JOBNAME,
       CASE C.ICTYPE
            WHEN 'I' THEN 'COPY'
            WHEN 'F' THEN 'COPY'
            WHEN 'M' THEN 'MODIFY'
            WHEN 'Q' THEN 'QUIESCE'
            WHEN 'R' THEN 'LOAD REPLACE'
            WHEN 'S' THEN 'LOAD REPLACE'
            WHEN 'W' THEN 'REORG'
            WHEN 'X' THEN 'REORG'
            WHEN 'Y' THEN 'LOAD RESUME'
            WHEN 'Z' THEN 'LOAD RESUME'
       END AS JOBTYPE
  FROM SYSIBM.SYSTABLESPACE A,
       SYSIBM.SYSTABLES     B,
       SYSIBM.SYSCOPY   C
 WHERE A.DBNAME = C.DBNAME
   AND A.NAME = C.TSNAME
   AND C.ICTYPE IN ('F')
-- AND C.ICTYPE IN ('I','F','M','Q','R','S','W','X','Y','Z')
   AND SUBSTR(C.JOBNAME,1,3) NOT IN ('IBM')
-- AND B.TYPE = 'T'
   AND B.DBNAME = A.DBNAME
   AND B.TSNAME = A.NAME
   AND B.CREATOR IN ('DB2PRVT', 'DB2PRV2')
   AND B.NAME IN ('CLIENT_ADDRESS'
                 ,'CLIENT_ADDRESS_V'
                 ,'CLIENT_BILLING'
                 ,'CLIENT_CLAIM'
                 ,'CLIENT_CROSS_REF'
                 ,'CLIENT_HELP'
                 ,'CLIENT_KEYS'
                 ,'CLIENT_LICENSE'
                 ,'CLIENT_MENU'
                 ,'CLIENT_PHONE'
                 ,'CLIENT_POLICY'
                 ,'CLIENT_POLICY_V'
                 ,'CLIENT_SUMMARY'
                 ,'CLIENT_TAB'
                 ,'CLIENT_TAB_V'
                 ,'CLIENT_TAX'
                 ,'CLIENT_UCT'
                 ,'CLT_ADD_ADR_TEXT'
                 ,'CLT_ADD_NAME_TEXT'
                 ,'CLT_ADR_RELATION'
                 ,'CLT_ADR_RELATION_V'
                 ,'CLT_ADR_SEARCH'
                 ,'CLT_CLT_RELATION'
                 ,'CLT_CLT_VLD_REL'
                 ,'CLT_CONTACT_INFO'
                 ,'CLT_OBJ_RELATION'
                 ,'CLT_OBJ_RELATION_V'
                 ,'CLT_OTHER_OBJECTS'
                 ,'CLT_OWNING_SYSTE_V'
                 ,'CLT_OWNING_SYSTEM'
                 ,'CLT_REF_RELATION'
                 ,'CLT_TABLE_ID_GEN'
                 ,'CLT_TEMPLATE'
                 ,'CDI_DB_DUNBRAD'
                 ,'CDI_PA_PARR'
                 ,'CDI_SN_DBSCRUB'
                 ,'CLT_TABLE_ID_GEN'
                 ,'CLT_ADD_ADR_TEXT'
                 ,'CLT_ADD_NAME_TEXT'
                 ,'CLT_ADR_RELATION'
                 ,'BUSINESS_CLIENT'
                 ,'CLIENT_ADDRESS'
                 ,'CLIENT_BILLING'
                 ,'CLT_CONTACT_INFO'
                 ,'CLIENT_TAB'
                 ,'CLIENT_CLAIM'
                 ,'CLT_CLT_RELATION')
GROUP BY CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4),
       A.DBNAME, A.NAME,
       B.CREATOR,B.NAME,B.TYPE,
       C.JOBNAME,C.ICTYPE;
