SELECT DISTINCT GRANTEE                                                 00010010
  FROM SYSIBM.SYSDBAUTH                                                 00020000
 WHERE DBADMAUTH IN ('Y','S','G')                                       00021008
   AND NAME IN ('DSNRGFDB');                                            00030015
