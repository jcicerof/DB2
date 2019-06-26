SELECT DISTINCT                                                         00010015
'ALTER TABLESPACE '||STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME)||            00010116
' LOCKSIZE ROW;'                                                        00010215
FROM SYSIBM.SYSTABLES  A                                                00010315
WHERE SUBSTR(A.NAME,1,8) IN ('PROPKITW','PROPCONV')                     00060015
  AND TYPE = 'T'                                                        00061015
;                                                                       00070015
--FIM                                                                   00071014
--AND A.NAME IN (                                                       00080009
--'ORCICOBE','PROPSITU','PROPVERS','ORCITCOB')                          00090009
-- SELECT A.DBNAME,A.NAME,A.LOCKRULE,A.LOCKMAX,B.CREATOR,B.NAME         00100015
-- FROM SYSIBM.SYSTABLESPACE A,                                         00110015
--      SYSIBM.SYSTABLES B                                              00120015
-- WHERE A.DBNAME LIKE 'DB%'-- AND A.LOCKRULE = 'R'                     00130015
-- AND A.DBNAME = B.DBNAME                                              00140015
-- AND A.NAME   = B.TSNAME                                              00150015
-- AND B.TYPE = 'T'                                                     00160015
-- AND A.DBNAME IN ('DBEETA','DBEEAL','DBEEOR','DBEEAE')                00170015
-- --AND A.NAME IN (                                                    00180015
-- --'ORCICOBE','PROPSITU','PROPVERS','ORCITCOB')                       00190015
