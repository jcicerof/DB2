--
-- FREE PACKAGE
--
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       'FREE PACKAGE ('||STRIP(COLLID)||'.'||STRIP(NAME)||')'
  FROM SYSIBM.SYSPACKAGE
WHERE STRIP(COLLID)||'.'||STRIP(NAME) IN (
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
'PUTP_PUTTTFR1.PUTTTFR1',
'KLUE_AUTO.KLUPAMTA',
'KLUE_AUTO.KLURAMTA',
'POLP_MASS_AUTO.KLUTCLMA',
'POLT_MASS_AUTO.KLUTCLMA')
;

--
-- FREE PLAN
--
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       'FREE PLAN ('||STRIP(NAME)||')'
  FROM SYSIBM.SYSPLAN
WHERE STRIP(CREATOR)||'.'||STRIP(NAME)  IN (
'PERPROD.PUTPFDTM',
'PERPROD.PUTPREPT',
'PERPROD.PUTPUPLD',
'PERPROD.PUTTTPJ1',
'PERPROD.KLUPAMTA',
'PERPROD.KLUPRADD',
'PERPROD.KLUPSELA')
;
