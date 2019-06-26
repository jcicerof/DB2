-- VCATNAME(REV30.09.2016)                                              00002061
--                                                                      00003024
SELECT DISTINCT                                                         00004054
  CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS "*DUMMY*",               00004160
  STRIP(VCATNAME)||'.DSNDBD.'||STRIP(DBNAME)||'.'||STRIP(TSNAME)        00005041
  AS "4THLEVEL",                                                        00006041
  CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,                    00007058
  'TS' AS TYPE                                                          00008041
  FROM SYSIBM.SYSTABLEPART                                              00009041
UNION ALL                                                               00010041
SELECT DISTINCT                                                         00020054
  CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS "*DUMMY*",               00020160
  STRIP(VCATNAME)||'.DSNDBD.'||STRIP(DBNAME)||'.'||STRIP(INDEXSPACE)    00030041
  AS "4THLEVEL",                                                        00040041
  CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,                    00050058
  'IX' AS TYPE                                                          00060041
  FROM SYSIBM.SYSINDEXES A,                                             00070041
       SYSIBM.SYSINDEXPART B                                            00080041
 WHERE A.CREATOR = B.IXCREATOR                                          00090041
   AND A.NAME    = B.IXNAME                                             00100041
