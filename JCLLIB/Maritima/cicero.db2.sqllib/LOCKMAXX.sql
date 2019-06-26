--ALTER TABLSPACE DB.TS LOCKSIZE ANY LOCKMAX SYSTEM;                    00010000
SELECT                                                                  00020000
'ALTER TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(NAME)||                  00030000
' LOCKSIZE ANY LOCKMAX SYSTEM;'                                         00040000
FROM SYSIBM.SYSTABLESPACE                                               00050000
WHERE DBNAME LIKE 'DB%' AND DBNAME <> 'DB2ADM'                          00060002
  AND (LOCKRULE = 'R' OR LOCKMAX = 0) ;                                 00070001
