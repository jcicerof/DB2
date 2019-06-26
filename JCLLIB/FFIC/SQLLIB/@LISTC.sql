  SELECT DISTINCT                                                       00011002
       CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,               00012003
       CHAR('  LISTC LEVEL('||STRIP(VCATNAME)||'.DSNDBD) ALL', 80)      00020002
         AS LISTCAT                                                     00021003
  FROM SYSIBM.SYSSTOGROUP;                                              00030000
