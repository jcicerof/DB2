--
-- REVOKE ACCESS
-- REVOKE ALL ON CREATOR.NAME FROM USERID BY ALL;
--
SELECT DISTINCT
CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID ,
'REVOKE ALL ON '||STRIP(T.CREATOR)||'.'||STRIP(TA.TTNAME)||
' FROM '||STRIP(TA.GRANTEE)||' BY ALL;'
  FROM SYSIBM.SYSTABLES T,
       SYSIBM.SYSTABAUTH TA
 WHERE T.CREATOR = TA.TCREATOR
   AND T.NAME = TA.TTNAME
   AND T.TYPE = 'T'
   AND TA.GRANTEE <> T.CREATOR
   AND TA.GRANTEETYPE = ' '
-- AND 'G' IN (TA.DELETEAUTH,TA.INSERTAUTH,TA.UPDATEAUTH,TA.SELECTAUTH)
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
   'PERPROD.PUTT_COMMON',
   'PERPROD.PUTT_COMMON_CHG',
   'PERPROD.PUTT_COMPANY',
   'PERPROD.PUTT_COUNTSGN',
   'PERPROD.PUTT_COVERAGE',
   'PERPROD.PUTT_CYCLE',
   'PERPROD.PUTT_ERQK',
   'PERPROD.PUTT_ERQK_CHG',
   'PERPROD.PUTT_FORM',
   'PERPROD.PUTT_FORM_CHG',
   'PERPROD.PUTT_MINES',
   'PERPROD.PUTT_MINES_CHG',
   'PERPROD.PUTT_POLFORM',
   'PERPROD.PUTT_PRODSELN',
   'PERPROD.PUTT_PRODSELN_CHG',
   'PERPROD.PUTT_PRODUCTS',
   'PERPROD.PUTT_PRODUCTS_CHG',
   'PERPROD.PUTT_PROJECT_ID',
   'PERPROD.PUTT_RECP',
   'PERPROD.PUTT_RECP_CHG',
   'PERPROD.PUTT_SPP',
   'PERPROD.PUTT_SPP_CHG',
   'PERPROD.PUTT_STATE',
   'PERPROD.PUTT_UFORMS',
   'PERPROD.PUTT_UFORMS_CHG',
   'PERPROD.PUTT_USERID',
   'PERPROD.PUTT_WEX',
   'PERPROD.PUTT_WEX_CHG',
   'PERPROD.PUTT_WHDED',
   'PERPROD.PUTT_WHDED_CHG')
;
--
-- LISTA JOBS NA SYSCOPY
--

SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       JOBNAME,C.ICTYPE
  FROM SYSIBM.SYSTABLES T,
       SYSIBM.SYSCOPY C
 WHERE T.DBNAME = C.DBNAME
   AND T.TSNAME = C.TSNAME
   AND C.ICTYPE IN ('F', 'Q')
   AND T.TYPE = 'T'
   AND C.TIMESTAMP >= CURRENT TIMESTAMP - 45 DAYS
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
   'PERPROD.PUTT_COMMON',
   'PERPROD.PUTT_COMMON_CHG',
   'PERPROD.PUTT_COMPANY',
   'PERPROD.PUTT_COUNTSGN',
   'PERPROD.PUTT_COVERAGE',
   'PERPROD.PUTT_CYCLE',
   'PERPROD.PUTT_ERQK',
   'PERPROD.PUTT_ERQK_CHG',
   'PERPROD.PUTT_FORM',
   'PERPROD.PUTT_FORM_CHG',
   'PERPROD.PUTT_MINES',
   'PERPROD.PUTT_MINES_CHG',
   'PERPROD.PUTT_POLFORM',
   'PERPROD.PUTT_PRODSELN',
   'PERPROD.PUTT_PRODSELN_CHG',
   'PERPROD.PUTT_PRODUCTS',
   'PERPROD.PUTT_PRODUCTS_CHG',
   'PERPROD.PUTT_PROJECT_ID',
   'PERPROD.PUTT_RECP',
   'PERPROD.PUTT_RECP_CHG',
   'PERPROD.PUTT_SPP',
   'PERPROD.PUTT_SPP_CHG',
   'PERPROD.PUTT_STATE',
   'PERPROD.PUTT_UFORMS',
   'PERPROD.PUTT_UFORMS_CHG',
   'PERPROD.PUTT_USERID',
   'PERPROD.PUTT_WEX',
   'PERPROD.PUTT_WEX_CHG',
   'PERPROD.PUTT_WHDED',
   'PERPROD.PUTT_WHDED_CHG')
;
--
-- STOP TS E IX
--

SELECT DISTINCT
CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID ,S.NTABLES,
'-STOP DB('||STRIP(T.DBNAME)||') SP('||STRIP(T.TSNAME)||')'
-- ||'  --'||STRIP(T.CREATOR)||'.'||STRIP(T.NAME)
  FROM SYSIBM.SYSTABLES T,
       SYSIBM.SYSTABLESPACE S
 WHERE T.DBNAME = S.DBNAME
   AND T.TSNAME = S.NAME
   AND T.TYPE = 'T'
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
   'PERPROD.PUTT_COMMON',
   'PERPROD.PUTT_COMMON_CHG',
   'PERPROD.PUTT_COMPANY',
   'PERPROD.PUTT_COUNTSGN',
   'PERPROD.PUTT_COVERAGE',
   'PERPROD.PUTT_CYCLE',
   'PERPROD.PUTT_ERQK',
   'PERPROD.PUTT_ERQK_CHG',
   'PERPROD.PUTT_FORM',
   'PERPROD.PUTT_FORM_CHG',
   'PERPROD.PUTT_MINES',
   'PERPROD.PUTT_MINES_CHG',
   'PERPROD.PUTT_POLFORM',
   'PERPROD.PUTT_PRODSELN',
   'PERPROD.PUTT_PRODSELN_CHG',
   'PERPROD.PUTT_PRODUCTS',
   'PERPROD.PUTT_PRODUCTS_CHG',
   'PERPROD.PUTT_PROJECT_ID',
   'PERPROD.PUTT_RECP',
   'PERPROD.PUTT_RECP_CHG',
   'PERPROD.PUTT_SPP',
   'PERPROD.PUTT_SPP_CHG',
   'PERPROD.PUTT_STATE',
   'PERPROD.PUTT_UFORMS',
   'PERPROD.PUTT_UFORMS_CHG',
   'PERPROD.PUTT_USERID',
   'PERPROD.PUTT_WEX',
   'PERPROD.PUTT_WEX_CHG',
   'PERPROD.PUTT_WHDED',
   'PERPROD.PUTT_WHDED_CHG')
;
SELECT DISTINCT
CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
'-STOP DB('||STRIP(I.DBNAME)||') SP('||STRIP(I.INDEXSPACE)||')'
--||'  --'||STRIP(T.CREATOR)||'.'||STRIP(T.NAME)
  FROM SYSIBM.SYSTABLES T,
       SYSIBM.SYSINDEXES I
 WHERE T.CREATOR = I.TBCREATOR
   AND T.NAME = I.TBNAME
   AND T.TYPE = 'T'
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
   'PERPROD.PUTT_COMMON',
   'PERPROD.PUTT_COMMON_CHG',
   'PERPROD.PUTT_COMPANY',
   'PERPROD.PUTT_COUNTSGN',
   'PERPROD.PUTT_COVERAGE',
   'PERPROD.PUTT_CYCLE',
   'PERPROD.PUTT_ERQK',
   'PERPROD.PUTT_ERQK_CHG',
   'PERPROD.PUTT_FORM',
   'PERPROD.PUTT_FORM_CHG',
   'PERPROD.PUTT_MINES',
   'PERPROD.PUTT_MINES_CHG',
   'PERPROD.PUTT_POLFORM',
   'PERPROD.PUTT_PRODSELN',
   'PERPROD.PUTT_PRODSELN_CHG',
   'PERPROD.PUTT_PRODUCTS',
   'PERPROD.PUTT_PRODUCTS_CHG',
   'PERPROD.PUTT_PROJECT_ID',
   'PERPROD.PUTT_RECP',
   'PERPROD.PUTT_RECP_CHG',
   'PERPROD.PUTT_SPP',
   'PERPROD.PUTT_SPP_CHG',
   'PERPROD.PUTT_STATE',
   'PERPROD.PUTT_UFORMS',
   'PERPROD.PUTT_UFORMS_CHG',
   'PERPROD.PUTT_USERID',
   'PERPROD.PUTT_WEX',
   'PERPROD.PUTT_WEX_CHG',
   'PERPROD.PUTT_WHDED',
   'PERPROD.PUTT_WHDED_CHG')
;

--
-- GENERATE INCLUDES
--
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       'INCLUDE TABLESPACE '||
       STRIP(T.DBNAME)||'.'||STRIP(T.TSNAME)||
       ' -- '||STRIP(T.CREATOR)||'.'||STRIP(T.NAME),
       S.NTABLES,T.TYPE
  FROM SYSIBM.SYSTABLES T,
       SYSIBM.SYSTABLESPACE S
 WHERE T.DBNAME = S.DBNAME
   AND T.TSNAME = S.NAME
   AND T.TYPE IN ('T','A','V')
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
   'PERPROD.PUTT_COMMON',
   'PERPROD.PUTT_COMMON_CHG',
   'PERPROD.PUTT_COMPANY',
   'PERPROD.PUTT_COUNTSGN',
   'PERPROD.PUTT_COVERAGE',
   'PERPROD.PUTT_CYCLE',
   'PERPROD.PUTT_ERQK',
   'PERPROD.PUTT_ERQK_CHG',
   'PERPROD.PUTT_FORM',
   'PERPROD.PUTT_FORM_CHG',
   'PERPROD.PUTT_MINES',
   'PERPROD.PUTT_MINES_CHG',
   'PERPROD.PUTT_POLFORM',
   'PERPROD.PUTT_PRODSELN',
   'PERPROD.PUTT_PRODSELN_CHG',
   'PERPROD.PUTT_PRODUCTS',
   'PERPROD.PUTT_PRODUCTS_CHG',
   'PERPROD.PUTT_PROJECT_ID',
   'PERPROD.PUTT_RECP',
   'PERPROD.PUTT_RECP_CHG',
   'PERPROD.PUTT_SPP',
   'PERPROD.PUTT_SPP_CHG',
   'PERPROD.PUTT_STATE',
   'PERPROD.PUTT_UFORMS',
   'PERPROD.PUTT_UFORMS_CHG',
   'PERPROD.PUTT_USERID',
   'PERPROD.PUTT_WEX',
   'PERPROD.PUTT_WEX_CHG',
   'PERPROD.PUTT_WHDED',
   'PERPROD.PUTT_WHDED_CHG')
ORDER BY T.TYPE
;

--
-- GEN TS
--
--DB='DQST0B00', TS='SCCS0B00';
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       'DB='||''''||
       STRIP(T.DBNAME)||''''||', TS='||''''||
       STRIP(T.TSNAME)||''''||';'
  FROM SYSIBM.SYSTABLES T,
       SYSIBM.SYSTABLESPACE S
 WHERE T.DBNAME = S.DBNAME
   AND T.TSNAME = S.NAME
   AND T.TYPE = 'T'
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
   'PERPROD.PUTT_COMMON',
   'PERPROD.PUTT_COMMON_CHG',
   'PERPROD.PUTT_COMPANY',
   'PERPROD.PUTT_COUNTSGN',
   'PERPROD.PUTT_COVERAGE',
   'PERPROD.PUTT_CYCLE',
   'PERPROD.PUTT_ERQK',
   'PERPROD.PUTT_ERQK_CHG',
   'PERPROD.PUTT_FORM',
   'PERPROD.PUTT_FORM_CHG',
   'PERPROD.PUTT_MINES',
   'PERPROD.PUTT_MINES_CHG',
   'PERPROD.PUTT_POLFORM',
   'PERPROD.PUTT_PRODSELN',
   'PERPROD.PUTT_PRODSELN_CHG',
   'PERPROD.PUTT_PRODUCTS',
   'PERPROD.PUTT_PRODUCTS_CHG',
   'PERPROD.PUTT_PROJECT_ID',
   'PERPROD.PUTT_RECP',
   'PERPROD.PUTT_RECP_CHG',
   'PERPROD.PUTT_SPP',
   'PERPROD.PUTT_SPP_CHG',
   'PERPROD.PUTT_STATE',
   'PERPROD.PUTT_UFORMS',
   'PERPROD.PUTT_UFORMS_CHG',
   'PERPROD.PUTT_USERID',
   'PERPROD.PUTT_WEX',
   'PERPROD.PUTT_WEX_CHG',
   'PERPROD.PUTT_WHDED',
   'PERPROD.PUTT_WHDED_CHG')
;

--
-- GEN TABLE
--
--OWN='DB2ACP2',TB='CLUB_MEM_INFO';
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       'OWN='||''''||
       STRIP(T.CREATOR)||''''||',TB='||''''||
       STRIP(T.NAME)||''''||';'
  FROM SYSIBM.SYSTABLES T,
       SYSIBM.SYSTABLESPACE S
 WHERE T.DBNAME = S.DBNAME
   AND T.TSNAME = S.NAME
   AND T.TYPE = 'T'
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
   'PERPROD.PUTT_COMMON',
   'PERPROD.PUTT_COMMON_CHG',
   'PERPROD.PUTT_COMPANY',
   'PERPROD.PUTT_COUNTSGN',
   'PERPROD.PUTT_COVERAGE',
   'PERPROD.PUTT_CYCLE',
   'PERPROD.PUTT_ERQK',
   'PERPROD.PUTT_ERQK_CHG',
   'PERPROD.PUTT_FORM',
   'PERPROD.PUTT_FORM_CHG',
   'PERPROD.PUTT_MINES',
   'PERPROD.PUTT_MINES_CHG',
   'PERPROD.PUTT_POLFORM',
   'PERPROD.PUTT_PRODSELN',
   'PERPROD.PUTT_PRODSELN_CHG',
   'PERPROD.PUTT_PRODUCTS',
   'PERPROD.PUTT_PRODUCTS_CHG',
   'PERPROD.PUTT_PROJECT_ID',
   'PERPROD.PUTT_RECP',
   'PERPROD.PUTT_RECP_CHG',
   'PERPROD.PUTT_SPP',
   'PERPROD.PUTT_SPP_CHG',
   'PERPROD.PUTT_STATE',
   'PERPROD.PUTT_UFORMS',
   'PERPROD.PUTT_UFORMS_CHG',
   'PERPROD.PUTT_USERID',
   'PERPROD.PUTT_WEX',
   'PERPROD.PUTT_WEX_CHG',
   'PERPROD.PUTT_WHDED',
   'PERPROD.PUTT_WHDED_CHG')
;

--
-- DROP TABLESPACE
--

SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
'DROP TABLESPACE '||STRIP(T.DBNAME)||'.'||STRIP(T.TSNAME)||
'; -- '||STRIP(T.CREATOR)||'.'||STRIP(T.NAME)
  FROM SYSIBM.SYSTABLES T
 WHERE T.TYPE = 'T'
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
   'PERPROD.PUTT_COMMON',
   'PERPROD.PUTT_COMMON_CHG',
   'PERPROD.PUTT_COMPANY',
   'PERPROD.PUTT_COUNTSGN',
   'PERPROD.PUTT_COVERAGE',
   'PERPROD.PUTT_CYCLE',
   'PERPROD.PUTT_ERQK',
   'PERPROD.PUTT_ERQK_CHG',
   'PERPROD.PUTT_FORM',
   'PERPROD.PUTT_FORM_CHG',
   'PERPROD.PUTT_MINES',
   'PERPROD.PUTT_MINES_CHG',
   'PERPROD.PUTT_POLFORM',
   'PERPROD.PUTT_PRODSELN',
   'PERPROD.PUTT_PRODSELN_CHG',
   'PERPROD.PUTT_PRODUCTS',
   'PERPROD.PUTT_PRODUCTS_CHG',
   'PERPROD.PUTT_PROJECT_ID',
   'PERPROD.PUTT_RECP',
   'PERPROD.PUTT_RECP_CHG',
   'PERPROD.PUTT_SPP',
   'PERPROD.PUTT_SPP_CHG',
   'PERPROD.PUTT_STATE',
   'PERPROD.PUTT_UFORMS',
   'PERPROD.PUTT_UFORMS_CHG',
   'PERPROD.PUTT_USERID',
   'PERPROD.PUTT_WEX',
   'PERPROD.PUTT_WEX_CHG',
   'PERPROD.PUTT_WHDED',
   'PERPROD.PUTT_WHDED_CHG')
;

--
-- DROP TABLE
--

SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
'DROP TABLE '||STRIP(T.CREATOR)||'.'||STRIP(T.NAME)||
'; -- '||STRIP(T.CREATOR)||'.'||STRIP(T.NAME)
  FROM SYSIBM.SYSTABLES T
 WHERE T.TYPE = 'T'
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
   'PERPROD.PUTT_COMMON',
   'PERPROD.PUTT_COMMON_CHG',
   'PERPROD.PUTT_COMPANY',
   'PERPROD.PUTT_COUNTSGN',
   'PERPROD.PUTT_COVERAGE',
   'PERPROD.PUTT_CYCLE',
   'PERPROD.PUTT_ERQK',
   'PERPROD.PUTT_ERQK_CHG',
   'PERPROD.PUTT_FORM',
   'PERPROD.PUTT_FORM_CHG',
   'PERPROD.PUTT_MINES',
   'PERPROD.PUTT_MINES_CHG',
   'PERPROD.PUTT_POLFORM',
   'PERPROD.PUTT_PRODSELN',
   'PERPROD.PUTT_PRODSELN_CHG',
   'PERPROD.PUTT_PRODUCTS',
   'PERPROD.PUTT_PRODUCTS_CHG',
   'PERPROD.PUTT_PROJECT_ID',
   'PERPROD.PUTT_RECP',
   'PERPROD.PUTT_RECP_CHG',
   'PERPROD.PUTT_SPP',
   'PERPROD.PUTT_SPP_CHG',
   'PERPROD.PUTT_STATE',
   'PERPROD.PUTT_UFORMS',
   'PERPROD.PUTT_UFORMS_CHG',
   'PERPROD.PUTT_USERID',
   'PERPROD.PUTT_WEX',
   'PERPROD.PUTT_WEX_CHG',
   'PERPROD.PUTT_WHDED',
   'PERPROD.PUTT_WHDED_CHG')
;

--
-- DISTINCT DATABASES - CHECK EMPTY DATABASES
--

SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
T.DBNAME
  FROM SYSIBM.SYSTABLES T
 WHERE T.TYPE = 'T'
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
   'PERPROD.PUTT_COMMON',
   'PERPROD.PUTT_COMMON_CHG',
   'PERPROD.PUTT_COMPANY',
   'PERPROD.PUTT_COUNTSGN',
   'PERPROD.PUTT_COVERAGE',
   'PERPROD.PUTT_CYCLE',
   'PERPROD.PUTT_ERQK',
   'PERPROD.PUTT_ERQK_CHG',
   'PERPROD.PUTT_FORM',
   'PERPROD.PUTT_FORM_CHG',
   'PERPROD.PUTT_MINES',
   'PERPROD.PUTT_MINES_CHG',
   'PERPROD.PUTT_POLFORM',
   'PERPROD.PUTT_PRODSELN',
   'PERPROD.PUTT_PRODSELN_CHG',
   'PERPROD.PUTT_PRODUCTS',
   'PERPROD.PUTT_PRODUCTS_CHG',
   'PERPROD.PUTT_PROJECT_ID',
   'PERPROD.PUTT_RECP',
   'PERPROD.PUTT_RECP_CHG',
   'PERPROD.PUTT_SPP',
   'PERPROD.PUTT_SPP_CHG',
   'PERPROD.PUTT_STATE',
   'PERPROD.PUTT_UFORMS',
   'PERPROD.PUTT_UFORMS_CHG',
   'PERPROD.PUTT_USERID',
   'PERPROD.PUTT_WEX',
   'PERPROD.PUTT_WEX_CHG',
   'PERPROD.PUTT_WHDED',
   'PERPROD.PUTT_WHDED_CHG')
;
--
-- FREE PACKAGE
--
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       'FREE PACKAGE ('||STRIP(COLLID)||'.'||STRIP(NAME)||')'
  FROM SYSIBM.SYSPACKAGE
WHERE STRIP(COLLID)||'.'||STRIP(NAME) IN (
'PERP_PUT.PUTPFDTU',
'PERP_PUT.PUTRMNDT',
'PERP_PUT.PUTTDCOV',
'PERP_PUT.PUTTFCOV',
'PERP_PUT.PUTTFCSN',
'PERP_PUT.PUTTFEFP',
'PERP_PUT.PUTTMCOV',
'PERP_PUT.PUTTPROD',
'PERP_PUT.PUTTRECP',
'PERP_PUT.PUTTSCOV',
'PERP_PUT.PUTTUFRM',
'PUTP_FDT.PUTTCOMM',
'PUTP_FDT.PUTTCRCE',
'PUTP_FDT.PUTTCREQ',
'PUTP_FDT.PUTTCRFR',
'PUTP_FDT.PUTTCRMN',
'PUTP_FDT.PUTTCRPI',
'PUTP_FDT.PUTTCRPR',
'PUTP_FDT.PUTTCRPS',
'PUTP_FDT.PUTTCRSV',
'PUTP_FDT.PUTTCRUF',
'PUTP_FDT.PUTTCRWD',
'PUTP_FDT.PUTTCRWX',
'PUTP_FDT.PUTTPMOV',
'PUTP_FDT.PUTTRPJ1',
'PUTP_FDT.PUTTTCM1',
'PUTP_FDT.PUTTTCV1',
'PUTP_FDT.PUTTTEQ1',
'PUTP_FDT.PUTTTFR1',
'PUTP_FDT.PUTTTHP1',
'PUTP_FDT.PUTTTMI1',
'PUTP_FDT.PUTTTPF1',
'PUTP_FDT.PUTTTPG1',
'PUTP_FDT.PUTTTPJ1',
'PUTP_FDT.PUTTTPR1',
'PUTP_FDT.PUTTTPS1',
'PUTP_FDT.PUTTTRC1',
'PUTP_FDT.PUTTTRS1',
'PUTP_FDT.PUTTTST1',
'PUTP_FDT.PUTTTUF1',
'PUTP_FDT.PUTTTUI1',
'PUTP_FDT.PUTTTWH1',
'PUTP_FDT.PUTTTWX1',
'PUTP_FDT.PUTTUPLD',
'KLUE_AUTO.KLURAMTA',
'POLP_MASS_AUTO.KLUTCLMA')
;


--
-- FREE PLAN
--
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       'FREE PLAN ('||STRIP(NAME)||')'
  FROM SYSIBM.SYSPLAN
WHERE STRIP(CREATOR)||'.'||STRIP(NAME)  IN (
'PERPROD.PUTPEFPP',
'PERPROD.PUTPFCOV',
'PERPROD.PUTPFDTR',
'PERPROD.PUTPFDTU',
'PERPROD.PUTPFMRP',
'PERPROD.PUTPFVRP',
'PERPROD.PUTPREPT',
'PERPROD.PUTPSCOV',
'PERPROD.PUTPUPLD',
'PERPROD.KLUPAMTA',
'PERPROD.KLUPSELA')
;

