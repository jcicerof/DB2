SELECT TTNAME,GRANTEE,                                                  00010011
  CASE WHEN GRANTEE = 'ZZCDIAP' THEN '*' END                            00010111
  FROM SYSIBM.SYSTABAUTH                                                00011007
 WHERE GRANTEE LIKE 'ZZ%'                                               00020006
   AND SELECTAUTH = 'Y'                                                 00030006
   AND TTNAME LIKE 'EIST_%'                                             00040006
 ORDER BY 1,2                                                           00050011
;                                                                       00051009
SELECT TTNAME ,COUNT(*)                                                 00060010
  FROM SYSIBM.SYSTABAUTH                                                00070009
 WHERE GRANTEE LIKE 'ZZ%'                                               00080009
   AND SELECTAUTH = 'Y'                                                 00090009
   AND TTNAME LIKE 'EIST_%'                                             00100009
 GROUP BY TTNAME                                                        00110010
 HAVING COUNT(*) = 1                                                    00111010
;                                                                       00120010
SELECT GRANTEE,COUNT(*)                                                 00130010
  FROM SYSIBM.SYSTABAUTH                                                00140010
 WHERE GRANTEE LIKE 'ZZ%'                                               00150010
   AND SELECTAUTH = 'Y'                                                 00160010
   AND TTNAME LIKE 'EIST_%'                                             00170010
 GROUP BY GRANTEE                                                       00180010
;                                                                       00190010
