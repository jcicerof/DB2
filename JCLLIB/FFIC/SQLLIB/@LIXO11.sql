SELECT 'AUTOACT' AS APPLNAME,CREATOR,NAME,TYPE
  FROM SYSIBM.SYSTABLES
 WHERE CREATOR IN (
            'DB2BTS','DB2PFIX','DB2PRVT','DB2TEST','DB2UNIT1',
            'DB2UNIT3','DB2UNIT4',
            'PERFVARO','PERFVMTC','PERITMTC','PERU1MTC',
            'PERUQMTC','QSTACPT',
            'QSTTEST','SRS1CCK','TESTFATS')
   AND NAME IN (
            'PERT_ADDL_SRS_INFO',
            'PERT_AUDIT_PARENT',
            'PERT_AUDIT_TRAIL',
            'PERT_CLAIM_ASSIGN',
            'PERT_CLAIM_INFO',
            'PERT_CLAIM_VALUE',
            'PERT_CLIENT_XREF',
            'PERT_CLNT_PRD_XREF',
            'PERT_CLUE_INFO',
            'PERT_COVERAGE',
            'PERT_COVERAGEQ',
            'PERT_DUMMY1',
            'PERT_DUMMY2',
            'PERT_ENDORSEMENT',
            'PERT_FILLIN_FORMS',
            'PERT_FORMS_DEF',
            'PERT_INT_PARTY',
            'PERT_INT_PRTY_ADDR',
            'PERT_INT_PRTY_DEMO',
            'PERT_INT_PRTY_NAME',
            'PERT_NC_INFO',
            'PERT_NC_REASONS',
            'PERT_NEW_CLIENT',
            'PERT_NEW_CLIENTQ',
            'PERT_NON_STD_VEH',
            'PERT_NOTES',
            'PERT_OPERATOR',
            'PERT_OPR_RPT_LINK',
            'PERT_PREMIUM',
            'PERT_PRIDE_CD_CONV',
            'PERT_PRINT_IDCARDS',
            'PERT_PRODUCER_XFER',
            'PERT_QUOTE',
            'PERT_RATE_TERR',
            'PERT_RATE_TERR_ADD',
            'PERT_RATE_TERR_DEL',
            'PERT_RATE_TERR_MOD',
            'PERT_RPT_INFO',
            'PERT_SIGNED_FORMS',
            'PERT_STATE_FORMS',
            'PERT_STATE_REGION',
            'PERT_TEMP_FIX',
            'PERT_TRANS',
            'PERT_TRANS_MSG',
            'PERT_TRANS_REFER',
            'PERT_TRANS_SUMMARY',
            'PERT_TRANSACTION',
            'PERT_USERID',
            'PERT_UW_QUESTION',
            'PERT_VALUE_LOCK',
            'PERT_VEH_POLICY',
            'PERT_VEHICLE',
            'PERT_VIOLATION')
UNION ALL
SELECT 'AUTOACT' AS APPLNAME,CREATOR,NAME,TYPE
  FROM SYSIBM.SYSTABLES
 WHERE CREATOR IN (
            'DB2TEST', 'DB2BTS', 'DB2PFIX', 'DB2PRVT',
            'DB2UNIT1','DB2UNIT3', 'DB2UNIT4',
            'DB2UNITA','DB2UNITC', 'TESTFATS', 'TESTVOL')
   AND NAME IN (
            'POLT_COVERAGE'
           ,'POLT_ENDORSEMENT'
           ,'POLT_ENDT_DESC'
           ,'POLT_FINANC_RESP'
           ,'POLT_INT_PARTY'
           ,'POLT_INT_PARTY_NAME'
           ,'POLT_JOURNAL'
           ,'POLT_MOT'
           ,'POLT_NOTES'
           ,'POLT_OOST_VIOL'
           ,'POLT_OPERATOR'
           ,'POLT_PARM'
           ,'POLT_PARMALIAS'
           ,'POLT_POLICY'
           ,'POLT_PERMIUM'
           ,'POLT_PROD_TRANSFER'
           ,'POLT_SECURITY'
           ,'POLT_TEMPTR'
           ,'POLT_TRANS1'
           ,'POLT_TRANSACTION'
           ,'POLT_VEHICLE'
           ,'POLT_VIOLATION'
           ,'POLT_ZZ_POLNBR')
UNION ALL
SELECT 'AUTOACT' AS APPLNAME,CREATOR,NAME,TYPE
  FROM SYSIBM.SYSTABLES
 WHERE CREATOR IN (
            'DB2TEST')
   AND NAME IN (
            'POLZ_COVERAGE'
           ,'POLZ_ENDORSEMENT'
           ,'POLZ_ENDT_DESC'
           ,'POLZ_FINANC_RESP'
           ,'POLZ_INT_PARTY'
           ,'POLZ_INT_PRTY_NAME'
           ,'POLZ_JOURNAL'
           ,'POLZ_NOTES'
           ,'POLZ_OPERATOR'
           ,'POLZ_PARM'
           ,'POLZ_POLICY'
           ,'POLZ_PREMIUM'
           ,'POLZ_PROD_TRANSFER'
           ,'POLZ_SECURITY'
           ,'POLZ_TRANSACTION'
           ,'POLZ_VEHICLE'
           ,'POLZ_VIOLATION'
           ,'POLZ_DUMMY_ROOT')
UNION ALL
SELECT 'FLASH' AS APPLNAME,CREATOR,NAME,TYPE
  FROM SYSIBM.SYSTABLES
 WHERE CREATOR IN (
            'DB2TEST')
   AND NAME IN (
            'FLST_POLCAL_TABLE')
UNION ALL
SELECT 'PWS' AS APPLANAME,CREATOR,NAME,TYPE
  FROM SYSIBM.SYSTABLES
 WHERE CREATOR IN (
            'DB2TEST')
   AND NAME IN (
            'ASSIGNEE',
            'ASSIGNMENT',
            'BUSINESS_TASK',
            'BUS_ACTION',
            'WB_AFFILIATED_POL',
            'WB_COV_SUB_AT_RISK',
            'WB_EVALUATION',
            'WB_FILLIN_ENDT',
            'WB_FLORIDA_WIND',
            'WB_LOSS',
            'WB_NEW_WTRCRAFT',
            'WB_POLICY_INFO',
            'WB_POLICY_NOTE',
            'WB_POLICY_TEXT',
            'WB_POL_INT_PARTY',
            'WB_POL_OUTSIDE_OCC',
            'WB_PRODUCER_ID',
            'WB_RESIDENCE',
            'WB_SCHEDULED_ITEM',
            'WB_VEHICLE',
            'WB_VEHICLE_OPER',
            'WM_CODE_TBL',
            'WORK_EVENT',
            'WORK_EVENT_ACTIVE',
            'WORK_EVENT_REASON',
            'UDTT_ALPHA_INDEX',
            'UDTT_ARCH_TIME_SRV',
            'UDTT_ARCH_W_C_W',
            'UDTT_ASGNEE_PROF',
            'UDTT_BUILD_OR_LOC',
            'UDTT_BUS_PURSUIT',
            'UDTT_CARRYOVER_POL',
            'UDTT_CHANGE_MASTER',
            'UDTT_COMPUTER_COV',
            'UDTT_COVERAGE',
            'UDTT_DEJA_VU',
            'UDTT_DWLNG_VL_INF',
            'UDTT_ENDORSEMENT',
            'UDTT_FLORIDA_WIND',
            'UDTT_GENL_POL_INFO',
            'UDTT_LATE_ITEM',
            'UDTT_LOSS',
            'UDTT_MANUSCRIPT',
            'UDTT_MP_TRACKING',
            'UDTT_MVR_ORDER',
            'UDTT_NEW_WTRCRAFT',
            'UDTT_NOTES',
            'UDTT_PAYOR',
            'UDTT_PCC_COVERAGE',
            'UDTT_POL_INT_PARTY',
            'UDTT_PRCS_PARM',
            'UDTT_RATING',
            'UDTT_REPORT',
            'UDTT_RPT_HIERARCHY',
            'UDTT_SCHED_CLASS',
            'UDTT_SCHED_ITEM',
            'UDTT_SPEC_PROP_CLS',
            'UDTT_TEMP_TIME_SRV',
            'UDTT_TIME_SERVICE',
            'UDTT_TIME_SLICE',
            'UDTT_TMP_WRK_CND_D',
            'UDTT_TMP_WRK_CND_W',
            'UDTT_UNDERLY_INS',
            'UDTT_UNDERWRITER',
            'UDTT_UWDECISION',
            'UDTT_WATERCRAFT',
            'UDTT_WORK_COMP_EMP',
            'UDTT_WORK_COND_D',
            'UDTT_WORK_COND_DAY',
            'UDTT_WORK_COND_W',
            'UDTT_WORK_COND_WK',
            'UDTT_WORK_QUEUE')
UNION ALL
SELECT 'PWS' AS APPLNAME,CREATOR,NAME,TYPE
  FROM SYSIBM.SYSTABLES
 WHERE CREATOR IN (
            'ESEWSMP')
   AND NAME IN (
            'UDTT_ALPHA_INDEX',
            'UDTT_ASGNEE_PROF',
            'UDTT_CHANGE_MASTER',
            'UDTT_DEJA_VU',
            'UDTT_MP_TRACKING',
            'UDTT_MVR_ORDER',
            'UDTT_WORK_COND_DAY',
            'UDTT_WORK_COND_WK',
            'UDTT_WORK_QUEUE')
UNION ALL
SELECT 'PWS' AS APPLNAME,CREATOR,NAME,TYPE
  FROM SYSIBM.SYSTABLES
 WHERE CREATOR IN (
            'UDT2KEF')
   AND NAME IN (
            'UDTT_ASGNEE_PROF')
