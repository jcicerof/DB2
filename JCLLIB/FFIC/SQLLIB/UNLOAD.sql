SELECT 'INCLUDE TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(NAME)           00010000
     , NACTIVE                                                          00011000
  FROM SYSIBM.SYSTABLESPACE                                             00020000
 ORDER BY NACTIVE DESC;                                                 00250001
