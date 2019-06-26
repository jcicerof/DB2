SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,      00010000
       'FREE PACKAGE ('||STRIP(COLLID)||'.'||STRIP(NAME)||')'           00010600
  FROM SYSIBM.SYSPACKAGE                                                00010700
 WHERE OWNER IN ('DB2ACPT')                                             00010800
   AND NAME IN (                                                        00010900
       'AGIRCLNT'                                                       00011001
      ,'AGIRCCHK'                                                       00011101
      ,'AGIPAOLE')                                                      00011201
;                                                                       00016700
--FIM;                                                                  00016800
--SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,    00016901
--       'FREE PLAN ('||STRIP(NAME)||')'                                00017001
--  FROM SYSIBM.SYSPLAN                                                 00017101
--WHERE CREATOR IN ('DB2ACPT')                                          00017201
--  AND NAME IN (                                                       00017301
--     'AGIPAUTO'                                                       00017401
--    ,'AGIPCCHK'                                                       00017501
--    ,'AGIPCLNT'                                                       00017601
--    ,'AGIPDBFD'                                                       00017701
--    ,'AGIPFPFM')                                                      00017801
--;                                                                     00020101
