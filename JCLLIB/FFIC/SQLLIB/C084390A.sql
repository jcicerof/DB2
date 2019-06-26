SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,      00010002
       'FREE PACKAGE ('||STRIP(COLLID)||'.'||STRIP(NAME)||')'           00010602
  FROM SYSIBM.SYSPACKAGE                                                00010701
 WHERE OWNER IN ('DB2ACPT')                                             00010801
   AND NAME IN (                                                        00010901
       'AGIRAUTO'                                                       00011002
      ,'AGIRCLNT'                                                       00011102
      ,'AGITLARC'                                                       00011202
      ,'AGIRCCHK'                                                       00011302
      ,'AGITFPFM')                                                      00011402
;                                                                       00016700
--FIM;                                                                  00016800
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,      00016902
       'FREE PLAN ('||STRIP(NAME)||')'                                  00017002
  FROM SYSIBM.SYSPLAN                                                   00017100
WHERE CREATOR IN ('DB2ACPT')                                            00017202
  AND NAME IN (                                                         00017300
     'AGIPAUTO'                                                         00017402
    ,'AGIPCCHK'                                                         00017502
    ,'AGIPCLNT'                                                         00017602
    ,'AGIPDBFD'                                                         00017702
    ,'AGIPFPFM')                                                        00017802
;                                                                       00020100
