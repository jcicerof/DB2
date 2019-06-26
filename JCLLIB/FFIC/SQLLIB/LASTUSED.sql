SELECT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID                00010002
     , DAYS(CURRENT DATE) - DAYS(LASTUSED) AS AGE                       00011002
     , LASTUSED, SUBSTR(NAME,1,18) AS NAME                              00020001
     , SUBSTR(COLLID,1,18) AS COLLID                                    00030001
     , SUBSTR(VERSION,1,30) AS VERSION                                  00040001
     , HEX(CONTOKEN)                                                    00050001
  FROM SYSIBM.SYSPACKAGE                                                00060001
 WHERE DAYS(CURRENT DATE) - DAYS(LASTUSED) > 365                        00070001
 ORDER BY 2 DESC                                                        00080002
