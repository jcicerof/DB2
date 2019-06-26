SELECT DISTINCT GRANTEE                                                 00010005
  FROM SYSIBM.SYSUSERAUTH                                               00011004
 WHERE BINDADDAUTH = 'Y'                                                00012005
;                                                                       00020004
--AND TTNAME ='PLAN_TABLE'                                              00030002
  AND GRANTEE LIKE 'ZZ%'                                                00040002
SELECT DISTINCT GRANTEE                                                 00050004
  FROM SYSIBM.SYSTABAUTH                                                00060004
WHERE TCREATOR='DB2CERT'                                                00070004
--AND TTNAME ='PLAN_TABLE'                                              00080004
  AND GRANTEE LIKE 'ZZ%'                                                00090004
