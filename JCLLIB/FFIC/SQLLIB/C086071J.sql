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
-- AND T.CREATOR IN ('DB2ACPT','DB2ACP2','DB2ACP4','DB2TEST',
--               'DB2TES1','DB2PRVT','DB2PRV2','DB2CERT','DB2TES2')
-- AND T.NAME IN (
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
'DB2ACPT.POLZ_COVERAGE',
'DB2ACPT.POLZ_ENDORSEMENT',
'DB2ACPT.POLZ_FINANC_RESP',
'DB2ACPT.POLZ_INT_PARTY',
'DB2ACPT.POLZ_INT_PRTY_NAME',
'DB2ACPT.POLZ_OOST_VIOL',
'DB2ACPT.POLZ_OPERATOR',
'DB2ACPT.POLZ_POLICY',
'DB2ACPT.POLZ_PREMIUM',
'DB2ACPT.POLZ_PREMIUM2',
'DB2ACPT.POLZ_TRANSACTION',
'DB2ACPT.POLZ_VEHICLE',
'DB2ACPT.POLZ_VIOLATION',
'TESTVOL.POLZ_DUMMY_ROOT')
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
-- AND T.CREATOR IN ('DB2ACPT','DB2ACP2','DB2ACP4','DB2TEST',
--               'DB2TES1','DB2PRVT','DB2PRV2','DB2CERT','DB2TES2')
-- AND T.NAME IN (
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
'DB2ACPT.POLZ_COVERAGE',
'DB2ACPT.POLZ_ENDORSEMENT',
'DB2ACPT.POLZ_FINANC_RESP',
'DB2ACPT.POLZ_INT_PARTY',
'DB2ACPT.POLZ_INT_PRTY_NAME',
'DB2ACPT.POLZ_OOST_VIOL',
'DB2ACPT.POLZ_OPERATOR',
'DB2ACPT.POLZ_POLICY',
'DB2ACPT.POLZ_PREMIUM',
'DB2ACPT.POLZ_PREMIUM2',
'DB2ACPT.POLZ_TRANSACTION',
'DB2ACPT.POLZ_VEHICLE',
'DB2ACPT.POLZ_VIOLATION',
'TESTVOL.POLZ_DUMMY_ROOT')
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
-- AND T.CREATOR IN (....)
-- AND T.NAME IN (....)
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
'DB2ACPT.POLZ_COVERAGE',
'DB2ACPT.POLZ_ENDORSEMENT',
'DB2ACPT.POLZ_FINANC_RESP',
'DB2ACPT.POLZ_INT_PARTY',
'DB2ACPT.POLZ_INT_PRTY_NAME',
'DB2ACPT.POLZ_OOST_VIOL',
'DB2ACPT.POLZ_OPERATOR',
'DB2ACPT.POLZ_POLICY',
'DB2ACPT.POLZ_PREMIUM',
'DB2ACPT.POLZ_PREMIUM2',
'DB2ACPT.POLZ_TRANSACTION',
'DB2ACPT.POLZ_VEHICLE',
'DB2ACPT.POLZ_VIOLATION',
'TESTVOL.POLZ_DUMMY_ROOT')
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
-- AND T.CREATOR IN (....)
-- AND T.NAME IN (....)
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
'DB2ACPT.POLZ_COVERAGE',
'DB2ACPT.POLZ_ENDORSEMENT',
'DB2ACPT.POLZ_FINANC_RESP',
'DB2ACPT.POLZ_INT_PARTY',
'DB2ACPT.POLZ_INT_PRTY_NAME',
'DB2ACPT.POLZ_OOST_VIOL',
'DB2ACPT.POLZ_OPERATOR',
'DB2ACPT.POLZ_POLICY',
'DB2ACPT.POLZ_PREMIUM',
'DB2ACPT.POLZ_PREMIUM2',
'DB2ACPT.POLZ_TRANSACTION',
'DB2ACPT.POLZ_VEHICLE',
'DB2ACPT.POLZ_VIOLATION',
'TESTVOL.POLZ_DUMMY_ROOT')
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
-- AND T.CREATOR IN (....)
-- AND T.NAME IN (....)
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
'DB2ACPT.POLZ_COVERAGE',
'DB2ACPT.POLZ_ENDORSEMENT',
'DB2ACPT.POLZ_FINANC_RESP',
'DB2ACPT.POLZ_INT_PARTY',
'DB2ACPT.POLZ_INT_PRTY_NAME',
'DB2ACPT.POLZ_OOST_VIOL',
'DB2ACPT.POLZ_OPERATOR',
'DB2ACPT.POLZ_POLICY',
'DB2ACPT.POLZ_PREMIUM',
'DB2ACPT.POLZ_PREMIUM2',
'DB2ACPT.POLZ_TRANSACTION',
'DB2ACPT.POLZ_VEHICLE',
'DB2ACPT.POLZ_VIOLATION',
'TESTVOL.POLZ_DUMMY_ROOT')
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
-- AND T.CREATOR IN (....)
-- AND T.NAME IN (....)
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
'DB2ACPT.POLZ_COVERAGE',
'DB2ACPT.POLZ_ENDORSEMENT',
'DB2ACPT.POLZ_FINANC_RESP',
'DB2ACPT.POLZ_INT_PARTY',
'DB2ACPT.POLZ_INT_PRTY_NAME',
'DB2ACPT.POLZ_OOST_VIOL',
'DB2ACPT.POLZ_OPERATOR',
'DB2ACPT.POLZ_POLICY',
'DB2ACPT.POLZ_PREMIUM',
'DB2ACPT.POLZ_PREMIUM2',
'DB2ACPT.POLZ_TRANSACTION',
'DB2ACPT.POLZ_VEHICLE',
'DB2ACPT.POLZ_VIOLATION',
'TESTVOL.POLZ_DUMMY_ROOT')
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
-- AND T.CREATOR IN (....)
-- AND T.NAME IN (....)
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
'DB2ACPT.POLZ_COVERAGE',
'DB2ACPT.POLZ_ENDORSEMENT',
'DB2ACPT.POLZ_FINANC_RESP',
'DB2ACPT.POLZ_INT_PARTY',
'DB2ACPT.POLZ_INT_PRTY_NAME',
'DB2ACPT.POLZ_OOST_VIOL',
'DB2ACPT.POLZ_OPERATOR',
'DB2ACPT.POLZ_POLICY',
'DB2ACPT.POLZ_PREMIUM',
'DB2ACPT.POLZ_PREMIUM2',
'DB2ACPT.POLZ_TRANSACTION',
'DB2ACPT.POLZ_VEHICLE',
'DB2ACPT.POLZ_VIOLATION',
'TESTVOL.POLZ_DUMMY_ROOT')
;

--
-- DROP TABLESPACE
--

SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
'DROP TABLESPACE '||STRIP(T.DBNAME)||'.'||STRIP(T.TSNAME)||
'; -- '||STRIP(T.CREATOR)||'.'||STRIP(T.NAME)
  FROM SYSIBM.SYSTABLES T
 WHERE T.TYPE = 'T'
-- AND T.CREATOR IN (....)
-- AND T.NAME IN (....)
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
'DB2ACPT.POLZ_COVERAGE',
'DB2ACPT.POLZ_ENDORSEMENT',
'DB2ACPT.POLZ_FINANC_RESP',
'DB2ACPT.POLZ_INT_PARTY',
'DB2ACPT.POLZ_INT_PRTY_NAME',
'DB2ACPT.POLZ_OOST_VIOL',
'DB2ACPT.POLZ_OPERATOR',
'DB2ACPT.POLZ_POLICY',
'DB2ACPT.POLZ_PREMIUM',
'DB2ACPT.POLZ_PREMIUM2',
'DB2ACPT.POLZ_TRANSACTION',
'DB2ACPT.POLZ_VEHICLE',
'DB2ACPT.POLZ_VIOLATION',
'TESTVOL.POLZ_DUMMY_ROOT')
;

--
-- DROP TABLE
--

SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
'DROP TABLE '||STRIP(T.CREATOR)||'.'||STRIP(T.NAME)||
'; -- '||STRIP(T.CREATOR)||'.'||STRIP(T.NAME)
  FROM SYSIBM.SYSTABLES T
 WHERE T.TYPE = 'T'
-- AND T.CREATOR IN (....)
-- AND T.NAME IN (....)
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
'DB2ACPT.POLZ_COVERAGE',
'DB2ACPT.POLZ_ENDORSEMENT',
'DB2ACPT.POLZ_FINANC_RESP',
'DB2ACPT.POLZ_INT_PARTY',
'DB2ACPT.POLZ_INT_PRTY_NAME',
'DB2ACPT.POLZ_OOST_VIOL',
'DB2ACPT.POLZ_OPERATOR',
'DB2ACPT.POLZ_POLICY',
'DB2ACPT.POLZ_PREMIUM',
'DB2ACPT.POLZ_PREMIUM2',
'DB2ACPT.POLZ_TRANSACTION',
'DB2ACPT.POLZ_VEHICLE',
'DB2ACPT.POLZ_VIOLATION',
'TESTVOL.POLZ_DUMMY_ROOT')
;

--
-- DISTINCT DATABASES - CHECK EMPTY DATABASES
--

SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
T.DBNAME
  FROM SYSIBM.SYSTABLES T
 WHERE T.TYPE = 'T'
-- AND T.CREATOR IN (....)
-- AND T.NAME IN (....)
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
'DB2ACPT.POLZ_COVERAGE',
'DB2ACPT.POLZ_ENDORSEMENT',
'DB2ACPT.POLZ_FINANC_RESP',
'DB2ACPT.POLZ_INT_PARTY',
'DB2ACPT.POLZ_INT_PRTY_NAME',
'DB2ACPT.POLZ_OOST_VIOL',
'DB2ACPT.POLZ_OPERATOR',
'DB2ACPT.POLZ_POLICY',
'DB2ACPT.POLZ_PREMIUM',
'DB2ACPT.POLZ_PREMIUM2',
'DB2ACPT.POLZ_TRANSACTION',
'DB2ACPT.POLZ_VEHICLE',
'DB2ACPT.POLZ_VIOLATION',
'TESTVOL.POLZ_DUMMY_ROOT')
;
--
-- NAO FOI SOLICITADO REMOCAO DE PLANS E PACKAGES
--

--
-- FREE PACKAGE
--
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       'FREE PACKAGE ('||STRIP(COLLID)||'.'||STRIP(NAME)||')'
  FROM SYSIBM.SYSPACKAGE
WHERE STRIP(COLLID)||'.'||STRIP(NAME) IN (
'PERP_AUTO.PIPPCSU0',
'PERP_AUTO.PIPTVLKX',
'PERP_AUTOENTRY.PIPRFORM',
'PERP_CSU_PROD_INQ.PIPTF110',
'PERP_DBIO.PIPTF110',
'POLP_AUTOONLINE.PIPT8M05',
'POLP_AUTOONLINE.PIPT9M21',
'PERP_AESIO.PERP2000',
'PERP_COVVER.PERTCNTR',
'PERP_COVVER.PERTCOVC',
'PERP_COVVER.PERTDESC',
'PERP_COVVER.PERTFERI',
'PERP_COVVER.PERTMNDT',
'PERP_DBIO.PERTIOD1',
'PERP_DBIO.PERTIOG3',
'PERP_WM.PERP803D',
'PERP_WM.PERT2110',
'PERP_WM.PERTWMGT',
'POLP_AUTOONLIN.POLT2011',
'POLP_AUTOONLINE.POLT1210',
'POLP_AUTOONLINE.POLT2011',
'POLP_AUTOONLINE.POLT2021',
'PERP_DBIO.UDTRR510',
'PERP_HOME.UDTPACON',
'PERP_HOME.UDTPB100',
'PERP_HOME.UDTPCNVS',
'PERP_HOME.UDTPCOVA',
'PERP_HOME.UDTPCSAR',
'PERP_HOME.UDTPD410',
'PERP_HOME.UDTPD411',
'PERP_HOME.UDTPD412',
'PERP_HOME.UDTPD420',
'PERP_HOME.UDTPD500',
'PERP_HOME.UDTPD600',
'PERP_HOME.UDTPD700',
'PERP_HOME.UDTPE140',
'PERP_HOME.UDTPERRR',
'PERP_HOME.UDTPFFWI',
'PERP_HOME.UDTPH300',
'PERP_HOME.UDTPLOCU',
'PERP_HOME.UDTPM600',
'PERP_HOME.UDTPO200',
'PERP_HOME.UDTPPCC',
'PERP_HOME.UDTPR240',
'PERP_HOME.UDTPR310',
'PERP_HOME.UDTPT400',
'PERP_HOME.UDTPT410',
'PERP_HOME.UDTPU135',
'PERP_HOME.UDTRD410',
'PERP_HOME.UDTRD420',
'PERP_HOME.UDTRD500',
'PERP_HOME.UDTRERRR',
'PERP_HOME.UDTRPAGI',
'PERP_HOME.UDTRR240',
'PERP_HOME.UDTRR310',
'PERP_UTIL.UDTPLPOL',
'PERP_UTIL.UDTPM400',
'PERP_UTIL.UDTPM410',
'PERP_UTIL.UDTPM420',
'PERP_UTIL.UDTPM430',
'PERP_UTIL.UDTPP100',
'PERP_UTIL.UDTPP200',
'PERP_UTIL.UDTPRPOL',
'PERP_UTIL.UDTPSCAN',
'PERP_UTIL.UDTPVPOL',
'PERP_UTIL.UDTRP100',
'PERP_UTIL.UDTRP200',
'PERP_WM.UDTPQ050',
'PERP_WM.UDTPR100',
'PERP_WM.UDTPR110',
'PERP_WM.UDTPR120',
'PERP_WM.UDTPR130',
'PERP_WM.UDTPR140',
'PERP_WM.UDTPR150',
'PERP_WM.UDTPR160',
'PERP_WM.UDTRPRCT',
'PERP_WM.UDTRR130',
'PERP_WM.UDTRR150',
'PERP_WM.UDTRR160',
'PERP_WM.UDTRR200',
'PERP_WM.UDTRR210',
'PERP_WM.UDTRR220',
'PERP_WM.UDTRR244',
'PERP_WM.UDTRR245',
'PERP_WM.UDTRR246',
'PERP_WM.UDTRR247',
'PERP_WM.UDTRR248',
'PERP_WM.UDTRR300',
'PERP_WM.UDTRR400',
'PERP_WM.UDTRR500',
'PERP_WMR.UDTRR235',
'PERP_WMR.UDTRR236',
'PERP_WMR.UDTRT236',
'PERP_WMR.UDTRW235',
'PERP_WMR.UDTRW236',
'PERP_WM_FIX.UDTPCONV',
'PERP_WM_FIX.UDTPTEST',
'PERP_WM_FIX.UDTPTST1',
'PERP_WM_FIX.UDTPWMFX',
'UDTP_UDTRT236.UDTRT236',
'PERP_HOME.SEEPD100',
'PERP_HOME.SEEPD210',
'PERP_HOME.SEEPD211',
'PERP_HOME.SEEPD220',
'PERP_HOME.SEEPD230',
'PERP_HOME.SEEPD300',
'PERP_HOME.SEEPP110',
'PERP_HOME.SEEPP120',
'PERP_HOME.SEEPP130',
'PERP_HOME.SEEPP140',
'PERP_HOME.SEEPP150',
'PERP_HOME.SEEPR150',
'PERP_HOME.SEERAI01',
'PERP_HOME.SEERD110',
'PERP_HOME.SEERD210',
'PERP_HOME.SEERD220',
'PERP_HOME.SEERD247',
'PERP_HOME.SEERN110',
'PERP_HOME.SEERPILK',
'PERP_HOME.SEERPINF',
'PERP_HOME.SEERREF1',
'PERP_HOME.SEERT200',
'PERP_HOME.SEERTBQ0',
'PERP_HOME.SEERTCM0',
'PERP_HOME.SEERTCO0',
'PERP_HOME.SEERTCV0',
'PERP_HOME.SEERTDC0',
'PERP_HOME.SEERTDV0',
'PERP_HOME.SEERTED0',
'PERP_HOME.SEERTFW0',
'PERP_HOME.SEERTGP0',
'PERP_HOME.SEERTIP0',
'PERP_HOME.SEERTLS0',
'PERP_HOME.SEERTMS0',
'PERP_HOME.SEERTNT0',
'PERP_HOME.SEERTNW0',
'PERP_HOME.SEERTPC0',
'PERP_HOME.SEERTPE0',
'PERP_HOME.SEERTPM0',
'PERP_HOME.SEERTPU0',
'PERP_HOME.SEERTRA0',
'PERP_HOME.SEERTRC0',
'PERP_HOME.SEERTRP0',
'PERP_HOME.SEERTSK0',
'PERP_HOME.SEERTSM0',
'PERP_HOME.SEERTUI0',
'PERP_HOME.SEERTUW0',
'PERP_HOME.SEERTWK0',
'PERP_HOME.SEERTWM0',
'PERP_HOME.SEERUW02',
'PERP_PWS.SEERCLNT',
'PERP_PWS.SEERMTCL',
'PERP_PWS.SEERMTCM',
'PERP_UTIL.SEERDPCH',
'PERP_UTIL.SEERLPCH',
'PERP_UTIL.SEERPUR1',
'PERP_UTIL.SEERVPCH',
'PERT_UTIL.SEERDPCH',
'PERP_WMR.WMRRW201',
'PERP_WMR.WMRRW203',
'PERP_WMR.WMRRW204',
'PERP_WMR.WMRRW231',
'PERP_WMR.WMRRW232',
'HIP_PVFT_PRINT_INDEX.HIPPPVIX',
'PERP_HOME.HIPTEPDP',
'PERP_HOME.HIPTEPDQ',
'PERP_PUT.HIPPFVRP',
'PERP_PUT.HIPPPWSF',
'PERP_PUT.HIPT4891',
'PERP_PUT.HIPTENVR',
'PERT_PUT.HIPPFVRP',
'PERP_FIRE.FLSTPCIO')
;


--
-- FREE PLAN
--
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       'FREE PLAN ('||STRIP(NAME)||')'
  FROM SYSIBM.SYSPLAN
WHERE STRIP(CREATOR)||'.'||STRIP(NAME)  IN (
'PERPROD.PIPP803D',
'PERPROD.PIPP9001',
'PERPROD.PIPPCONV',
'PERPROD.PIPPCSU0',
'PERPROD.PIPPFIX1',
'PERPROD.PIPPFORM',
'PERPROD.PIPQ9001',
'PERPROD.PIPV9001',
'PERPROD.PERP2000',
'PERPROD.PERP5000',
'PERPROD.PERP803D',
'PERPROD.PERPCONV',
'PERPROD.HRNPPCLI',
'PERPROD.HIPALARM',
'PERPROD.HIPPADDI',
'PERPROD.HIPPEPAS',
'PERPROD.HIPPFMRP',
'PERPROD.HIPPH300',
'PERPROD.HIPPH900',
'PERPROD.HIPPOPRP',
'PERPROD.HIPPPMSH',
'PERPROD.HIPPPPIL',
'PERPROD.HIPPPVIX',
'PERPROD.HIPPPWSF',
'PERPROD.HIPPRCST',
'PERPROD.HIPPRERP',
'PERPROD.HIPPSCNF',
'PERPROD.HIPPU300',
'PERPROD.FLSPDVUP',
'PERPROD.FLSPF001',
'PERPROD.FLSPF050',
'PERPROD.FLSPF105',
'PERPROD.FLSPF109',
'PERPROD.FLSPF110',
'PERPROD.FLSPF200',
'PERPROD.FLSPF920',
'PERPROD.FLSPPCLD',
'PERPROD.UDTPACN1',
'PERPROD.UDTPB100',
'PERPROD.UDTPCNVS',
'PERPROD.UDTPCON1',
'PERPROD.UDTPCONV',
'PERPROD.UDTPCVA1',
'PERPROD.UDTPE420',
'PERPROD.UDTPFFWI',
'PERPROD.UDTPH200',
'PERPROD.UDTPH300',
'PERPROD.UDTPHOH1',
'PERPROD.UDTPK400',
'PERPROD.UDTPLOCU',
'PERPROD.UDTPLPL1',
'ESEWSMP.UDTPLPT1',
'PERPROD.UDTPM600',
'PERPROD.UDTPNYNY',
'PERPROD.UDTPONL1',
'PERPROD.UDTPP100',
'PERPROD.UDTPP200',
'PERPROD.UDTPPAGI',
'PERPROD.UDTPPCC I51',
'PERPROD.UDTPPRCT',
'PERPROD.UDTPR110',
'PERPROD.UDTPR140',
'PERPROD.UDTPR150',
'PERPROD.UDTPR160',
'PERPROD.UDTPR240',
'PERPROD.UDTPR310',
'PERPROD.UDTPR3PP',
'PERPROD.UDTPRPL1',
'PERPROD.UDTPSCAN',
'PERPROD.UDTPTAB1',
'PERPROD.UDTPTEST',
'PERPROD.UDTPTRG1',
'ESEWSMP.UDTPTRG2',
'PERPROD.UDTPTST1',
'PERPROD.UDTPVPL1',
'ESEWSMP.UDTPVPT1',
'PERPROD.UDTPWIT1',
'PERPROD.UDTPWMFX',
'PERPROD.SEEPAFFL',
'PERPROD.SEEPDCH1',
'PERPROD.SEEPIC01',
'PERPROD.SEEPIC02',
'PERPROD.SEEPIC03',
'PERPROD.SEEPIC04',
'PERPROD.SEEPIN01',
'PERPROD.SEEPIN06',
'PERPROD.SEEPIN07',
'PERPROD.SEEPIW01',
'PERPROD.SEEPIW02',
'PERPROD.SEEPIW03',
'PERPROD.SEEPIW04',
'PERPROD.SEEPIW05',
'PERPROD.SEEPIW06',
'PERPROD.SEEPIW07',
'PERPROD.SEEPIW08',
'PERPROD.SEEPLCH1',
'PERPROD.SEEPMITT',
'PERPROD.SEEPMITU',
'PERPROD.SEEPPUR1',
'PERPROD.SEEPR150',
'PERPROD.SEEPREF1',
'PERPROD.SEEPUC01',
'PERPROD.SEEPUC02',
'PERPROD.SEEPUC03',
'PERPROD.SEEPUC04',
'PERPROD.SEEPUN02',
'PERPROD.SEEPUN04',
'PERPROD.SEEPUN05',
'PERPROD.SEEPUW01',
'PERPROD.SEEPUW02',
'PERPROD.SEEPVCH1',
'PERPROD.WMRPR230',
'PERPROD.WMRPR231',
'PERPROD.WMRPW201',
'PERPROD.WMRPW203',
'PERPROD.WMRPW204',
'PERPROD.WMRPW205',
'PERPROD.WMRPW230',
'PERPROD.WMRPW231',
'PERPROD.WMRPW232')
;

