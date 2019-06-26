SELECT DISTINCT                                                         00010000
       '   REBIND PACKAGE ('||STRIP(DCOLLID)||'.'||STRIP(DNAME)||')'    00011002
  FROM SYSIBM.SYSPACKDEP                                                00012000
 WHERE (BQUALIFIER = 'CSDPROD' AND                                      00014012
        BNAME IN ('UCST_CHECK_REG'))                                    00014112
--  OR (BQUALIFIER = 'DB2TEST' AND                                      00014312
--      BNAME IN ('CLT_ADR_RELATION'                                    00014412
--               ,'CLIENT_TAB'                                          00014512
--               ,'CLT_OBJ_RELATION'                                    00014612
--               ,'CLIENT_POLICY'                                       00014712
--               ,'CLT_REF_RELATION'                                    00014812
--               ,'INDIVIDUAL_CLIENT'                                   00014912
--               ,'CLT_ADR_SEARCH'))                                    00015012
--  OR (BQUALIFIER = 'DB2ACPT' AND                                      00015112
--      BNAME IN ('CLT_ADR_SEARCH'                                      00015212
--               ,'INDIVIDUAL_CLIENT'))                                 00015312
--  OR (BQUALIFIER = 'DB2CERT' AND                                      00015412
--      BNAME IN ('CLT_ADR_SEARCH'                                      00015512
--               ,'INDIVIDUAL_CLIENT'))                                 00015612
UNION ALL                                                               00015911
SELECT DISTINCT                                                         00016000
       '   REBIND PLAN ('||STRIP(DNAME)||')'                            00017002
  FROM SYSIBM.SYSPLANDEP                                                00018000
 WHERE (BCREATOR = 'CSDPROD' AND                                        00019012
        BNAME IN ('UCST_CHECK_REG'))                                    00020012
--  OR (BCREATOR = 'DB2TEST' AND                                        00030012
--      BNAME IN ('CLT_ADR_RELATION'                                    00040012
--               ,'CLIENT_TAB'                                          00050012
--               ,'CLT_OBJ_RELATION'                                    00060012
--               ,'CLIENT_POLICY'                                       00070012
--               ,'CLT_REF_RELATION'                                    00080012
--               ,'INDIVIDUAL_CLIENT'                                   00090012
--               ,'CLT_ADR_SEARCH'))                                    00100012
--  OR (BCREATOR = 'DB2ACPT' AND                                        00110012
--      BNAME IN ('CLT_ADR_SEARCH'                                      00120012
--               ,'INDIVIDUAL_CLIENT'))                                 00130012
--  OR (BCREATOR = 'DB2CERT' AND                                        00140012
--      BNAME IN ('CLT_ADR_SEARCH'                                      00150012
--               ,'INDIVIDUAL_CLIENT'))                                 00160012
