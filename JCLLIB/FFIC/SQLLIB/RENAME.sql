SELECT TYPE,                                                            00010003
       'RENAME TABLE '||STRIP(CREATOR)||'.'||STRIP(NAME)||              00011003
       ' TO '||STRIP(CREATOR)||'.@'||STRIP(NAME)||';'                   00020002
  FROM SYSIBM.SYSTABLES                                                 00021001
 WHERE NAME LIKE 'EDI%'                                                 00040003
 --AND TYPE = 'T'                                                       00050003
;                                                                       00051004
SELECT 'RENAME INDEX '||STRIP(CREATOR)||'.'||STRIP(NAME)||              00070004
       ' TO '||STRIP(CREATOR)||'.@'||STRIP(NAME)||';'                   00080004
  FROM SYSIBM.SYSINDEXES                                                00090004
 WHERE NAME LIKE 'EDI%'                                                 00100004
 --AND TYPE = 'T'                                                       00110004
