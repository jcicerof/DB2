SELECT * FROM SYSIBM.SYSUSERAUTH                                        00010000
 WHERE (BINDADDAUTH = 'Y'                                               00020002
    OR BINDAGENTAUTH = 'Y')                                             00030002
   AND GRANTEE LIKE 'ZZ%'                                               00040002
