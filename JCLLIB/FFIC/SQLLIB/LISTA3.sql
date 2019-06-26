SELECT B.CREATOR,B.NAME,B.DBNAME,B.TYPE
  FROM
       SYSIBM.SYSTABLES B
 WHERE -- B.TYPE = 'T'  AND
       STRIP(B.DBNAME)||'.'||STRIP(B.NAME) IN
('DCHG0P00.PCHGIDTB',
'DCHG0P00.PCHGMSTB',
'DCLI0A00.BUSINESS_CLIENT',
'DCLI0A00.CLFT_POLICY_TERM',
'DCLI0A00.CLIENT_ADDRESS',
'DCLI0A00.CLIENT_BILLING',
'DCLI0A00.CLIENT_CLAIM',
'DCLI0A00.CLIENT_POLICY',
'DCLI0A00.CLIENT_TAB',
'DCLI0A00.CLT_ADD_ADR_TEXT',
'DCLI0A00.CLT_ADD_NAME_TEXT',
'DCLI0A00.CLT_ADR_RELATION',
'DCLI0A00.CLT_ADR_SEARCH',
'DCLI0A00.CLT_CLT_RELATION',
'DCLI0A00.CLT_CLT_RELATION_V',
'DCLI0A00.CLT_CONTACT_INFO',
'DCLI0A00.CLT_OBJ_RELATION',
'DCLI0A00.CLT_OTHER_OBJECTS',
'DCLI0A00.HOUSEHOLD_CLIENT',
'DCLI0A00.INDIVIDUAL_CLIENT',
'DCLI0A01.ARCH_LOK_RON',
'DCLI0A01.ARCH_LOK_RUP',
'DCLI0A01.CLIENT_CROSS_REF',
'DCLI0A01.CLIENT_HELP',
'DCLI0A01.CLIENT_KEYS',
'DCLI0A01.CLIENT_LICENSE',
'DCLI0A01.CLIENT_MENU',
'DCLI0A01.CLIENT_PHONE',
'DCLI0A01.CLIENT_SUMMARY',
'DCLI0A01.CLIENT_TAX',
'DCLI0A01.CLIENT_UCT',
'DCLI0A01.CLT_CLT_VLD_REL',
'DCLI0A01.CLT_OWNING_SYSTEM',
'DCLI0A01.CLT_REF_RELATION',
'DCLI0A01.CLT_TEMPLATE',
'DCLI0A01.CLUB_MEM_INFO',
'DCLI0A01.CMT_COMMENT_TEXT',
'DCLI0A01.CMT_COMMENTS',
'DCLI0A01.WN_LOG',
'DCLI0B00.BUSINESS_CLIENT',
'DCLI0B00.CLFT_POLICY_TERM',
'DCLI0B00.CLIENT_ADDRESS',
'DCLI0B00.CLIENT_BILLING',
'DCLI0B00.CLIENT_CLAIM',
'DCLI0B00.CLIENT_POLICY',
'DCLI0B00.CLT_ADD_ADR_TEXT',
'DCLI0B00.CLT_ADD_NAME_TEXT',
'DCLI0B00.CLT_ADR_RELATION',
'DCLI0B00.CLT_ADR_SEARCH',
'DCLI0B00.CLT_CONTACT_INFO',
'DCLI0B00.CLT_OBJ_RELATION',
'DCLI0B00.CLT_OTHER_OBJECTS',
'DCLI0B00.HOUSEHOLD_CLIENT',
'DCLI0B00.INDIVIDUAL_CLIENT',
'DCLI0B01.ARCH_LOK_RON',
'DCLI0B01.ARCH_LOK_RUP',
'DCLI0B01.CLIENT_CROSS_REF',
'DCLI0B01.CLIENT_HELP',
'DCLI0B01.CLIENT_KEYS',
'DCLI0B01.CLIENT_LICENSE',
'DCLI0B01.CLIENT_MENU',
'DCLI0B01.CLIENT_PHONE',
'DCLI0B01.CLIENT_TAX',
'DCLI0B01.CLIENT_UCT',
'DCLI0B01.CLT_CLT_VLD_REL',
'DCLI0B01.CLT_OWNING_SYSTEM',
'DCLI0B01.CLT_REF_RELATION',
'DCLI0B01.CLT_TEMPLATE',
'DCLI0B01.CLUB_MEM_INFO',
'DCLI0B01.CMT_COMMENT_TEXT',
'DCLI0B01.CMT_COMMENTS',
'DCLI0B01.WN_LOG',
'DCLI0R01.ARCH_LOK_RON',
'DCLI0R01.ARCH_LOK_RUP',
'DCLI0R01.CMT_COMMENT_TEXT',
'DCLI0R01.CMT_COMMENTS',
'DCLI0R01.WN_LOG',
'DCLI0S00.CLIENT_POLICY',
'DCLI0T00.BUSINESS_CLIENT',
'DCLI0T00.CLFT_POLICY_TERM',
'DCLI0T00.CLIENT_ADDRESS',
'DCLI0T00.CLIENT_BILLING',
'DCLI0T00.CLIENT_CLAIM',
'DCLI0T00.CLIENT_POLICY',
'DCLI0T00.CLIENT_TAB',
'DCLI0T00.CLT_ADD_ADR_TEXT',
'DCLI0T00.CLT_ADD_NAME_TEXT',
'DCLI0T00.CLT_ADR_RELATION',
'DCLI0T00.CLT_ADR_SEARCH',
'DCLI0T00.CLT_CLT_RELATION',
'DCLI0T00.CLT_CLT_RELATION_V',
'DCLI0T00.CLT_CONTACT_INFO',
'DCLI0T00.CLT_OBJ_RELATION',
'DCLI0T00.CLT_OTHER_OBJECTS',
'DCLI0T00.HOUSEHOLD_CLIENT',
'DCLI0T00.INDIVIDUAL_CLIENT',
'DCLI0T01.ARCH_LOK_RON',
'DCLI0T01.ARCH_LOK_RUP',
'DCLI0T01.CLIENT_CROSS_REF',
'DCLI0T01.CLIENT_HELP',
'DCLI0T01.CLIENT_KEYS',
'DCLI0T01.CLIENT_LICENSE',
'DCLI0T01.CLIENT_MENU',
'DCLI0T01.CLIENT_PHONE',
'DCLI0T01.CLIENT_SUMMARY',
'DCLI0T01.CLIENT_TAX',
'DCLI0T01.CLIENT_UCT',
'DCLI0T01.CLT_CLT_VLD_REL',
'DCLI0T01.CLT_OWNING_SYSTEM',
'DCLI0T01.CLT_REF_RELATION',
'DCLI0T01.CLT_TEMPLATE',
'DCLI0T01.CLUB_MEM_INFO',
'DCLI0T01.CMT_COMMENT_TEXT',
'DCLI0T01.CMT_COMMENTS',
'DCLI0T01.WN_LOG',
'DCLI0U00.BUSINESS_CLIENT',
'DCLI0U00.CLFT_POLICY_TERM',
'DCLI0U00.CLIENT_ADDRESS',
'DCLI0U00.CLIENT_BILLING',
'DCLI0U00.CLIENT_CLAIM',
'DCLI0U00.CLIENT_POLICY',
'DCLI0U00.CLIENT_TAB',
'DCLI0U00.CLT_ADD_ADR_TEXT',
'DCLI0U00.CLT_ADD_NAME_TEXT',
'DCLI0U00.CLT_ADR_RELATION',
'DCLI0U00.CLT_ADR_SEARCH',
'DCLI0U00.CLT_CLT_RELATION',
'DCLI0U00.CLT_CONTACT_INFO',
'DCLI0U00.CLT_OBJ_RELATION',
'DCLI0U00.CLT_OTHER_OBJECTS',
'DCLI0U00.HOUSEHOLD_CLIENT',
'DCLI0U00.INDIVIDUAL_CLIENT',
'DCLI0U01.ARCH_LOK_RON',
'DCLI0U01.ARCH_LOK_RUP',
'DCLI0U01.CLIENT_CROSS_REF',
'DCLI0U01.CLIENT_HELP',
'DCLI0U01.CLIENT_KEYS',
'DCLI0U01.CLIENT_LICENSE',
'DCLI0U01.CLIENT_MENU',
'DCLI0U01.CLIENT_PHONE',
'DCLI0U01.CLIENT_SUMMARY',
'DCLI0U01.CLIENT_TAX',
'DCLI0U01.CLIENT_UCT',
'DCLI0U01.CLT_CLT_VLD_REL',
'DCLI0U01.CLT_OWNING_SYSTEM',
'DCLI0U01.CLT_REF_RELATION',
'DCLI0U01.CLT_TEMPLATE',
'DCLI0U01.CLUB_MEM_INFO',
'DCLI0U01.WN_LOG',
'DDBATSTD.DDBATOLL_AUDIT',
'DOAS2T00.PIOSHDTB',
'DPER0A00.PERT_RATE_TERR',
'DPER0A00.PERT_VIOLATION',
'DPER0B00.PERT_ADDL_SRS_INFO',
'DPER0B01.PERT_CLIENT_XREF',
'DPER0B01.PERT_COVERAGE',
'DPER0B01.PERT_INT_PARTY',
'DPER0B01.PERT_INT_PRTY_ADDR',
'DPER0B01.PERT_INT_PRTY_NAME',
'DPER0B01.PERT_NEW_CLIENT',
'DPER0B01.PERT_NOTES',
'DPER0B01.PERT_OPERATOR',
'DPER0B01.PERT_PREMIUM',
'DPER0B01.PERT_RATE_TERR',
'DPER0B01.PERT_TRANSACTION',
'DPER0B01.PERT_VEH_POLICY',
'DPER0B01.PERT_VEHICLE',
'DPER0B01.PERT_VIOLATION',
'DPER0B03.PERT_CLIENT_XREF',
'DPER0B03.PERT_COVERAGE',
'DPER0B03.PERT_INT_PARTY',
'DPER0B03.PERT_INT_PRTY_ADDR',
'DPER0B03.PERT_INT_PRTY_NAME',
'DPER0B03.PERT_NEW_CLIENT',
'DPER0B03.PERT_NOTES',
'DPER0B03.PERT_OPERATOR',
'DPER0B03.PERT_PREMIUM',
'DPER0B03.PERT_RATE_TERR',
'DPER0B03.PERT_TRANSACTION',
'DPER0B03.PERT_VEH_POLICY',
'DPER0B03.PERT_VEHICLE',
'DPER0B03.PERT_VIOLATION',
'DPER0B04.PERT_CLIENT_XREF',
'DPER0B04.PERT_COVERAGE',
'DPER0B04.PERT_INT_PARTY',
'DPER0B04.PERT_INT_PRTY_ADDR',
'DPER0B04.PERT_INT_PRTY_NAME',
'DPER0B04.PERT_NEW_CLIENT',
'DPER0B04.PERT_NOTES',
'DPER0B04.PERT_OPERATOR',
'DPER0B04.PERT_PREMIUM',
'DPER0B04.PERT_RATE_TERR',
'DPER0B04.PERT_TRANSACTION',
'DPER0B04.PERT_VEH_POLICY',
'DPER0B04.PERT_VEHICLE',
'DPER0B04.PERT_VIOLATION',
'DPER0B0S.PERT_CLIENT_XREF',
'DPER0B0S.PERT_COVERAGE',
'DPER0B0S.PERT_INT_PARTY',
'DPER0B0S.PERT_INT_PRTY_ADDR',
'DPER0B0S.PERT_INT_PRTY_NAME',
'DPER0B0S.PERT_NEW_CLIENT',
'DPER0B0S.PERT_NOTES',
'DPER0B0S.PERT_OPERATOR',
'DPER0B0S.PERT_PREMIUM',
'DPER0B0S.PERT_RATE_TERR',
'DPER0B0S.PERT_TRANSACTION',
'DPER0B0S.PERT_VEH_POLICY',
'DPER0B0S.PERT_VEHICLE',
'DPER0B0S.PERT_VIOLATION',
'DPER0B0V.PERT_CLIENT_XREF',
'DPER0B0V.PERT_COVERAGE',
'DPER0B0V.PERT_INT_PARTY',
'DPER0B0V.PERT_INT_PRTY_ADDR',
'DPER0B0V.PERT_INT_PRTY_NAME',
'DPER0B0V.PERT_NEW_CLIENT',
'DPER0B0V.PERT_NOTES',
'DPER0B0V.PERT_OPERATOR',
'DPER0B0V.PERT_PREMIUM',
'DPER0B0V.PERT_RATE_TERR',
'DPER0B0V.PERT_TRANSACTION',
'DPER0B0V.PERT_VEH_POLICY',
'DPER0B0V.PERT_VEHICLE',
'DPER0B0V.PERT_VIOLATION',
'DPER0T00.PERT_CLIENT_XREF',
'DPER0T00.PERT_COVERAGE',
'DPER0T00.PERT_INT_PARTY',
'DPER0T00.PERT_INT_PRTY_ADDR',
'DPER0T00.PERT_INT_PRTY_NAME',
'DPER0T00.PERT_NEW_CLIENT',
'DPER0T00.PERT_NOTES',
'DPER0T00.PERT_OPERATOR',
'DPER0T00.PERT_PREMIUM',
'DPER0T00.PERT_TRANSACTION',
'DPER0T00.PERT_VEH_POLICY',
'DPER0T00.PERT_VEHICLE',
'DPIP0T00.PIPT_HISTORY',
'DPIP0T00.PIPT_OBJECT',
'DPIP0T00.PIPT_QUOTE',
'DPOL0200.POLT_NEW_JOURNAL',
'DPOL0AZZ.POLZ_COVERAGE',
'DPOL0AZZ.POLZ_ENDORSEMENT',
'DPOL0AZZ.POLZ_FINANC_RESP',
'DPOL0AZZ.POLZ_INT_PARTY',
'DPOL0AZZ.POLZ_INT_PRTY_NAME',
'DPOL0AZZ.POLZ_OOST_VIOL',
'DPOL0AZZ.POLZ_OPERATOR',
'DPOL0AZZ.POLZ_POLICY',
'DPOL0AZZ.POLZ_PREMIUM',
'DPOL0AZZ.POLZ_PREMIUM2',
'DPOL0AZZ.POLZ_TRANSACTION',
'DPOL0AZZ.POLZ_VEHICLE',
'DPOL0AZZ.POLZ_VIOLATION',
'DPOL0B00.POLT_NEW_JOURNAL',
'DPOL0B03.POLT_NEW_JOURNAL',
'DPOL0B04.POLT_NEW_JOURNAL',
'DPOL0T00.POLT_POLICY',
'DPUT2T00.PUT2_FORM',
'DQST0B00.QSTT_COUNTY',
'DQST0B00.QSTT_ISO_TABLE',
'DQST0B00.QSTT_OBJECT',
'DQST0B00.QSTT_PRIDE_CD_CONV',
'DQST0B00.QSTT_RISK_APPR',
'DQST0B00.QSTT_TERRITORY',
'DQSTAB00.DWELLING_TAB',
'DQSTAB00.DWELLING_V',
'DQSTAB00.DWL_AMT_TYP_LIT',
'DQSTAB00.DWL_AMT_TYP_LIT_V',
'DQSTAB00.DWL_CMY_PTC_V',
'DQSTAB00.DWL_COMMUNITY_PTC',
'DQSTAB00.DWL_COV_LIMITS',
'DQSTAB00.DWL_COV_LIMITS_V',
'DQSTAB00.DWL_EXTENDED_COV',
'DQSTAB00.DWL_EXTENDED_COV_V',
'DQSTAB00.DWL_FORM_LIT',
'DQSTAB00.DWL_FORM_LIT_V',
'DQSTAB00.DWL_IGP_LIT',
'DQSTAB00.DWL_IGP_LIT_V',
'DQSTAB00.DWL_LIM_PCT_V',
'DQSTAB00.DWL_LIM_PERCENTS',
'DQSTAB00.DWL_NBR_FAM_LIT',
'DQSTAB00.DWL_NBR_FAM_LIT_V',
'DQSTAB00.DWL_PDV',
'DQSTAB00.DWL_PDV_V',
'DQSTAB00.DWL_PROPERTY_DES',
'DQSTAB00.DWL_PROPERTY_DES_V',
'DQSTAB00.DWL_WATERCRAFT',
'DQSTAB00.DWL_WATERCRAFT_V',
'DQSTAB00.DWL_WH_DED',
'DQSTAB00.DWL_WH_DED_V',
'DQSTAB00.HO_DWELLING',
'DQSTAB00.HO_DWELLING_V',
'DQSTAB00.HO_ICE_SLL_LIT',
'DQSTAB00.HO_ICE_SLL_LIT_V',
'DQSTAB00.HO_LOSS_ASS_V',
'DQSTAB00.HO_TOT_ACR_LIT',
'DQSTAB00.HO_TOT_ACR_LIT_V',
'DQSTAB00.MCI_PERCENTAGE',
'DQSTAB00.MCI_PERCENTAGE_V',
'DQSTAT00.DWELLING_V',
'DQSTAT00.DWL_AMT_TYP_LIT_V',
'DQSTAT00.DWL_CMY_PTC_V',
'DQSTAT00.DWL_COV_LIMITS_V',
'DQSTAT00.DWL_EXTENDED_COV_V',
'DQSTAT00.DWL_FORM_LIT_V',
'DQSTAT00.DWL_IGP_LIT_V',
'DQSTAT00.DWL_LIM_PCT_V',
'DQSTAT00.DWL_NBR_FAM_LIT_V',
'DQSTAT00.DWL_PDV_V',
'DQSTAT00.DWL_PROPERTY_DES_V',
'DQSTAT00.DWL_WATERCRAFT_V',
'DQSTAT00.DWL_WH_DED_V',
'DQSTAT00.HO_DWELLING_V',
'DQSTAT00.HO_ICE_SLL_LIT_V',
'DQSTAT00.HO_LOSS_ASS_V',
'DQSTAT00.HO_TOT_ACR_LIT_V',
'DQSTAT00.MCI_PERCENTAGE_V',
'DQSTBA00.ERROR_STORAGE',
'DQSTBA00.FOLDER_CONTROL',
'DQSTBA00.POL_INS_LINE',
'DQSTBB00.CLIENT_UCT',
'DQSTBB00.DWL_FORMS',
'DQSTBB00.ERROR_DES',
'DQSTBB00.ERROR_STORAGE',
'DQSTBB00.ERROR_STORAGE_V',
'DQSTBB00.FOLDER_CONTROL',
'DQSTBB00.MDU_PROCESS_SEQ',
'DQSTBB00.MDU_PROCESS_SEQ_V',
'DQSTBB00.PC_COMMON_MSC_RT',
'DQSTBB00.PC_COMMON_RT',
'DQSTBB00.POL_INS_LINE',
'DQSTBB00.POL_INS_LINE_V',
'DQSTBB00.POL_RATE_DATE',
'DQSTBB00.POL_SYMBOL_LIT',
'DQSTBB00.POL_SYMBOL_LIT_V',
'DQSTBB00.POLICY_TAB',
'DQSTBB00.POLICY_TAB_V',
'DQSTBB00.PRM_UCT1',
'DQSTBB00.PRM_UCT2',
'DQSTBB00.PRM_UCT3',
'DQSTBB00.PRM_UCT4',
'DQSTBB00.PSL_CTZ',
'DQSTBB00.PSL_CTZ_V',
'DQSTBB00.PSL_PREMIUMS',
'DQSTBB00.PSL_PREMIUMS_V',
'DQSTBB00.WARP_ALGO_SEQ',
'DQSTBB00.WARP_ALGORITHM_MST',
'DQSTBT00.ERROR_STORAGE',
'DQSTBT00.ERROR_STORAGE_V',
'DQSTBT00.FOLDER_CONTROL',
'DQSTBT00.MDU_PROCESS_SEQ_V',
'DQSTBT00.POL_INS_LINE',
'DQSTBT00.POL_SYMBOL_LIT_V',
'DQSTBT00.POLICY_TAB_V',
'DQSTBT00.PSL_CTZ_V',
'DQSTBT00.PSL_PREMIUMS_V',
'DQSTXB00.PLAN_TABLE_EBCDIC',
'DUBS0A00.UBST_SUMM_ITEM_LVL',
'DUBS0T00.UBST_BILL_STATS',
'SYSTOOLS.CQM32_EXCP_LOB1',
'SYSTOOLS.CQM32_SQLCODE_LOB1')
