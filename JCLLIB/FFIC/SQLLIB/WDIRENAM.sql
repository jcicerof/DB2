-- TABLES                                                               00001003
SELECT                                                                  00010001
       'RENAME TABLE '||STRIP(CREATOR)||'.'||STRIP(NAME)||              00011000
       ' TO @'||STRIP(NAME)||';'                                        00020001
  FROM SYSIBM.SYSTABLES                                                 00021000
 WHERE DBNAME = 'DEDI0A00'                                              00040005
   AND TYPE = 'T'                                                       00050001
;                                                                       00051000
-- INDEXES                                                              00052003
SELECT 'RENAME INDEX '||STRIP(CREATOR)||'.'||STRIP(NAME)||              00070000
       ' TO @'||STRIP(NAME)||';'                                        00080002
  FROM SYSIBM.SYSINDEXES                                                00090000
 WHERE DBNAME = 'DEDI0A00'                                              00100004
