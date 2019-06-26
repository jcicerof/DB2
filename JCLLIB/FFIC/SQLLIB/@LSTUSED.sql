SELECT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,               00010222
       'PLAN' AS "TYPE",                                                00011013
       NAME, CREATOR,                                                   00012015
       BOUNDTS AS "LAST_BIND",                                          00030014
       VALID, OPERATIVE,                                                00040013
       LASTUSED                                                         00050013
  FROM SYSIBM.SYSPLAN                                                   00060013
UNION ALL                                                               00061015
SELECT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,               00062022
       'PKGE' AS "TYPE",                                                00063005
       NAME, CREATOR,                                                   00070015
       BINDTIME  AS "LAST_BIND",                                        00090005
       VALID, OPERATIVE,                                                00100005
       LASTUSED                                                         00110005
  FROM SYSIBM.SYSPACKAGE                                                00120005
