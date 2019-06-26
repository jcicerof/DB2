-- GRANTS DAS SEQUENCES                                                 00000104
SELECT OWNER,                                                           00000207
' GRANT USAGE ON SEQUENCE ' ||                                          00000304
STRIP(OWNER)||'.'||STRIP(NAME)||' TO ZZPMXTC;'                          00000406
  FROM SYSIBM.SYSSEQUENCES                                              00000504
WHERE NAME IN (                                                         00000602
'CUST_ACCT_NO_GEN',                                                     00000704
'CUST_NO_GEN_SEQ'                                                       00000804
)                                                                       00000904
;                                                                       00002103
-- GRANTS DOS DATABASES                                                 00002204
SELECT CREATOR,                                                         00002307
' GRANT LOAD,UNLOAD, REPAIR, DISPLAY ON DATABASE ' ||                   00002404
STRIP(NAME)||' TO ZZPMXTC;'                                             00002504
  FROM SYSIBM.SYSDATABASE                                               00002604
WHERE NAME IN (                                                         00002704
'DCLI0A00',                                                             00002804
'DCLI0A01',                                                             00002904
'DCLI0B00',                                                             00003004
'DCLI0B01',                                                             00003104
'DCLI0M00',                                                             00003204
'DCLI0M01',                                                             00003304
'DCLI0S00',                                                             00003404
'DCLI0S01',                                                             00003504
'DCLI0T00',                                                             00003604
'DCLI0T01',                                                             00003704
'DCLI0U00',                                                             00003804
'DCLI0U01',                                                             00003904
'DCLI0V00',                                                             00004004
'DCLI0V01')                                                             00004104
;                                                                       00004204
-- GRANTS DAS TABELAS                                                   00004304
                                                                        00004404
SELECT CREATOR,                                                         00004507
' GRANT SELECT,INSERT,UPDATE,DELETE ON ' ||                             00004604
STRIP(CREATOR)||'.'||STRIP(NAME)||' TO ZZPMXTC;'                        00004704
  FROM SYSIBM.SYSTABLES                                                 00004804
WHERE TYPE = 'T'                                                        00004904
AND   CREATOR IN (                                                      00005004
  'DB2ACPT','DB2ACP4','DB2ACP2','DB2TEST','DB2TES2','DB2PRVT','DB2PRV2')00005104
AND NAME IN (                                                           00006004
 'CDI_DB_DUNBRAD'                                                       00010001
,'CDI_PA_PARR'                                                          00020000
,'CDI_SN_DBSCRUB'                                                       00030000
,'CLT_TABLE_ID_GEN'                                                     00040000
,'CLT_ADD_ADR_TEXT'                                                     00050000
,'CLT_ADD_NAME_TEXT'                                                    00060000
,'CLT_ADR_RELATION'                                                     00070000
,'BUSINESS_CLIENT'                                                      00080000
,'CLIENT_ADDRESS'                                                       00090000
,'CLIENT_BILLING'                                                       00100000
,'CLT_CONTACT_INFO'                                                     00110000
,'CLIENT_TAB'                                                           00120000
,'CLIENT_CLAIM'                                                         00130000
,'CLT_CLT_RELATION'                                                     00140000
,'HOUSEHOLD_CLIENT'                                                     00150000
,'INDIVIDUAL_CLIENT'                                                    00160000
,'CLT_OTHER_OBJECTS'                                                    00170000
,'CLT_OBJ_RELATION'                                                     00180000
,'CLIENT_POLICY'                                                        00190000
,'CLT_ADR_SEARCH'                                                       00200000
,'CLFT_POLICY_TERM'                                                     00210000
,'CLIENT_CROSS_REF'                                                     00220000
,'CLIENT_UCT'                                                           00230000
,'CLT_CLT_VLD_REL'                                                      00240000
,'CLIENT_HELP'                                                          00250000
,'CLIENT_KEYS'                                                          00260000
,'CLIENT_LICENSE'                                                       00270000
,'CLIENT_SUMMARY'                                                       00280000
,'CLIENT_MENU'                                                          00290000
,'CLUB_MEM_INFO'                                                        00300000
,'CLT_OWNING_SYSTEM'                                                    00310000
,'CLIENT_PHONE'                                                         00320000
,'CLT_REF_RELATION'                                                     00330000
,'CLT_TEMPLATE'                                                         00340000
,'CLIENT_TAX')                                                          00350000
