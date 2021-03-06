SELECT NAME FROM SYSIBM.SYSDATABASE
  WHERE NOT EXISTS (SELECT '1' FROM
       SYSIBM.SYSTABLESPACE WHERE DBNAME IN (
SELECT DISTINCT NAME FROM SYSIBM.SYSDATABASE
    WHERE NAME IN (
'DFLS0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DPER0A00',
'DUDT0A00',
'DUDT0A00',
'DUDT0A00',
'DUDT0A00',
'DUDT0A00',
'DUDT0A00',
'DUDT0A00',
'DUDT0A00',
'DUDT0A00',
'DUDT0A00',
'DUDT0A00',
'DUDT0A00',
'DUDT0A00',
'DUDT0A00',
'DUDT0A00',
'DUDT0A00',
'DUDT0A00',
'DUDT0A00',
'DUDT1A00',
'DUDT1A00',
'DUDT1A00',
'DUDT1A00',
'DUDT1A00',
'DUDT1A00',
'DUDT1A00',
'DUDT1A00',
'DUDT1A00',
'DUDT1A00',
'DUDT1A00',
'DUDT1A00',
'DUDT1B00',
'DUDT2A00',
'DUDT2A00',
'DUDT2A00',
'DUDT2A00',
'DUDT3A00',
'DUDT3A00',
'DUDT3A00',
'DUDT3A00',
'DUDT3A00',
'DUDT3A00',
'DUDT3A00',
'DUDT3A00',
'DUDT3A00',
'DUDT3A00',
'DUDT3A00',
'DUDT3A00',
'DUDT6B00',
'DUDT6B00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDT9A00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00',
'DUDTCA00'
)))
;
FIM;
--
-- LISTA JOBS NA SYSCOPY
--

SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       JOBNAME
  FROM SYSIBM.SYSTABLES T,
       SYSIBM.SYSCOPY C
 WHERE T.DBNAME = C.DBNAME
   AND T.TSNAME = C.TSNAME
   AND C.ICTYPE = 'F'
   AND T.TYPE = 'T'
   AND C.TIMESTAMP >= CURRENT TIMESTAMP - 45 DAYS
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
'DB2ACPT.PERT_ADDL_SRS_INFO',
'DB2ACPT.PERT_AUDIT_PARENT',
'DB2ACPT.PERT_AUDIT_TRAIL',
'DB2ACPT.PERT_BASELOOK',
'DB2ACPT.PERT_CLAIM_ASSIGN',
'DB2ACPT.PERT_CLAIM_INFO',
'DB2ACPT.PERT_CLAIM_VALUE',
'DB2ACPT.PERT_CLIENT_XREF',
'DB2ACPT.PERT_CLUE_INFO',
'DB2ACPT.PERT_COVERAGE',
'DB2ACPT.PERT_DUMMY1',
'DB2ACPT.PERT_DUMMY2',
'DB2ACPT.PERT_ENDORSEMENT',
'DB2ACPT.PERT_FILLIN_FORMS',
'DB2ACPT.PERT_FORMS_DEF',
'DB2ACPT.PERT_INT_PARTY',
'DB2ACPT.PERT_INT_PRTY_ADDR',
'DB2ACPT.PERT_INT_PRTY_DEMO',
'DB2ACPT.PERT_INT_PRTY_NAME',
'DB2ACPT.PERT_LIC_LOOKUP',
'DB2ACPT.PERT_NAME_LOOKUP',
'DB2ACPT.PERT_NC_INFO',
'DB2ACPT.PERT_NC_REASONS',
'DB2ACPT.PERT_NEW_CLIENT',
'DB2ACPT.PERT_NON_STD_VEH',
'DB2ACPT.PERT_NOTES',
'DB2ACPT.PERT_OPERATOR',
'DB2ACPT.PERT_OPR_RPT_LINK',
'DB2ACPT.PERT_POLNO_LOOKUP',
'DB2ACPT.PERT_PREMIUM',
'DB2ACPT.PERT_PRINT_IDCARDS',
'DB2ACPT.PERT_PRODUCER_XFER',
'DB2ACPT.PERT_RATE_TERR',
'DB2ACPT.PERT_RECID_LOOKUP',
'DB2ACPT.PERT_RPT_INFO',
'DB2ACPT.PERT_SIGNED_FORMS',
'DB2ACPT.PERT_STATE_FORMS',
'DB2ACPT.PERT_TRANSACTION',
'DB2ACPT.PERT_TRANS_MSG',
'DB2ACPT.PERT_UW_QUESTION',
'DB2ACPT.PERT_VEHICLE',
'DB2ACPT.PERT_VEH_POLICY',
'DB2ACPT.PERT_VIOLATION',
'DB2ACPT.ASSIGNEE',
'DB2ACPT.ASSIGNMENT',
'ESEWSMP.ASSIGNEE',
'ESEWSMP.ASSIGNMENT',
'UDT1JAM.ASSIGNEE',
'UDT1JAM.ASSIGNMENT',
'UDT2KEF.ASSIGNEE',
'DB2ACPT.BUS_ACTION',
'DB2PRVT.BUS_ACTION',
'ESEWSMP.BUS_ACTION',
'UDT1JAM.BUS_ACTION',
'DB2ACPT.BUSINESS_TASK',
'ESEWSMP.BUSINESS_TASK',
'UDT1JAM.BUSINESS_TASK',
'DB2ACPT.UDTT_ALPHA_INDEX',
'DB2ACPT.UDTT_ARCH_TIME_SRV',
'DB2ACPT.UDTT_ARCH_W_C_W',
'DB2ACPT.UDTT_ASGNEE_PROF',
'DB2ACPT.UDTT_BUILD_OR_LOC',
'DB2ACPT.UDTT_BUS_PURSUIT',
'DB2ACPT.UDTT_CARRYOVER_POL',
'DB2ACPT.UDTT_CHANGE_MASTER',
'DB2ACPT.UDTT_COMPUTER_COV',
'DB2ACPT.UDTT_COVERAGE',
'DB2ACPT.UDTT_DEJA_VU',
'DB2ACPT.UDTT_DWLNG_VL_INF',
'DB2ACPT.UDTT_ENDORSEMENT',
'DB2ACPT.UDTT_FLORIDA_WIND',
'DB2ACPT.UDTT_GENL_POL_INFO',
'DB2ACPT.UDTT_LATE_ITEM',
'DB2ACPT.UDTT_LOSS',
'DB2ACPT.UDTT_MANUSCRIPT',
'DB2ACPT.UDTT_MP_TRACKING',
'DB2ACPT.UDTT_MVR_ORDER',
'DB2ACPT.UDTT_NEW_WTRCRAFT',
'DB2ACPT.UDTT_NOTES',
'DB2ACPT.UDTT_PAYOR',
'DB2ACPT.UDTT_PCC_COVERAGE',
'DB2ACPT.UDTT_POL_INT_PARTY',
'DB2ACPT.UDTT_PRCS_PARM',
'DB2ACPT.UDTT_RATING',
'DB2ACPT.UDTT_REPORT',
'DB2ACPT.UDTT_RPT_HIERARCHY',
'DB2ACPT.UDTT_SCHED_CLASS',
'DB2ACPT.UDTT_SCHED_ITEM',
'DB2ACPT.UDTT_SPEC_PROP_CLS',
'DB2ACPT.UDTT_TEMP_TIME_SRV',
'DB2ACPT.UDTT_TIME_SERVICE',
'DB2ACPT.UDTT_TIME_SLICE',
'DB2ACPT.UDTT_TMP_WRK_CND_D',
'DB2ACPT.UDTT_TMP_WRK_CND_W',
'DB2ACPT.UDTT_UNDERLY_INS',
'DB2ACPT.UDTT_UNDERWRITER',
'DB2ACPT.UDTT_UWDECISION',
'DB2ACPT.UDTT_WATERCRAFT',
'DB2ACPT.UDTT_WORK_COMP_EMP',
'DB2ACPT.UDTT_WORK_COND_D',
'DB2ACPT.UDTT_WORK_COND_DAY',
'DB2ACPT.UDTT_WORK_COND_W',
'DB2ACPT.UDTT_WORK_COND_WK',
'DB2ACPT.UDTT_WORK_QUEUE',
'UDT1JAM.UDTT_ALPHA_INDEX',
'UDT1JAM.UDTT_BUILD_OR_LOC',
'UDT1JAM.UDTT_BUS_PURSUIT',
'UDT1JAM.UDTT_CHANGE_MASTER',
'UDT1JAM.UDTT_COMPUTER_COV',
'UDT1JAM.UDTT_COVERAGE',
'UDT1JAM.UDTT_DWLNG_VL_INF',
'UDT1JAM.UDTT_ENDORSEMENT',
'UDT1JAM.UDTT_GENL_POL_INFO',
'UDT1JAM.UDTT_MANUSCRIPT',
'UDT1JAM.UDTT_MVR_ORDER',
'UDT1JAM.UDTT_NOTES',
'UDT1JAM.UDTT_PAYOR',
'UDT1JAM.UDTT_PCC_COVERAGE',
'UDT1JAM.UDTT_POL_INT_PARTY',
'UDT1JAM.UDTT_PRCS_PARM',
'UDT1JAM.UDTT_RATING',
'UDT1JAM.UDTT_SCHED_CLASS',
'UDT1JAM.UDTT_SCHED_ITEM',
'UDT1JAM.UDTT_SPEC_PROP_CLS',
'UDT1JAM.UDTT_UNDERLY_INS',
'UDT1JAM.UDTT_WATERCRAFT',
'UDT1JAM.UDTT_WORK_COMP_EMP',
'UDT1JAM.UDTT_WORK_COND_DAY',
'UDT1JAM.UDTT_WORK_COND_WK',
'UDT1JAM.UDTT_WORK_QUEUE',
'UDT1LBS.UDTT_ARCH_TIME_SRV',
'UDT1LBS.UDTT_ARCH_W_C_W',
'UDT1LBS.UDTT_CARRYOVER_POL',
'UDT1LBS.UDTT_DEJA_VU',
'UDT1LBS.UDTT_LATE_ITEM',
'UDT1LBS.UDTT_RPT_HIERARCHY',
'UDT1LBS.UDTT_TEMP_TIME_SRV',
'UDT1LBS.UDTT_TIME_SERVICE',
'UDT1LBS.UDTT_TIME_SLICE',
'UDT1LBS.UDTT_TMP_WRK_CND_D',
'UDT1LBS.UDTT_TMP_WRK_CND_W',
'UDT1LBS.UDTT_WORK_COND_D',
'UDT1LBS.UDTT_WORK_COND_W',
'UDT1YSP.UDTT_ARCH_TIME_SRV',
'UDT1YSP.UDTT_ARCH_W_C_W',
'UDT1YSP.UDTT_CARRYOVER_POL',
'UDT1YSP.UDTT_LATE_ITEM',
'UDT1YSP.UDTT_RPT_HIERARCHY',
'UDT1YSP.UDTT_TEMP_TIME_SRV',
'UDT1YSP.UDTT_TIME_SERVICE',
'UDT1YSP.UDTT_TIME_SLICE',
'UDT1YSP.UDTT_TMP_WRK_CND_D',
'UDT1YSP.UDTT_TMP_WRK_CND_W',
'UDT1YSP.UDTT_WORK_COND_D',
'UDT1YSP.UDTT_WORK_COND_W',
'DB2ACPT.WB_AFFILIATED_POL',
'DB2ACPT.WB_COV_SUB_AT_RISK',
'DB2ACPT.WB_EVALUATION',
'DB2ACPT.WB_FILLIN_ENDT',
'DB2ACPT.WB_FLORIDA_WIND',
'DB2ACPT.WB_LOSS',
'DB2ACPT.WB_NEW_WTRCRAFT',
'DB2ACPT.WB_POLICY_INFO',
'DB2ACPT.WB_POLICY_NOTE',
'DB2ACPT.WB_POLICY_TEXT',
'DB2ACPT.WB_POL_INT_PARTY',
'DB2ACPT.WB_POL_OUTSIDE_OCC',
'DB2ACPT.WB_PRODUCER_ID',
'DB2ACPT.WB_RESIDENCE',
'DB2ACPT.WB_SCHEDULED_ITEM',
'DB2ACPT.WB_VEHICLE',
'DB2ACPT.WB_VEHICLE_OPER',
'ESEWSMP.WB_AFFILIATED_POL',
'ESEWSMP.WB_COV_SUB_AT_RISK',
'ESEWSMP.WB_EVALUATION',
'ESEWSMP.WB_FILLIN_ENDT',
'ESEWSMP.WB_POLICY_INFO',
'ESEWSMP.WB_POLICY_NOTE',
'ESEWSMP.WB_POLICY_TEXT',
'ESEWSMP.WB_POL_INT_PARTY',
'ESEWSMP.WB_POL_OUTSIDE_OCC',
'ESEWSMP.WB_PRODUCER_ID',
'ESEWSMP.WB_RESIDENCE',
'ESEWSMP.WB_SCHEDULED_ITEM',
'ESEWSMP.WB_VEHICLE',
'ESEWSMP.WB_VEHICLE_OPER',
'UDT1JAM.WB_AFFILIATED_POL',
'UDT1JAM.WB_COV_SUB_AT_RISK',
'UDT1JAM.WB_EVALUATION',
'UDT1JAM.WB_FILLIN_ENDT',
'UDT1JAM.WB_POLICY_INFO',
'UDT1JAM.WB_POLICY_NOTE',
'UDT1JAM.WB_POLICY_TEXT',
'UDT1JAM.WB_POL_INT_PARTY',
'UDT1JAM.WB_POL_OUTSIDE_OCC',
'UDT1JAM.WB_PRODUCER_ID',
'UDT1JAM.WB_RESIDENCE',
'UDT1JAM.WB_SCHEDULED_ITEM',
'UDT1JAM.WB_VEHICLE',
'UDT1JAM.WB_VEHICLE_OPER',
'UDT2KEF.WB_PRODUCER_ID',
'DB2ACPT.WM_CODE_TBL',
'ESEWSMP.WM_CODE_TBL',
'UDT1JAM.WM_CODE_TBL',
'DB2ACPT.WORK_EVENT',
'DB2ACPT.WORK_EVENT_ACTIVE',
'DB2ACPT.WORK_EVENT_REASON',
'ESEWSMP.WORK_EVENT',
'ESEWSMP.WORK_EVENT_ACTIVE',
'ESEWSMP.WORK_EVENT_REASON',
'UDT1JAM.WORK_EVENT',
'UDT1JAM.WORK_EVENT_ACTIVE',
'UDT1JAM.WORK_EVENT_REASON',
'DB2ACPT.FLST_POLCAL_TABLE'
)
;

--
-- GENERATE INCLUDES
--
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       'INCLUDE TABLESPACE '||
       STRIP(T.DBNAME)||'.'||STRIP(T.TSNAME)||
' -- '||STRIP(T.CREATOR)||'.'||STRIP(T.NAME),
S.NTABLES
  FROM SYSIBM.SYSTABLES T,
       SYSIBM.SYSTABLESPACE S
 WHERE T.DBNAME = S.DBNAME
   AND T.TSNAME = S.NAME
   AND T.TYPE = 'T'
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
'DB2ACPT.PERT_ADDL_SRS_INFO',
'DB2ACPT.PERT_AUDIT_PARENT',
'DB2ACPT.PERT_AUDIT_TRAIL',
'DB2ACPT.PERT_BASELOOK',
'DB2ACPT.PERT_CLAIM_ASSIGN',
'DB2ACPT.PERT_CLAIM_INFO',
'DB2ACPT.PERT_CLAIM_VALUE',
'DB2ACPT.PERT_CLIENT_XREF',
'DB2ACPT.PERT_CLUE_INFO',
'DB2ACPT.PERT_COVERAGE',
'DB2ACPT.PERT_DUMMY1',
'DB2ACPT.PERT_DUMMY2',
'DB2ACPT.PERT_ENDORSEMENT',
'DB2ACPT.PERT_FILLIN_FORMS',
'DB2ACPT.PERT_FORMS_DEF',
'DB2ACPT.PERT_INT_PARTY',
'DB2ACPT.PERT_INT_PRTY_ADDR',
'DB2ACPT.PERT_INT_PRTY_DEMO',
'DB2ACPT.PERT_INT_PRTY_NAME',
'DB2ACPT.PERT_LIC_LOOKUP',
'DB2ACPT.PERT_NAME_LOOKUP',
'DB2ACPT.PERT_NC_INFO',
'DB2ACPT.PERT_NC_REASONS',
'DB2ACPT.PERT_NEW_CLIENT',
'DB2ACPT.PERT_NON_STD_VEH',
'DB2ACPT.PERT_NOTES',
'DB2ACPT.PERT_OPERATOR',
'DB2ACPT.PERT_OPR_RPT_LINK',
'DB2ACPT.PERT_POLNO_LOOKUP',
'DB2ACPT.PERT_PREMIUM',
'DB2ACPT.PERT_PRINT_IDCARDS',
'DB2ACPT.PERT_PRODUCER_XFER',
'DB2ACPT.PERT_RATE_TERR',
'DB2ACPT.PERT_RECID_LOOKUP',
'DB2ACPT.PERT_RPT_INFO',
'DB2ACPT.PERT_SIGNED_FORMS',
'DB2ACPT.PERT_STATE_FORMS',
'DB2ACPT.PERT_TRANSACTION',
'DB2ACPT.PERT_TRANS_MSG',
'DB2ACPT.PERT_UW_QUESTION',
'DB2ACPT.PERT_VEHICLE',
'DB2ACPT.PERT_VEH_POLICY',
'DB2ACPT.PERT_VIOLATION',
'DB2ACPT.ASSIGNEE',
'DB2ACPT.ASSIGNMENT',
'ESEWSMP.ASSIGNEE',
'ESEWSMP.ASSIGNMENT',
'UDT1JAM.ASSIGNEE',
'UDT1JAM.ASSIGNMENT',
'UDT2KEF.ASSIGNEE',
'DB2ACPT.BUS_ACTION',
'DB2PRVT.BUS_ACTION',
'ESEWSMP.BUS_ACTION',
'UDT1JAM.BUS_ACTION',
'DB2ACPT.BUSINESS_TASK',
'ESEWSMP.BUSINESS_TASK',
'UDT1JAM.BUSINESS_TASK',
'DB2ACPT.UDTT_ALPHA_INDEX',
'DB2ACPT.UDTT_ARCH_TIME_SRV',
'DB2ACPT.UDTT_ARCH_W_C_W',
'DB2ACPT.UDTT_ASGNEE_PROF',
'DB2ACPT.UDTT_BUILD_OR_LOC',
'DB2ACPT.UDTT_BUS_PURSUIT',
'DB2ACPT.UDTT_CARRYOVER_POL',
'DB2ACPT.UDTT_CHANGE_MASTER',
'DB2ACPT.UDTT_COMPUTER_COV',
'DB2ACPT.UDTT_COVERAGE',
'DB2ACPT.UDTT_DEJA_VU',
'DB2ACPT.UDTT_DWLNG_VL_INF',
'DB2ACPT.UDTT_ENDORSEMENT',
'DB2ACPT.UDTT_FLORIDA_WIND',
'DB2ACPT.UDTT_GENL_POL_INFO',
'DB2ACPT.UDTT_LATE_ITEM',
'DB2ACPT.UDTT_LOSS',
'DB2ACPT.UDTT_MANUSCRIPT',
'DB2ACPT.UDTT_MP_TRACKING',
'DB2ACPT.UDTT_MVR_ORDER',
'DB2ACPT.UDTT_NEW_WTRCRAFT',
'DB2ACPT.UDTT_NOTES',
'DB2ACPT.UDTT_PAYOR',
'DB2ACPT.UDTT_PCC_COVERAGE',
'DB2ACPT.UDTT_POL_INT_PARTY',
'DB2ACPT.UDTT_PRCS_PARM',
'DB2ACPT.UDTT_RATING',
'DB2ACPT.UDTT_REPORT',
'DB2ACPT.UDTT_RPT_HIERARCHY',
'DB2ACPT.UDTT_SCHED_CLASS',
'DB2ACPT.UDTT_SCHED_ITEM',
'DB2ACPT.UDTT_SPEC_PROP_CLS',
'DB2ACPT.UDTT_TEMP_TIME_SRV',
'DB2ACPT.UDTT_TIME_SERVICE',
'DB2ACPT.UDTT_TIME_SLICE',
'DB2ACPT.UDTT_TMP_WRK_CND_D',
'DB2ACPT.UDTT_TMP_WRK_CND_W',
'DB2ACPT.UDTT_UNDERLY_INS',
'DB2ACPT.UDTT_UNDERWRITER',
'DB2ACPT.UDTT_UWDECISION',
'DB2ACPT.UDTT_WATERCRAFT',
'DB2ACPT.UDTT_WORK_COMP_EMP',
'DB2ACPT.UDTT_WORK_COND_D',
'DB2ACPT.UDTT_WORK_COND_DAY',
'DB2ACPT.UDTT_WORK_COND_W',
'DB2ACPT.UDTT_WORK_COND_WK',
'DB2ACPT.UDTT_WORK_QUEUE',
'UDT1JAM.UDTT_ALPHA_INDEX',
'UDT1JAM.UDTT_BUILD_OR_LOC',
'UDT1JAM.UDTT_BUS_PURSUIT',
'UDT1JAM.UDTT_CHANGE_MASTER',
'UDT1JAM.UDTT_COMPUTER_COV',
'UDT1JAM.UDTT_COVERAGE',
'UDT1JAM.UDTT_DWLNG_VL_INF',
'UDT1JAM.UDTT_ENDORSEMENT',
'UDT1JAM.UDTT_GENL_POL_INFO',
'UDT1JAM.UDTT_MANUSCRIPT',
'UDT1JAM.UDTT_MVR_ORDER',
'UDT1JAM.UDTT_NOTES',
'UDT1JAM.UDTT_PAYOR',
'UDT1JAM.UDTT_PCC_COVERAGE',
'UDT1JAM.UDTT_POL_INT_PARTY',
'UDT1JAM.UDTT_PRCS_PARM',
'UDT1JAM.UDTT_RATING',
'UDT1JAM.UDTT_SCHED_CLASS',
'UDT1JAM.UDTT_SCHED_ITEM',
'UDT1JAM.UDTT_SPEC_PROP_CLS',
'UDT1JAM.UDTT_UNDERLY_INS',
'UDT1JAM.UDTT_WATERCRAFT',
'UDT1JAM.UDTT_WORK_COMP_EMP',
'UDT1JAM.UDTT_WORK_COND_DAY',
'UDT1JAM.UDTT_WORK_COND_WK',
'UDT1JAM.UDTT_WORK_QUEUE',
'UDT1LBS.UDTT_ARCH_TIME_SRV',
'UDT1LBS.UDTT_ARCH_W_C_W',
'UDT1LBS.UDTT_CARRYOVER_POL',
'UDT1LBS.UDTT_DEJA_VU',
'UDT1LBS.UDTT_LATE_ITEM',
'UDT1LBS.UDTT_RPT_HIERARCHY',
'UDT1LBS.UDTT_TEMP_TIME_SRV',
'UDT1LBS.UDTT_TIME_SERVICE',
'UDT1LBS.UDTT_TIME_SLICE',
'UDT1LBS.UDTT_TMP_WRK_CND_D',
'UDT1LBS.UDTT_TMP_WRK_CND_W',
'UDT1LBS.UDTT_WORK_COND_D',
'UDT1LBS.UDTT_WORK_COND_W',
'UDT1YSP.UDTT_ARCH_TIME_SRV',
'UDT1YSP.UDTT_ARCH_W_C_W',
'UDT1YSP.UDTT_CARRYOVER_POL',
'UDT1YSP.UDTT_LATE_ITEM',
'UDT1YSP.UDTT_RPT_HIERARCHY',
'UDT1YSP.UDTT_TEMP_TIME_SRV',
'UDT1YSP.UDTT_TIME_SERVICE',
'UDT1YSP.UDTT_TIME_SLICE',
'UDT1YSP.UDTT_TMP_WRK_CND_D',
'UDT1YSP.UDTT_TMP_WRK_CND_W',
'UDT1YSP.UDTT_WORK_COND_D',
'UDT1YSP.UDTT_WORK_COND_W',
'DB2ACPT.WB_AFFILIATED_POL',
'DB2ACPT.WB_COV_SUB_AT_RISK',
'DB2ACPT.WB_EVALUATION',
'DB2ACPT.WB_FILLIN_ENDT',
'DB2ACPT.WB_FLORIDA_WIND',
'DB2ACPT.WB_LOSS',
'DB2ACPT.WB_NEW_WTRCRAFT',
'DB2ACPT.WB_POLICY_INFO',
'DB2ACPT.WB_POLICY_NOTE',
'DB2ACPT.WB_POLICY_TEXT',
'DB2ACPT.WB_POL_INT_PARTY',
'DB2ACPT.WB_POL_OUTSIDE_OCC',
'DB2ACPT.WB_PRODUCER_ID',
'DB2ACPT.WB_RESIDENCE',
'DB2ACPT.WB_SCHEDULED_ITEM',
'DB2ACPT.WB_VEHICLE',
'DB2ACPT.WB_VEHICLE_OPER',
'ESEWSMP.WB_AFFILIATED_POL',
'ESEWSMP.WB_COV_SUB_AT_RISK',
'ESEWSMP.WB_EVALUATION',
'ESEWSMP.WB_FILLIN_ENDT',
'ESEWSMP.WB_POLICY_INFO',
'ESEWSMP.WB_POLICY_NOTE',
'ESEWSMP.WB_POLICY_TEXT',
'ESEWSMP.WB_POL_INT_PARTY',
'ESEWSMP.WB_POL_OUTSIDE_OCC',
'ESEWSMP.WB_PRODUCER_ID',
'ESEWSMP.WB_RESIDENCE',
'ESEWSMP.WB_SCHEDULED_ITEM',
'ESEWSMP.WB_VEHICLE',
'ESEWSMP.WB_VEHICLE_OPER',
'UDT1JAM.WB_AFFILIATED_POL',
'UDT1JAM.WB_COV_SUB_AT_RISK',
'UDT1JAM.WB_EVALUATION',
'UDT1JAM.WB_FILLIN_ENDT',
'UDT1JAM.WB_POLICY_INFO',
'UDT1JAM.WB_POLICY_NOTE',
'UDT1JAM.WB_POLICY_TEXT',
'UDT1JAM.WB_POL_INT_PARTY',
'UDT1JAM.WB_POL_OUTSIDE_OCC',
'UDT1JAM.WB_PRODUCER_ID',
'UDT1JAM.WB_RESIDENCE',
'UDT1JAM.WB_SCHEDULED_ITEM',
'UDT1JAM.WB_VEHICLE',
'UDT1JAM.WB_VEHICLE_OPER',
'UDT2KEF.WB_PRODUCER_ID',
'DB2ACPT.WM_CODE_TBL',
'ESEWSMP.WM_CODE_TBL',
'UDT1JAM.WM_CODE_TBL',
'DB2ACPT.WORK_EVENT',
'DB2ACPT.WORK_EVENT_ACTIVE',
'DB2ACPT.WORK_EVENT_REASON',
'ESEWSMP.WORK_EVENT',
'ESEWSMP.WORK_EVENT_ACTIVE',
'ESEWSMP.WORK_EVENT_REASON',
'UDT1JAM.WORK_EVENT',
'UDT1JAM.WORK_EVENT_ACTIVE',
'UDT1JAM.WORK_EVENT_REASON',
'DB2ACPT.FLST_POLCAL_TABLE'
)
;

--
-- GEN
--
--DB='DQST0B00', TS='SCCS0B00';
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       'DB='||''''||
       STRIP(T.DBNAME)||''''||', TS='||''''||
       STRIP(T.TSNAME)||''''||';'
  FROM SYSIBM.SYSTABLES T,
       SYSIBM.SYSTABLESPACE S
 WHERE T.DBNAME = S.DBNAME
   AND T.TSNAME = S.NAME
   AND T.TYPE = 'T'
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
'DB2ACPT.PERT_ADDL_SRS_INFO',
'DB2ACPT.PERT_AUDIT_PARENT',
'DB2ACPT.PERT_AUDIT_TRAIL',
'DB2ACPT.PERT_BASELOOK',
'DB2ACPT.PERT_CLAIM_ASSIGN',
'DB2ACPT.PERT_CLAIM_INFO',
'DB2ACPT.PERT_CLAIM_VALUE',
'DB2ACPT.PERT_CLIENT_XREF',
'DB2ACPT.PERT_CLUE_INFO',
'DB2ACPT.PERT_COVERAGE',
'DB2ACPT.PERT_DUMMY1',
'DB2ACPT.PERT_DUMMY2',
'DB2ACPT.PERT_ENDORSEMENT',
'DB2ACPT.PERT_FILLIN_FORMS',
'DB2ACPT.PERT_FORMS_DEF',
'DB2ACPT.PERT_INT_PARTY',
'DB2ACPT.PERT_INT_PRTY_ADDR',
'DB2ACPT.PERT_INT_PRTY_DEMO',
'DB2ACPT.PERT_INT_PRTY_NAME',
'DB2ACPT.PERT_LIC_LOOKUP',
'DB2ACPT.PERT_NAME_LOOKUP',
'DB2ACPT.PERT_NC_INFO',
'DB2ACPT.PERT_NC_REASONS',
'DB2ACPT.PERT_NEW_CLIENT',
'DB2ACPT.PERT_NON_STD_VEH',
'DB2ACPT.PERT_NOTES',
'DB2ACPT.PERT_OPERATOR',
'DB2ACPT.PERT_OPR_RPT_LINK',
'DB2ACPT.PERT_POLNO_LOOKUP',
'DB2ACPT.PERT_PREMIUM',
'DB2ACPT.PERT_PRINT_IDCARDS',
'DB2ACPT.PERT_PRODUCER_XFER',
'DB2ACPT.PERT_RATE_TERR',
'DB2ACPT.PERT_RECID_LOOKUP',
'DB2ACPT.PERT_RPT_INFO',
'DB2ACPT.PERT_SIGNED_FORMS',
'DB2ACPT.PERT_STATE_FORMS',
'DB2ACPT.PERT_TRANSACTION',
'DB2ACPT.PERT_TRANS_MSG',
'DB2ACPT.PERT_UW_QUESTION',
'DB2ACPT.PERT_VEHICLE',
'DB2ACPT.PERT_VEH_POLICY',
'DB2ACPT.PERT_VIOLATION',
'DB2ACPT.ASSIGNEE',
'DB2ACPT.ASSIGNMENT',
'ESEWSMP.ASSIGNEE',
'ESEWSMP.ASSIGNMENT',
'UDT1JAM.ASSIGNEE',
'UDT1JAM.ASSIGNMENT',
'UDT2KEF.ASSIGNEE',
'DB2ACPT.BUS_ACTION',
'DB2PRVT.BUS_ACTION',
'ESEWSMP.BUS_ACTION',
'UDT1JAM.BUS_ACTION',
'DB2ACPT.BUSINESS_TASK',
'ESEWSMP.BUSINESS_TASK',
'UDT1JAM.BUSINESS_TASK',
'DB2ACPT.UDTT_ALPHA_INDEX',
'DB2ACPT.UDTT_ARCH_TIME_SRV',
'DB2ACPT.UDTT_ARCH_W_C_W',
'DB2ACPT.UDTT_ASGNEE_PROF',
'DB2ACPT.UDTT_BUILD_OR_LOC',
'DB2ACPT.UDTT_BUS_PURSUIT',
'DB2ACPT.UDTT_CARRYOVER_POL',
'DB2ACPT.UDTT_CHANGE_MASTER',
'DB2ACPT.UDTT_COMPUTER_COV',
'DB2ACPT.UDTT_COVERAGE',
'DB2ACPT.UDTT_DEJA_VU',
'DB2ACPT.UDTT_DWLNG_VL_INF',
'DB2ACPT.UDTT_ENDORSEMENT',
'DB2ACPT.UDTT_FLORIDA_WIND',
'DB2ACPT.UDTT_GENL_POL_INFO',
'DB2ACPT.UDTT_LATE_ITEM',
'DB2ACPT.UDTT_LOSS',
'DB2ACPT.UDTT_MANUSCRIPT',
'DB2ACPT.UDTT_MP_TRACKING',
'DB2ACPT.UDTT_MVR_ORDER',
'DB2ACPT.UDTT_NEW_WTRCRAFT',
'DB2ACPT.UDTT_NOTES',
'DB2ACPT.UDTT_PAYOR',
'DB2ACPT.UDTT_PCC_COVERAGE',
'DB2ACPT.UDTT_POL_INT_PARTY',
'DB2ACPT.UDTT_PRCS_PARM',
'DB2ACPT.UDTT_RATING',
'DB2ACPT.UDTT_REPORT',
'DB2ACPT.UDTT_RPT_HIERARCHY',
'DB2ACPT.UDTT_SCHED_CLASS',
'DB2ACPT.UDTT_SCHED_ITEM',
'DB2ACPT.UDTT_SPEC_PROP_CLS',
'DB2ACPT.UDTT_TEMP_TIME_SRV',
'DB2ACPT.UDTT_TIME_SERVICE',
'DB2ACPT.UDTT_TIME_SLICE',
'DB2ACPT.UDTT_TMP_WRK_CND_D',
'DB2ACPT.UDTT_TMP_WRK_CND_W',
'DB2ACPT.UDTT_UNDERLY_INS',
'DB2ACPT.UDTT_UNDERWRITER',
'DB2ACPT.UDTT_UWDECISION',
'DB2ACPT.UDTT_WATERCRAFT',
'DB2ACPT.UDTT_WORK_COMP_EMP',
'DB2ACPT.UDTT_WORK_COND_D',
'DB2ACPT.UDTT_WORK_COND_DAY',
'DB2ACPT.UDTT_WORK_COND_W',
'DB2ACPT.UDTT_WORK_COND_WK',
'DB2ACPT.UDTT_WORK_QUEUE',
'UDT1JAM.UDTT_ALPHA_INDEX',
'UDT1JAM.UDTT_BUILD_OR_LOC',
'UDT1JAM.UDTT_BUS_PURSUIT',
'UDT1JAM.UDTT_CHANGE_MASTER',
'UDT1JAM.UDTT_COMPUTER_COV',
'UDT1JAM.UDTT_COVERAGE',
'UDT1JAM.UDTT_DWLNG_VL_INF',
'UDT1JAM.UDTT_ENDORSEMENT',
'UDT1JAM.UDTT_GENL_POL_INFO',
'UDT1JAM.UDTT_MANUSCRIPT',
'UDT1JAM.UDTT_MVR_ORDER',
'UDT1JAM.UDTT_NOTES',
'UDT1JAM.UDTT_PAYOR',
'UDT1JAM.UDTT_PCC_COVERAGE',
'UDT1JAM.UDTT_POL_INT_PARTY',
'UDT1JAM.UDTT_PRCS_PARM',
'UDT1JAM.UDTT_RATING',
'UDT1JAM.UDTT_SCHED_CLASS',
'UDT1JAM.UDTT_SCHED_ITEM',
'UDT1JAM.UDTT_SPEC_PROP_CLS',
'UDT1JAM.UDTT_UNDERLY_INS',
'UDT1JAM.UDTT_WATERCRAFT',
'UDT1JAM.UDTT_WORK_COMP_EMP',
'UDT1JAM.UDTT_WORK_COND_DAY',
'UDT1JAM.UDTT_WORK_COND_WK',
'UDT1JAM.UDTT_WORK_QUEUE',
'UDT1LBS.UDTT_ARCH_TIME_SRV',
'UDT1LBS.UDTT_ARCH_W_C_W',
'UDT1LBS.UDTT_CARRYOVER_POL',
'UDT1LBS.UDTT_DEJA_VU',
'UDT1LBS.UDTT_LATE_ITEM',
'UDT1LBS.UDTT_RPT_HIERARCHY',
'UDT1LBS.UDTT_TEMP_TIME_SRV',
'UDT1LBS.UDTT_TIME_SERVICE',
'UDT1LBS.UDTT_TIME_SLICE',
'UDT1LBS.UDTT_TMP_WRK_CND_D',
'UDT1LBS.UDTT_TMP_WRK_CND_W',
'UDT1LBS.UDTT_WORK_COND_D',
'UDT1LBS.UDTT_WORK_COND_W',
'UDT1YSP.UDTT_ARCH_TIME_SRV',
'UDT1YSP.UDTT_ARCH_W_C_W',
'UDT1YSP.UDTT_CARRYOVER_POL',
'UDT1YSP.UDTT_LATE_ITEM',
'UDT1YSP.UDTT_RPT_HIERARCHY',
'UDT1YSP.UDTT_TEMP_TIME_SRV',
'UDT1YSP.UDTT_TIME_SERVICE',
'UDT1YSP.UDTT_TIME_SLICE',
'UDT1YSP.UDTT_TMP_WRK_CND_D',
'UDT1YSP.UDTT_TMP_WRK_CND_W',
'UDT1YSP.UDTT_WORK_COND_D',
'UDT1YSP.UDTT_WORK_COND_W',
'DB2ACPT.WB_AFFILIATED_POL',
'DB2ACPT.WB_COV_SUB_AT_RISK',
'DB2ACPT.WB_EVALUATION',
'DB2ACPT.WB_FILLIN_ENDT',
'DB2ACPT.WB_FLORIDA_WIND',
'DB2ACPT.WB_LOSS',
'DB2ACPT.WB_NEW_WTRCRAFT',
'DB2ACPT.WB_POLICY_INFO',
'DB2ACPT.WB_POLICY_NOTE',
'DB2ACPT.WB_POLICY_TEXT',
'DB2ACPT.WB_POL_INT_PARTY',
'DB2ACPT.WB_POL_OUTSIDE_OCC',
'DB2ACPT.WB_PRODUCER_ID',
'DB2ACPT.WB_RESIDENCE',
'DB2ACPT.WB_SCHEDULED_ITEM',
'DB2ACPT.WB_VEHICLE',
'DB2ACPT.WB_VEHICLE_OPER',
'ESEWSMP.WB_AFFILIATED_POL',
'ESEWSMP.WB_COV_SUB_AT_RISK',
'ESEWSMP.WB_EVALUATION',
'ESEWSMP.WB_FILLIN_ENDT',
'ESEWSMP.WB_POLICY_INFO',
'ESEWSMP.WB_POLICY_NOTE',
'ESEWSMP.WB_POLICY_TEXT',
'ESEWSMP.WB_POL_INT_PARTY',
'ESEWSMP.WB_POL_OUTSIDE_OCC',
'ESEWSMP.WB_PRODUCER_ID',
'ESEWSMP.WB_RESIDENCE',
'ESEWSMP.WB_SCHEDULED_ITEM',
'ESEWSMP.WB_VEHICLE',
'ESEWSMP.WB_VEHICLE_OPER',
'UDT1JAM.WB_AFFILIATED_POL',
'UDT1JAM.WB_COV_SUB_AT_RISK',
'UDT1JAM.WB_EVALUATION',
'UDT1JAM.WB_FILLIN_ENDT',
'UDT1JAM.WB_POLICY_INFO',
'UDT1JAM.WB_POLICY_NOTE',
'UDT1JAM.WB_POLICY_TEXT',
'UDT1JAM.WB_POL_INT_PARTY',
'UDT1JAM.WB_POL_OUTSIDE_OCC',
'UDT1JAM.WB_PRODUCER_ID',
'UDT1JAM.WB_RESIDENCE',
'UDT1JAM.WB_SCHEDULED_ITEM',
'UDT1JAM.WB_VEHICLE',
'UDT1JAM.WB_VEHICLE_OPER',
'UDT2KEF.WB_PRODUCER_ID',
'DB2ACPT.WM_CODE_TBL',
'ESEWSMP.WM_CODE_TBL',
'UDT1JAM.WM_CODE_TBL',
'DB2ACPT.WORK_EVENT',
'DB2ACPT.WORK_EVENT_ACTIVE',
'DB2ACPT.WORK_EVENT_REASON',
'ESEWSMP.WORK_EVENT',
'ESEWSMP.WORK_EVENT_ACTIVE',
'ESEWSMP.WORK_EVENT_REASON',
'UDT1JAM.WORK_EVENT',
'UDT1JAM.WORK_EVENT_ACTIVE',
'UDT1JAM.WORK_EVENT_REASON',
'DB2ACPT.FLST_POLCAL_TABLE'
)
;

--
-- FREE PACKAGE
--
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       'FREE PACKAGE ('||STRIP(COLLID)||'.'||STRIP(NAME)||')'
  FROM SYSIBM.SYSPACKAGE
WHERE STRIP(COLLID)||'.'||STRIP(NAME) IN (
'PERP_COVVER.PERTCNTR',
'PERP_COVVER.PERTCOVC',
'PERP_COVVER.PERTDESC',
'PERP_COVVER.PERTFERI',
'PERP_COVVER.PERTMNDT',
'PERP_DBIO.PERT1200',
'PERP_DBIO.PERTIOD1',
'PERP_DBIO.PERTIOG3',
'PERP_DBIO.PERTWMBL',
'PERP_WM.PERP803D',
'PERP_WM.PERT2110',
'PERP_WM.PERTWMGT',
'POLP_AUTOONLINE.POLT1200',
'POLP_AUTOONLINE.POLT1210',
'POLP_AUTOONLINE.POLT2011',
'POLP_AUTOONLINE.POLT2021',
'POLP_RATE.POLT6M03',
'POLV_CSU_PROD_INQ.POLT1210',
'PERP_AUTO.PIPPCSU0',
'PERP_AUTO.PIPTVLKX',
'PERP_AUTOENTRY.PIPRFORM',
'PERP_DBIO.PIPP803D',
'PERP_DBIO.PIPTCLNT',
'PERP_DBIO.PIPTF110',
'PERP_DBIO.PIPTIOFF',
'PERP_W8.PIPP803D',
'POLP_AUTOONLINE.PIPT8M05',
'POLP_AUTOONLINE.PIPT9M21',
'POLP_AUTOONLINE.PIPTF110',
'POLV_AUTOONLINE.PIPT9M21',
'POLV_AUTOONLINE.PIPTF110',
'HIP5_SCHM.HIPTENVR',
'HIP5_SCHMA.HIPTENVR',
'PERP_HOME.HIPPD211',
'PERP_HOME.HIPPD300',
'PERP_HOME.HIPPENDT',
'PERP_HOME.HIPPFILL',
'PERP_HOME.HIPRW100',
'PERP_HOME.HIPTEPDP',
'PERP_HOME.HIPTEPDQ',
'PERP_PUT.HIPPFVRP',
'PERP_PUT.HIPPPWSF',
'PERP_PUT.HIPPSFDT',
'PERP_PUT.HIPT4891',
'PERP_PUT.HIPTENVR',
'PERP_FIRE.FLSTPCIO',
'PERP_WM.FLSTPCIO',
'PERP_HOME.SEEPD100',
'PERP_HOME.SEEPD210',
'PERP_HOME.SEEPD211',
'PERP_HOME.SEEPD220',
'PERP_HOME.SEEPD230',
'PERP_HOME.SEEPD300',
'PERP_HOME.SEEPP110',
'PERP_HOME.SEEPP120',
'PERP_HOME.SEEPP130',
'PERP_HOME.SEEPP140',
'PERP_HOME.SEEPP150',
'PERP_HOME.SEEPR150',
'PERP_HOME.SEERAI01',
'PERP_HOME.SEERD110',
'PERP_HOME.SEERD210',
'PERP_HOME.SEERD220',
'PERP_HOME.SEERD247',
'PERP_HOME.SEERN110',
'PERP_HOME.SEERPILK',
'PERP_HOME.SEERPINF',
'PERP_HOME.SEERREF1',
'PERP_HOME.SEERT200',
'PERP_HOME.SEERTBQ0',
'PERP_HOME.SEERTCM0',
'PERP_HOME.SEERTCO0',
'PERP_HOME.SEERTCV0',
'PERP_HOME.SEERTDC0',
'PERP_HOME.SEERTDV0',
'PERP_HOME.SEERTED0',
'PERP_HOME.SEERTFW0',
'PERP_HOME.SEERTGP0',
'PERP_HOME.SEERTIP0',
'PERP_HOME.SEERTLS0',
'PERP_HOME.SEERTMS0',
'PERP_HOME.SEERTNT0',
'PERP_HOME.SEERTNW0',
'PERP_HOME.SEERTPC0',
'PERP_HOME.SEERTPE0',
'PERP_HOME.SEERTPM0',
'PERP_HOME.SEERTPU0',
'PERP_HOME.SEERTRA0',
'PERP_HOME.SEERTRC0',
'PERP_HOME.SEERTRP0',
'PERP_HOME.SEERTSK0',
'PERP_HOME.SEERTSM0',
'PERP_HOME.SEERTUI0',
'PERP_HOME.SEERTUW0',
'PERP_HOME.SEERTWK0',
'PERP_HOME.SEERTWM0',
'PERP_HOME.SEERUW02',
'PERP_PWS.SEERCLNT',
'PERP_PWS.SEERMTCL',
'PERP_UTIL.SEERDPCH',
'PERP_UTIL.SEERLPCH',
'PERP_UTIL.SEERPUR1',
'PERP_UTIL.SEERRFNB',
'PERP_UTIL.SEERVPCH',
'PERP_WM.SEEPD300',
'PERP_WM.SEEPPUR1',
'PERX_HOME.SEEPD211',
'PER4_DBIO.UDTRR500',
'PER4_DBIO.UDTRR510',
'PER4_WM.UDTRR500',
'PER5_DBIO.UDTRR510',
'PER5_WM.UDTRR500',
'PER6_DBIO.UDTRR510',
'PERP_DBIO.UDTRR510',
'PERP_HOME.UDTPB100',
'PERP_HOME.UDTPCOVA',
'PERP_HOME.UDTPD410',
'PERP_HOME.UDTPD411',
'PERP_HOME.UDTPD412',
'PERP_HOME.UDTPD420',
'PERP_HOME.UDTPD500',
'PERP_HOME.UDTPD600',
'PERP_HOME.UDTPD700',
'PERP_HOME.UDTPDEJA',
'PERP_HOME.UDTPDLWD',
'PERP_HOME.UDTPE140',
'PERP_HOME.UDTPERRR',
'PERP_HOME.UDTPFFWI',
'PERP_HOME.UDTPH300',
'PERP_HOME.UDTPLOCU',
'PERP_HOME.UDTPM600',
'PERP_HOME.UDTPO200',
'PERP_HOME.UDTPPAGI',
'PERP_HOME.UDTPPCC',
'PERP_HOME.UDTPR150',
'PERP_HOME.UDTPR235',
'PERP_HOME.UDTPR236',
'PERP_HOME.UDTPR240',
'PERP_HOME.UDTPR310',
'PERP_HOME.UDTPU135',
'PERP_HOME.UDTRD410',
'PERP_HOME.UDTRD420',
'PERP_HOME.UDTRD500',
'PERP_HOME.UDTRERRR',
'PERP_HOME.UDTRPAGI',
'PERP_HOME.UDTRR240',
'PERP_HOME.UDTRR310',
'PERP_UTIL.UDTPLPOL',
'PERP_UTIL.UDTPM400',
'PERP_UTIL.UDTPM410',
'PERP_UTIL.UDTPM420',
'PERP_UTIL.UDTPM430',
'PERP_UTIL.UDTPP100',
'PERP_UTIL.UDTPR240',
'PERP_UTIL.UDTPRPOL',
'PERP_UTIL.UDTPVPOL',
'PERP_UTIL.UDTRP100',
'PERP_UTIL.UDTRP200',
'PERP_WM.UDTPCONV',
'PERP_WM.UDTPQ050',
'PERP_WM.UDTPR100',
'PERP_WM.UDTPR110',
'PERP_WM.UDTPR120',
'PERP_WM.UDTPR130',
'PERP_WM.UDTPR140',
'PERP_WM.UDTPR150',
'PERP_WM.UDTPR160',
'PERP_WM.UDTRPRCT',
'PERP_WM.UDTRR130',
'PERP_WM.UDTRR150',
'PERP_WM.UDTRR160',
'PERP_WM.UDTRR200',
'PERP_WM.UDTRR210',
'PERP_WM.UDTRR220',
'PERP_WM.UDTRR244',
'PERP_WM.UDTRR245',
'PERP_WM.UDTRR246',
'PERP_WM.UDTRR247',
'PERP_WM.UDTRR248',
'PERP_WM.UDTRR300',
'PERP_WM.UDTRR310',
'PERP_WM.UDTRR400',
'PERP_WM.UDTRR500',
'PERP_WM.UDTRR510',
'PERP_WMR.UDTRR235',
'PERP_WMR.UDTRR236',
'PERP_WMR.UDTRT236',
'PERP_WMR.UDTRW235',
'PERP_WMR.UDTRW236',
'PERP_WM_FIX.UDTPCONV',
'PERP_WM_FIX.UDTPWMFX',
'PERT_DBIO.UDTRR510',
'PERX_WM.UDTPR130',
'UDTP_UDTRT236.UDTRT236',
'PERP_WMR.WMRPW201',
'PERP_WMR.WMRPW203',
'PERP_WMR.WMRPW204',
'PERP_WMR.WMRPW231',
'PERP_WMR.WMRPW232',
'PERP_WMR.WMRRW201',
'PERP_WMR.WMRRW203',
'PERP_WMR.WMRRW204',
'PERP_WMR.WMRRW231',
'PERP_WMR.WMRRW232'
)
;

--
-- FREE PLAN
--
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       'FREE PLAN ('||STRIP(NAME)||')'
  FROM SYSIBM.SYSPLAN
WHERE STRIP(CREATOR)||'.'||STRIP(NAME)  IN (
'DB2ACPT.SEEPD300',
'DB2ACPT.SEEPDCH1',
'DB2ACPT.SEEPFDT1',
'DB2ACPT.SEEPIC01',
'DB2ACPT.SEEPIC02',
'DB2ACPT.SEEPIC03',
'DB2ACPT.SEEPIC04',
'DB2ACPT.SEEPIN01',
'DB2ACPT.SEEPIN06',
'DB2ACPT.SEEPIN07',
'DB2ACPT.SEEPIW01',
'DB2ACPT.SEEPIW02',
'DB2ACPT.SEEPIW03',
'DB2ACPT.SEEPIW04',
'DB2ACPT.SEEPIW05',
'DB2ACPT.SEEPIW06',
'DB2ACPT.SEEPIW07',
'DB2ACPT.SEEPIW08',
'DB2ACPT.SEEPLCH1',
'DB2ACPT.SEEPMITT',
'DB2ACPT.SEEPPUR1',
'DB2ACPT.SEEPR150',
'DB2ACPT.SEEPREF1',
'DB2ACPT.SEEPRFN1',
'DB2ACPT.SEEPUC01',
'DB2ACPT.SEEPUC02',
'DB2ACPT.SEEPUC03',
'DB2ACPT.SEEPUC04',
'DB2ACPT.SEEPUN02',
'DB2ACPT.SEEPUN04',
'DB2ACPT.SEEPUN05',
'DB2ACPT.SEEPUW01',
'DB2ACPT.SEEPUW02',
'DB2ACPT.SEEPVCH1',
'UDT1MWT.UDT1MWT1',
'UDT1YSP.UDTFCVA1',
'UDT1YSP.UDTFCVA2',
'DB2ACPT.UDTPB100',
'DB2ACPT.UDTPCON1',
'DB2ACPT.UDTPCONV',
'DB2ACPT.UDTPCVA1',
'DB2ACPT.UDTPDEJA',
'DB2ACPT.UDTPDLWD',
'DB2ACPT.UDTPE420',
'DB2ACPT.UDTPFFWI',
'DB2ACPT.UDTPH200',
'DB2ACPT.UDTPH300',
'DB2ACPT.UDTPHOH1',
'DB2ACPT.UDTPINIT',
'DB2ACPT.UDTPK400',
'DB2ACPT.UDTPLOCU',
'DB2ACPT.UDTPLPL1',
'DB2ACPT.UDTPM600',
'DB2ACPT.UDTPNYNY',
'DB2ACPT.UDTPONL1',
'DB2ACPT.UDTPP100',
'DB2ACPT.UDTPP200',
'DB2ACPT.UDTPPAGI',
'DB2ACPT.UDTPPCC ;',
'DB2ACPT.UDTPPRCT',
'DB2ACPT.UDTPR110',
'DB2ACPT.UDTPR140',
'DB2ACPT.UDTPR150',
'DB2ACPT.UDTPR160',
'DB2ACPT.UDTPR230',
'UDT1LBS.UDTPR235',
'UDT1LBS.UDTPR236',
'DB2ACPT.UDTPR240',
'DB2ACPT.UDTPR3PA',
'DB2ACPT.UDTPR3PP',
'DB2ACPT.UDTPRPL1',
'DB2ACPT.UDTPRPOL',
'DB2ACPT.UDTPTAB1',
'DB2ACPT.UDTPVPL1',
'DB2ACPT.UDTPWIT1',
'DB2ACPT.UDTPWMFX',
'DB2ACPT.WMRPR230',
'DB2ACPT.WMRPR231',
'DB2ACPT.WMRPW201',
'DB2ACPT.WMRPW203',
'DB2ACPT.WMRPW204',
'DB2ACPT.WMRPW205',
'DB2ACPT.WMRPW230',
'DB2ACPT.WMRPW231',
'DB2ACPT.WMRPW232',
'DB2ACPT.HIP7PVIX',
'DB2ACPT.HIPPD211',
'DB2ACPT.HIPPD300',
'DB2ACPT.HIPPENDT',
'DB2ACPT.HIPPEPAS',
'DB2ACPT.HIPPFMRP',
'DB2ACPT.HIPPH300',
'DB2ACPT.HIPPH900',
'DB2ACPT.HIPPOPRP',
'DB2ACPT.HIPPPMSH',
'DB2ACPT.HIPPPVIX',
'DB2ACPT.HIPPPWSF',
'DB2ACPT.HIPPRCST',
'DB2ACPT.HIPPRERP',
'DB2ACPT.HIPPSFDT',
'DB2ACPT.HIPPT300',
'DB2ACPT.HIPPU300',
'DB2ACPT.HIPPW100',
'DB2ACPT.HIPRH900',
'DB2ACPT.HIPXH900',
'DB2ACPT.PER7803D',
'DB2ACPT.PERE9001',
'DB2ACPT.PERP5000',
'DB2ACPT.PERP803D',
'DB2ACPT.PERPWMBL',
'DB2ACPT.POLP2010',
'DB2ACPT.POLP2020',
'DB2ACPT.PIP74100',
'DB2ACPT.PIPP4100',
'DB2ACPT.PIPP9001',
'DB2ACPT.PIPPCSU0',
'DB2ACPT.PIPPFORM',
'DB2ACPT.FLSPF001',
'DB2ACPT.FLSPF050',
'DB2ACPT.FLSPF109',
'DB2ACPT.FLSPF200',
'DB2ACPT.FLSRF109',
'DB2ACPT.HRNPPCLI'
)
;



--
-- DROP TABLESPACE
--

SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
'DROP TABLESPACE '||STRIP(T.DBNAME)||'.'||STRIP(T.TSNAME)||
'; -- '||STRIP(T.CREATOR)||'.'||STRIP(T.NAME)
  FROM SYSIBM.SYSTABLES T
 WHERE T.TYPE = 'T'
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
'DB2ACPT.PERT_ADDL_SRS_INFO',
'DB2ACPT.PERT_AUDIT_PARENT',
'DB2ACPT.PERT_AUDIT_TRAIL',
'DB2ACPT.PERT_BASELOOK',
'DB2ACPT.PERT_CLAIM_ASSIGN',
'DB2ACPT.PERT_CLAIM_INFO',
'DB2ACPT.PERT_CLAIM_VALUE',
'DB2ACPT.PERT_CLIENT_XREF',
'DB2ACPT.PERT_CLUE_INFO',
'DB2ACPT.PERT_COVERAGE',
'DB2ACPT.PERT_DUMMY1',
'DB2ACPT.PERT_DUMMY2',
'DB2ACPT.PERT_ENDORSEMENT',
'DB2ACPT.PERT_FILLIN_FORMS',
'DB2ACPT.PERT_FORMS_DEF',
'DB2ACPT.PERT_INT_PARTY',
'DB2ACPT.PERT_INT_PRTY_ADDR',
'DB2ACPT.PERT_INT_PRTY_DEMO',
'DB2ACPT.PERT_INT_PRTY_NAME',
'DB2ACPT.PERT_LIC_LOOKUP',
'DB2ACPT.PERT_NAME_LOOKUP',
'DB2ACPT.PERT_NC_INFO',
'DB2ACPT.PERT_NC_REASONS',
'DB2ACPT.PERT_NEW_CLIENT',
'DB2ACPT.PERT_NON_STD_VEH',
'DB2ACPT.PERT_NOTES',
'DB2ACPT.PERT_OPERATOR',
'DB2ACPT.PERT_OPR_RPT_LINK',
'DB2ACPT.PERT_POLNO_LOOKUP',
'DB2ACPT.PERT_PREMIUM',
'DB2ACPT.PERT_PRINT_IDCARDS',
'DB2ACPT.PERT_PRODUCER_XFER',
'DB2ACPT.PERT_RATE_TERR',
'DB2ACPT.PERT_RECID_LOOKUP',
'DB2ACPT.PERT_RPT_INFO',
'DB2ACPT.PERT_SIGNED_FORMS',
'DB2ACPT.PERT_STATE_FORMS',
'DB2ACPT.PERT_TRANSACTION',
'DB2ACPT.PERT_TRANS_MSG',
'DB2ACPT.PERT_UW_QUESTION',
'DB2ACPT.PERT_VEHICLE',
'DB2ACPT.PERT_VEH_POLICY',
'DB2ACPT.PERT_VIOLATION',
'DB2ACPT.ASSIGNEE',
'DB2ACPT.ASSIGNMENT',
'ESEWSMP.ASSIGNEE',
'ESEWSMP.ASSIGNMENT',
'UDT1JAM.ASSIGNEE',
'UDT1JAM.ASSIGNMENT',
'UDT2KEF.ASSIGNEE',
'DB2ACPT.BUS_ACTION',
'DB2PRVT.BUS_ACTION',
'ESEWSMP.BUS_ACTION',
'UDT1JAM.BUS_ACTION',
'DB2ACPT.BUSINESS_TASK',
'ESEWSMP.BUSINESS_TASK',
'UDT1JAM.BUSINESS_TASK',
'DB2ACPT.UDTT_ALPHA_INDEX',
'DB2ACPT.UDTT_ARCH_TIME_SRV',
'DB2ACPT.UDTT_ARCH_W_C_W',
'DB2ACPT.UDTT_ASGNEE_PROF',
'DB2ACPT.UDTT_BUILD_OR_LOC',
'DB2ACPT.UDTT_BUS_PURSUIT',
'DB2ACPT.UDTT_CARRYOVER_POL',
'DB2ACPT.UDTT_CHANGE_MASTER',
'DB2ACPT.UDTT_COMPUTER_COV',
'DB2ACPT.UDTT_COVERAGE',
'DB2ACPT.UDTT_DEJA_VU',
'DB2ACPT.UDTT_DWLNG_VL_INF',
'DB2ACPT.UDTT_ENDORSEMENT',
'DB2ACPT.UDTT_FLORIDA_WIND',
'DB2ACPT.UDTT_GENL_POL_INFO',
'DB2ACPT.UDTT_LATE_ITEM',
'DB2ACPT.UDTT_LOSS',
'DB2ACPT.UDTT_MANUSCRIPT',
'DB2ACPT.UDTT_MP_TRACKING',
'DB2ACPT.UDTT_MVR_ORDER',
'DB2ACPT.UDTT_NEW_WTRCRAFT',
'DB2ACPT.UDTT_NOTES',
'DB2ACPT.UDTT_PAYOR',
'DB2ACPT.UDTT_PCC_COVERAGE',
'DB2ACPT.UDTT_POL_INT_PARTY',
'DB2ACPT.UDTT_PRCS_PARM',
'DB2ACPT.UDTT_RATING',
'DB2ACPT.UDTT_REPORT',
'DB2ACPT.UDTT_RPT_HIERARCHY',
'DB2ACPT.UDTT_SCHED_CLASS',
'DB2ACPT.UDTT_SCHED_ITEM',
'DB2ACPT.UDTT_SPEC_PROP_CLS',
'DB2ACPT.UDTT_TEMP_TIME_SRV',
'DB2ACPT.UDTT_TIME_SERVICE',
'DB2ACPT.UDTT_TIME_SLICE',
'DB2ACPT.UDTT_TMP_WRK_CND_D',
'DB2ACPT.UDTT_TMP_WRK_CND_W',
'DB2ACPT.UDTT_UNDERLY_INS',
'DB2ACPT.UDTT_UNDERWRITER',
'DB2ACPT.UDTT_UWDECISION',
'DB2ACPT.UDTT_WATERCRAFT',
'DB2ACPT.UDTT_WORK_COMP_EMP',
'DB2ACPT.UDTT_WORK_COND_D',
'DB2ACPT.UDTT_WORK_COND_DAY',
'DB2ACPT.UDTT_WORK_COND_W',
'DB2ACPT.UDTT_WORK_COND_WK',
'DB2ACPT.UDTT_WORK_QUEUE',
'UDT1JAM.UDTT_ALPHA_INDEX',
'UDT1JAM.UDTT_BUILD_OR_LOC',
'UDT1JAM.UDTT_BUS_PURSUIT',
'UDT1JAM.UDTT_CHANGE_MASTER',
'UDT1JAM.UDTT_COMPUTER_COV',
'UDT1JAM.UDTT_COVERAGE',
'UDT1JAM.UDTT_DWLNG_VL_INF',
'UDT1JAM.UDTT_ENDORSEMENT',
'UDT1JAM.UDTT_GENL_POL_INFO',
'UDT1JAM.UDTT_MANUSCRIPT',
'UDT1JAM.UDTT_MVR_ORDER',
'UDT1JAM.UDTT_NOTES',
'UDT1JAM.UDTT_PAYOR',
'UDT1JAM.UDTT_PCC_COVERAGE',
'UDT1JAM.UDTT_POL_INT_PARTY',
'UDT1JAM.UDTT_PRCS_PARM',
'UDT1JAM.UDTT_RATING',
'UDT1JAM.UDTT_SCHED_CLASS',
'UDT1JAM.UDTT_SCHED_ITEM',
'UDT1JAM.UDTT_SPEC_PROP_CLS',
'UDT1JAM.UDTT_UNDERLY_INS',
'UDT1JAM.UDTT_WATERCRAFT',
'UDT1JAM.UDTT_WORK_COMP_EMP',
'UDT1JAM.UDTT_WORK_COND_DAY',
'UDT1JAM.UDTT_WORK_COND_WK',
'UDT1JAM.UDTT_WORK_QUEUE',
'UDT1LBS.UDTT_ARCH_TIME_SRV',
'UDT1LBS.UDTT_ARCH_W_C_W',
'UDT1LBS.UDTT_CARRYOVER_POL',
'UDT1LBS.UDTT_DEJA_VU',
'UDT1LBS.UDTT_LATE_ITEM',
'UDT1LBS.UDTT_RPT_HIERARCHY',
'UDT1LBS.UDTT_TEMP_TIME_SRV',
'UDT1LBS.UDTT_TIME_SERVICE',
'UDT1LBS.UDTT_TIME_SLICE',
'UDT1LBS.UDTT_TMP_WRK_CND_D',
'UDT1LBS.UDTT_TMP_WRK_CND_W',
'UDT1LBS.UDTT_WORK_COND_D',
'UDT1LBS.UDTT_WORK_COND_W',
'UDT1YSP.UDTT_ARCH_TIME_SRV',
'UDT1YSP.UDTT_ARCH_W_C_W',
'UDT1YSP.UDTT_CARRYOVER_POL',
'UDT1YSP.UDTT_LATE_ITEM',
'UDT1YSP.UDTT_RPT_HIERARCHY',
'UDT1YSP.UDTT_TEMP_TIME_SRV',
'UDT1YSP.UDTT_TIME_SERVICE',
'UDT1YSP.UDTT_TIME_SLICE',
'UDT1YSP.UDTT_TMP_WRK_CND_D',
'UDT1YSP.UDTT_TMP_WRK_CND_W',
'UDT1YSP.UDTT_WORK_COND_D',
'UDT1YSP.UDTT_WORK_COND_W',
'DB2ACPT.WB_AFFILIATED_POL',
'DB2ACPT.WB_COV_SUB_AT_RISK',
'DB2ACPT.WB_EVALUATION',
'DB2ACPT.WB_FILLIN_ENDT',
'DB2ACPT.WB_FLORIDA_WIND',
'DB2ACPT.WB_LOSS',
'DB2ACPT.WB_NEW_WTRCRAFT',
'DB2ACPT.WB_POLICY_INFO',
'DB2ACPT.WB_POLICY_NOTE',
'DB2ACPT.WB_POLICY_TEXT',
'DB2ACPT.WB_POL_INT_PARTY',
'DB2ACPT.WB_POL_OUTSIDE_OCC',
'DB2ACPT.WB_PRODUCER_ID',
'DB2ACPT.WB_RESIDENCE',
'DB2ACPT.WB_SCHEDULED_ITEM',
'DB2ACPT.WB_VEHICLE',
'DB2ACPT.WB_VEHICLE_OPER',
'ESEWSMP.WB_AFFILIATED_POL',
'ESEWSMP.WB_COV_SUB_AT_RISK',
'ESEWSMP.WB_EVALUATION',
'ESEWSMP.WB_FILLIN_ENDT',
'ESEWSMP.WB_POLICY_INFO',
'ESEWSMP.WB_POLICY_NOTE',
'ESEWSMP.WB_POLICY_TEXT',
'ESEWSMP.WB_POL_INT_PARTY',
'ESEWSMP.WB_POL_OUTSIDE_OCC',
'ESEWSMP.WB_PRODUCER_ID',
'ESEWSMP.WB_RESIDENCE',
'ESEWSMP.WB_SCHEDULED_ITEM',
'ESEWSMP.WB_VEHICLE',
'ESEWSMP.WB_VEHICLE_OPER',
'UDT1JAM.WB_AFFILIATED_POL',
'UDT1JAM.WB_COV_SUB_AT_RISK',
'UDT1JAM.WB_EVALUATION',
'UDT1JAM.WB_FILLIN_ENDT',
'UDT1JAM.WB_POLICY_INFO',
'UDT1JAM.WB_POLICY_NOTE',
'UDT1JAM.WB_POLICY_TEXT',
'UDT1JAM.WB_POL_INT_PARTY',
'UDT1JAM.WB_POL_OUTSIDE_OCC',
'UDT1JAM.WB_PRODUCER_ID',
'UDT1JAM.WB_RESIDENCE',
'UDT1JAM.WB_SCHEDULED_ITEM',
'UDT1JAM.WB_VEHICLE',
'UDT1JAM.WB_VEHICLE_OPER',
'UDT2KEF.WB_PRODUCER_ID',
'DB2ACPT.WM_CODE_TBL',
'ESEWSMP.WM_CODE_TBL',
'UDT1JAM.WM_CODE_TBL',
'DB2ACPT.WORK_EVENT',
'DB2ACPT.WORK_EVENT_ACTIVE',
'DB2ACPT.WORK_EVENT_REASON',
'ESEWSMP.WORK_EVENT',
'ESEWSMP.WORK_EVENT_ACTIVE',
'ESEWSMP.WORK_EVENT_REASON',
'UDT1JAM.WORK_EVENT',
'UDT1JAM.WORK_EVENT_ACTIVE',
'UDT1JAM.WORK_EVENT_REASON',
'DB2ACPT.FLST_POLCAL_TABLE'
)
;

