      ******************************************************************
      * DCLGEN TABLE(DB2TEST.MACA_S4_GLASS)                            *
      *        LIBRARY(IBM1JCF.DB2.SQLLIB(MACAS4T0))                   *
      *        ACTION(REPLACE)                                         *
      *        LANGUAGE(COBOL)                                         *
      *        STRUCTURE(MACA_S4_GLASS)                                *
      *        QUOTE                                                   *
      *        INDVAR(YES)                                             *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE DB2TEST.MACA_S4_GLASS TABLE
           ( S4_SAR_TABLE_TYP               CHAR(2) NOT NULL,
             S4_BA_ID                       CHAR(11) NOT NULL,
             S4_BA_BK_DT                    CHAR(6) NOT NULL,
             S4_CAGE_EVAL_CD                CHAR(1) NOT NULL,
             S4_PARR_ID                     CHAR(8) NOT NULL,
             S4_POL_AGN_BLL_IND             CHAR(1) NOT NULL,
             S4_POL_BND_ID_CD               CHAR(1) NOT NULL,
             S4_POL_CAG_ID                  CHAR(8) NOT NULL,
             S4_POL_COVP_CD                 CHAR(4) NOT NULL,
             S4_POL_EMPACCT_IND             CHAR(1) NOT NULL,
             S4_POL_EXCESS_TYP              CHAR(2) NOT NULL,
             S4_POL_EXP_CD                  CHAR(1) NOT NULL,
             S4_POL_FF_ISEG_CD              CHAR(2) NOT NULL,
             S4_POL_FFMP_CD                 CHAR(4) NOT NULL,
             S4_POL_ID                      CHAR(11) NOT NULL,
             S4_POL_IN_CLMMD_DT             CHAR(6) NOT NULL,
             S4_POL_INSD_NM_TXT             CHAR(70) NOT NULL,
             S4_POL_INTSTT_IND              CHAR(1) NOT NULL,
             S4_POL_INVPJURS_ID             CHAR(4) NOT NULL,
             S4_POL_INVP_TYP                CHAR(4) NOT NULL,
             S4_POL_LG_ACCT_IND             CHAR(1) NOT NULL,
             S4_POL_LGLEFACL_ID             CHAR(11) NOT NULL,
             S4_POL_NI_LGLE_ID              CHAR(11) NOT NULL,
             S4_POL_NTL_TM_IND              CHAR(1) NOT NULL,
             S4_POL_MAP_CD                  CHAR(4) NOT NULL,
             S4_POL_MAP_JURS_ID             CHAR(4) NOT NULL,
             S4_POL_MKTG_ID                 CHAR(6) NOT NULL,
             S4_POL_MR_PT_NBR               CHAR(2) NOT NULL,
             S4_POL_MR_RNG_CD               CHAR(2) NOT NULL,
             S4_POL_NEW_ENT_IND             CHAR(1) NOT NULL,
             S4_POL_ORG_INCP_DT             DATE,
             S4_POL_POA_LVL_CD              CHAR(1) NOT NULL,
             S4_POL_PR_PFX_CD               CHAR(3) NOT NULL,
             S4_POL_PR_PREM_AMT             DECIMAL(9, 0) NOT NULL,
             S4_POL_RETRO_CD                CHAR(1) NOT NULL,
             S4_POL_RGN_TM_IND              CHAR(1) NOT NULL,
             S4_POL_RISK_ID                 CHAR(3) NOT NULL,
             S4_POL_SRCE_CD                 CHAR(1) NOT NULL,
             S4_POL_SRD_BOB_CD              CHAR(2) NOT NULL,
             S4_POL_SRD_UG_CD               CHAR(1) NOT NULL,
             S4_POL_SRD_UGDT_CD             CHAR(3) NOT NULL,
             S4_POL_STATFOR_IND             CHAR(1) NOT NULL,
             S4_POL_SUBCESS_TYP             CHAR(1) NOT NULL,
             S4_POL_SVC_RSK_IND             CHAR(1) NOT NULL,
             S4_POL_TERM_EFF_DT             DATE,
             S4_POL_TERM_EXP_DT             DATE,
             S4_POL_TM_SZ_CD                CHAR(1) NOT NULL,
             S4_POL_TYPCONTR_CD             CHAR(1) NOT NULL,
             S4_POL_UWPGM_CD                CHAR(3) NOT NULL,
             S4_POL_VNDRLGLE_ID             CHAR(11) NOT NULL,
             S4_POL_VTG_YR                  CHAR(4) NOT NULL,
             S4_POL_XS_LAYER_CD             CHAR(1) NOT NULL,
             S4_POLP_UW_ORGU_ID             CHAR(6) NOT NULL,
             S4_BAI_TYP                     CHAR(4) NOT NULL,
             S4_BED_FININST_TYP             CHAR(4) NOT NULL,
             S4_BED_NONPROF_IND             CHAR(1) NOT NULL,
             S4_CD_CERT_DEC_ID              CHAR(10) NOT NULL,
             S4_CSAR_BENSTR_CD              CHAR(1) NOT NULL,
             S4_CSAR_BIND_TYP               CHAR(3) NOT NULL,
             S4_CSAR_BLKENT_IND             CHAR(1) NOT NULL,
             S4_CSAR_COVC_CD                CHAR(4) NOT NULL,
             S4_CSAR_COVP_CD                CHAR(4) NOT NULL,
             S4_CSAR_CVV_CD                 CHAR(4) NOT NULL,
             S4_CSAR_DEVRAT_IND             CHAR(1) NOT NULL,
             S4_CSAR_EFF_DT                 DATE,
             S4_CSAR_EXP_DT                 DATE,
             S4_CSAR_FFIUNT_NBR             CHAR(3) NOT NULL,
             S4_CSAR_FFISEQ_NBR             CHAR(2) NOT NULL,
             S4_CSAR_GRADCOM_CD             CHAR(2) NOT NULL,
             S4_CSAR_HILO_IND               CHAR(1) NOT NULL,
             S4_CSAR_LRGDED_IND             CHAR(1) NOT NULL,
             S4_CSAR_LTD_CD_TYP             CHAR(1) NOT NULL,
             S4_CSAR_MAJ_LN_CD              CHAR(2) NOT NULL,
             S4_CSAR_MIN_LN_CD              CHAR(2) NOT NULL,
             S4_CSAR_MCOFF_CD               CHAR(3) NOT NULL,
             S4_CSAR_JURS_ID                CHAR(4) NOT NULL,
             S4_CSAR_NEW_RNW_CD             CHAR(1) NOT NULL,
             S4_CSAR_NSTT_IND               CHAR(1) NOT NULL,
             S4_CSAR_OTH_COV_CD             CHAR(1) NOT NULL,
             S4_CSAR_PCOV_TYP               CHAR(2) NOT NULL,
             S4_CSAR_PHDP_CD                CHAR(4) NOT NULL,
             S4_CSAR_PHDP_TYP               CHAR(4) NOT NULL,
             S4_CSAR_RATETYP_CD             CHAR(1) NOT NULL,
             S4_CSAR_RETRO_CD               CHAR(1) NOT NULL,
             S4_CSAR_RETRO_DT               DATE,
             S4_CSAR_RPFORM_IND             CHAR(1) NOT NULL,
             S4_CSAR_RTGP_CD                CHAR(6) NOT NULL,
             S4_CSAR_TRM_BEG_DT             DATE,
             S4_CSAR_TRM_END_DT             DATE,
             S4_CSAR_TRSM_CD                CHAR(1) NOT NULL,
             S4_CSAR_XEQK_IND               CHAR(1) NOT NULL,
             S4_CSAR_XEXPL_IND              CHAR(1) NOT NULL,
             S4_CSAR_XSPL_IND               CHAR(1) NOT NULL,
             S4_CSAR_XTHFT_IND              CHAR(1) NOT NULL,
             S4_CSAR_XVNDL_IND              CHAR(1) NOT NULL,
             S4_CSAR_XWIND_IND              CHAR(1) NOT NULL,
             S4_DFIP_PUBLICH_CD             CHAR(1) NOT NULL,
             S4_ESTT_LIMIT_CD               CHAR(1) NOT NULL,
             S4_ESTT_LIMIT_CD2              CHAR(1) NOT NULL,
             S4_ESTT_POA_RNG_CD             CHAR(2) NOT NULL,
             S4_ESTT_POARNG_CD2             CHAR(2) NOT NULL,
             S4_ESTT_TRTY_ID                CHAR(6) NOT NULL,
             S4_ESTT_TRTY_ID2               CHAR(6) NOT NULL,
             S4_FEMP_ADJ_RT_IND             CHAR(1) NOT NULL,
             S4_FEMP_RNG_CD                 CHAR(1) NOT NULL,
             S4_FEMP_TYP                    CHAR(1) NOT NULL,
             S4_FRF_CD                      CHAR(2) NOT NULL,
             S4_PHPC_DIV_YR_NBR             CHAR(1) NOT NULL,
             S4_PHPC_DIVTRM_NBR             CHAR(1) NOT NULL,
             S4_PHPC_LCF_FCTR               DECIMAL(7, 4) NOT NULL,
             S4_PHPC_VALU_NBR               CHAR(2) NOT NULL,
             S4_PLOC_AREA_CD                CHAR(6) NOT NULL,
             S4_PLOC_AREA_CD2               CHAR(6) NOT NULL,
             S4_PLOC_AREA_CD3               CHAR(6) NOT NULL,
             S4_PLOC_ATYP_CD                CHAR(6) NOT NULL,
             S4_PLOC_ATYP_CD2               CHAR(6) NOT NULL,
             S4_PLOC_ATYP_CD3               CHAR(6) NOT NULL,
             S4_PLOC_CANP_CD                CHAR(2) NOT NULL,
             S4_PLOC_CTRY_CD                CHAR(3) NOT NULL,
             S4_PLOC_ST_CD                  CHAR(2) NOT NULL,
             S4_PLOC_ZIP_CD                 CHAR(9) NOT NULL,
             S4_PREM_COFF_CD                CHAR(3) NOT NULL,
             S4_PREM_PAYP_CD                CHAR(4) NOT NULL,
             S4_PREM_RETRO_IND              CHAR(1) NOT NULL,
             S4_PREM_SSRC_CD                CHAR(5) NOT NULL,
             S4_PREM_SSRC_TYP               CHAR(2) NOT NULL,
             S4_PREM_STRA_CD                CHAR(2) NOT NULL,
             S4_PUBE_TYP                    CHAR(2) NOT NULL,
             S4_RES_CONST_TYP               CHAR(3) NOT NULL,
             S4_RES_FAM_RNG_CD              CHAR(1) NOT NULL,
             S4_RES_HSUSWND_IND             CHAR(1) NOT NULL,
             S4_RES_OCC_TYP                 CHAR(1) NOT NULL,
             S4_RES_PREMS_TYP               CHAR(2) NOT NULL,
             S4_SAI_EXT_COV_CD              CHAR(1) NOT NULL,
             S4_SAI_TYP                     CHAR(3) NOT NULL,
             S4_SAR_HST_PROT_CD             CHAR(2) NOT NULL,
             S4_SAR_PKGP_CD                 CHAR(4) NOT NULL,
             S4_SAR_PUB_PROT_CD             CHAR(2) NOT NULL,
             S4_SAR_TYP                     CHAR(4) NOT NULL,
             S4_UISR_PRIMARY_CD             CHAR(1) NOT NULL,
             S4_UISR_TYP                    CHAR(2) NOT NULL,
             S4_ULYL_MFG_BW_CD              CHAR(1) NOT NULL,
             S4_ULYL_MFG_PTW_CD             CHAR(1) NOT NULL,
             S4_ULYL_POA_RNG_CD             CHAR(2) NOT NULL,
             S4_CLD_ADJ_CLM_DT              DATE,
             S4_CLD_CAT_INCI_CD             CHAR(6) NOT NULL,
             S4_CLD_CMPN_FIL_ID             CHAR(11) NOT NULL,
             S4_CLD_OCUR_DT                 DATE,
             S4_CLM_SUB_OFF_NBR             CHAR(3) NOT NULL,
             S4_CLM_ATLAS_YR                CHAR(2) NOT NULL,
             S4_CLM_SEQ_NBR                 CHAR(6) NOT NULL,
             S4_CSCL_HISTCOL_CD             CHAR(3) NOT NULL,
             S4_CSCS_BA_ID                  CHAR(11) NOT NULL,
             S4_CSCS_BA_SEQ_NBR             DECIMAL(5, 0) NOT NULL,
             S4_CSD_CT_IND                  CHAR(1) NOT NULL,
             S4_CSFX_ID                     CHAR(3) NOT NULL,
             S4_CTD_INCIDENT_CD             CHAR(1) NOT NULL,
             S4_CD_ID                       CHAR(11) NOT NULL,
             S4_CD_EFF_DT                   DATE,
             S4_CD_EXP_DT                   DATE,
             S4_GLS_ABC_CD                  CHAR(5) NOT NULL,
             S4_GLS_GLSC_CD                 CHAR(2) NOT NULL,
             S4_GLS_SCHED_IND               CHAR(1) NOT NULL,
             S4_GLS_TBOP_CD                 CHAR(3) NOT NULL,
             S4_GLS_TYP                     CHAR(1) NOT NULL,
             S4_BA_END_DT                   DATE,
             S4_BA_PREV_ID                  CHAR(11) NOT NULL,
             S4_BA_PREV_SEQ_NBR             DECIMAL(5, 0) NOT NULL,
             S4_BA_SRCE_STR_ID              CHAR(9) NOT NULL,
             S4_CBA_RSN_CD                  CHAR(7) NOT NULL,
             S4_CBA_TYP                     CHAR(4) NOT NULL,
             S4_SSD_SFIL_ID                 CHAR(17) NOT NULL,
             S4_SSD_PRCS_PER_YR             CHAR(4) NOT NULL,
             S4_DED_DEDC_CD                 CHAR(3) NOT NULL,
             S4_DED_LDAP_CD                 CHAR(3) NOT NULL,
             S4_DED_AMT                     DECIMAL(11, 2) NOT NULL,
             S4_DED_AMT_RNG_CD              CHAR(3) NOT NULL,
             S4_DED_CAP_AMT                 DECIMAL(9, 0) NOT NULL,
             S4_DED_METH_TYP                CHAR(3) NOT NULL,
             S4_DED_MIN_AMT                 DECIMAL(11, 0) NOT NULL,
             S4_DED_PCT                     DECIMAL(7, 4) NOT NULL,
             S4_DED_PCT_RNG_CD              CHAR(1) NOT NULL,
             S4_DED_POA_IND                 CHAR(1) NOT NULL,
             S4_LMT_LMTC_CD                 CHAR(5) NOT NULL,
             S4_LMT_LDAP_CD                 CHAR(3) NOT NULL,
             S4_LMT_AMT                     DECIMAL(11, 2) NOT NULL,
             S4_LMT_AMT_RNG_CD              CHAR(3) NOT NULL,
             S4_LMT_CMPN_BD_CD              CHAR(5) NOT NULL,
             S4_LMT_STACK_CD                CHAR(1) NOT NULL,
             S4_LMT_SUBLMT_IND              CHAR(1) NOT NULL,
             S4_LMT_VALU_TYP                CHAR(3) NOT NULL,
             S4_LMT_XS_IND                  CHAR(1) NOT NULL,
             S4_LMT_XSPCTRG_CD              CHAR(1) NOT NULL,
             S4_CLM_CONV_IND                CHAR(1),
             S4_CLM_CONV_DT                 DATE
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE DB2TEST.MACA_S4_GLASS              *
      ******************************************************************
       01  MACA_S4_GLASS.
           10 S4-SAR-TABLE-TYP     PIC X(2).
           10 S4-BA-ID             PIC X(11).
           10 S4-BA-BK-DT          PIC X(6).
           10 S4-CAGE-EVAL-CD      PIC X(1).
           10 S4-PARR-ID           PIC X(8).
           10 S4-POL-AGN-BLL-IND   PIC X(1).
           10 S4-POL-BND-ID-CD     PIC X(1).
           10 S4-POL-CAG-ID        PIC X(8).
           10 S4-POL-COVP-CD       PIC X(4).
           10 S4-POL-EMPACCT-IND   PIC X(1).
           10 S4-POL-EXCESS-TYP    PIC X(2).
           10 S4-POL-EXP-CD        PIC X(1).
           10 S4-POL-FF-ISEG-CD    PIC X(2).
           10 S4-POL-FFMP-CD       PIC X(4).
           10 S4-POL-ID            PIC X(11).
           10 S4-POL-IN-CLMMD-DT   PIC X(6).
           10 S4-POL-INSD-NM-TXT   PIC X(70).
           10 S4-POL-INTSTT-IND    PIC X(1).
           10 S4-POL-INVPJURS-ID   PIC X(4).
           10 S4-POL-INVP-TYP      PIC X(4).
           10 S4-POL-LG-ACCT-IND   PIC X(1).
           10 S4-POL-LGLEFACL-ID   PIC X(11).
           10 S4-POL-NI-LGLE-ID    PIC X(11).
           10 S4-POL-NTL-TM-IND    PIC X(1).
           10 S4-POL-MAP-CD        PIC X(4).
           10 S4-POL-MAP-JURS-ID   PIC X(4).
           10 S4-POL-MKTG-ID       PIC X(6).
           10 S4-POL-MR-PT-NBR     PIC X(2).
           10 S4-POL-MR-RNG-CD     PIC X(2).
           10 S4-POL-NEW-ENT-IND   PIC X(1).
           10 S4-POL-ORG-INCP-DT   PIC X(10).
           10 S4-POL-POA-LVL-CD    PIC X(1).
           10 S4-POL-PR-PFX-CD     PIC X(3).
           10 S4-POL-PR-PREM-AMT   PIC S9(9)V USAGE COMP-3.
           10 S4-POL-RETRO-CD      PIC X(1).
           10 S4-POL-RGN-TM-IND    PIC X(1).
           10 S4-POL-RISK-ID       PIC X(3).
           10 S4-POL-SRCE-CD       PIC X(1).
           10 S4-POL-SRD-BOB-CD    PIC X(2).
           10 S4-POL-SRD-UG-CD     PIC X(1).
           10 S4-POL-SRD-UGDT-CD   PIC X(3).
           10 S4-POL-STATFOR-IND   PIC X(1).
           10 S4-POL-SUBCESS-TYP   PIC X(1).
           10 S4-POL-SVC-RSK-IND   PIC X(1).
           10 S4-POL-TERM-EFF-DT   PIC X(10).
           10 S4-POL-TERM-EXP-DT   PIC X(10).
           10 S4-POL-TM-SZ-CD      PIC X(1).
           10 S4-POL-TYPCONTR-CD   PIC X(1).
           10 S4-POL-UWPGM-CD      PIC X(3).
           10 S4-POL-VNDRLGLE-ID   PIC X(11).
           10 S4-POL-VTG-YR        PIC X(4).
           10 S4-POL-XS-LAYER-CD   PIC X(1).
           10 S4-POLP-UW-ORGU-ID   PIC X(6).
           10 S4-BAI-TYP           PIC X(4).
           10 S4-BED-FININST-TYP   PIC X(4).
           10 S4-BED-NONPROF-IND   PIC X(1).
           10 S4-CD-CERT-DEC-ID    PIC X(10).
           10 S4-CSAR-BENSTR-CD    PIC X(1).
           10 S4-CSAR-BIND-TYP     PIC X(3).
           10 S4-CSAR-BLKENT-IND   PIC X(1).
           10 S4-CSAR-COVC-CD      PIC X(4).
           10 S4-CSAR-COVP-CD      PIC X(4).
           10 S4-CSAR-CVV-CD       PIC X(4).
           10 S4-CSAR-DEVRAT-IND   PIC X(1).
           10 S4-CSAR-EFF-DT       PIC X(10).
           10 S4-CSAR-EXP-DT       PIC X(10).
           10 S4-CSAR-FFIUNT-NBR   PIC X(3).
           10 S4-CSAR-FFISEQ-NBR   PIC X(2).
           10 S4-CSAR-GRADCOM-CD   PIC X(2).
           10 S4-CSAR-HILO-IND     PIC X(1).
           10 S4-CSAR-LRGDED-IND   PIC X(1).
           10 S4-CSAR-LTD-CD-TYP   PIC X(1).
           10 S4-CSAR-MAJ-LN-CD    PIC X(2).
           10 S4-CSAR-MIN-LN-CD    PIC X(2).
           10 S4-CSAR-MCOFF-CD     PIC X(3).
           10 S4-CSAR-JURS-ID      PIC X(4).
           10 S4-CSAR-NEW-RNW-CD   PIC X(1).
           10 S4-CSAR-NSTT-IND     PIC X(1).
           10 S4-CSAR-OTH-COV-CD   PIC X(1).
           10 S4-CSAR-PCOV-TYP     PIC X(2).
           10 S4-CSAR-PHDP-CD      PIC X(4).
           10 S4-CSAR-PHDP-TYP     PIC X(4).
           10 S4-CSAR-RATETYP-CD   PIC X(1).
           10 S4-CSAR-RETRO-CD     PIC X(1).
           10 S4-CSAR-RETRO-DT     PIC X(10).
           10 S4-CSAR-RPFORM-IND   PIC X(1).
           10 S4-CSAR-RTGP-CD      PIC X(6).
           10 S4-CSAR-TRM-BEG-DT   PIC X(10).
           10 S4-CSAR-TRM-END-DT   PIC X(10).
           10 S4-CSAR-TRSM-CD      PIC X(1).
           10 S4-CSAR-XEQK-IND     PIC X(1).
           10 S4-CSAR-XEXPL-IND    PIC X(1).
           10 S4-CSAR-XSPL-IND     PIC X(1).
           10 S4-CSAR-XTHFT-IND    PIC X(1).
           10 S4-CSAR-XVNDL-IND    PIC X(1).
           10 S4-CSAR-XWIND-IND    PIC X(1).
           10 S4-DFIP-PUBLICH-CD   PIC X(1).
           10 S4-ESTT-LIMIT-CD     PIC X(1).
           10 S4-ESTT-LIMIT-CD2    PIC X(1).
           10 S4-ESTT-POA-RNG-CD   PIC X(2).
           10 S4-ESTT-POARNG-CD2   PIC X(2).
           10 S4-ESTT-TRTY-ID      PIC X(6).
           10 S4-ESTT-TRTY-ID2     PIC X(6).
           10 S4-FEMP-ADJ-RT-IND   PIC X(1).
           10 S4-FEMP-RNG-CD       PIC X(1).
           10 S4-FEMP-TYP          PIC X(1).
           10 S4-FRF-CD            PIC X(2).
           10 S4-PHPC-DIV-YR-NBR   PIC X(1).
           10 S4-PHPC-DIVTRM-NBR   PIC X(1).
           10 S4-PHPC-LCF-FCTR     PIC S9(3)V9(4) USAGE COMP-3.
           10 S4-PHPC-VALU-NBR     PIC X(2).
           10 S4-PLOC-AREA-CD      PIC X(6).
           10 S4-PLOC-AREA-CD2     PIC X(6).
           10 S4-PLOC-AREA-CD3     PIC X(6).
           10 S4-PLOC-ATYP-CD      PIC X(6).
           10 S4-PLOC-ATYP-CD2     PIC X(6).
           10 S4-PLOC-ATYP-CD3     PIC X(6).
           10 S4-PLOC-CANP-CD      PIC X(2).
           10 S4-PLOC-CTRY-CD      PIC X(3).
           10 S4-PLOC-ST-CD        PIC X(2).
           10 S4-PLOC-ZIP-CD       PIC X(9).
           10 S4-PREM-COFF-CD      PIC X(3).
           10 S4-PREM-PAYP-CD      PIC X(4).
           10 S4-PREM-RETRO-IND    PIC X(1).
           10 S4-PREM-SSRC-CD      PIC X(5).
           10 S4-PREM-SSRC-TYP     PIC X(2).
           10 S4-PREM-STRA-CD      PIC X(2).
           10 S4-PUBE-TYP          PIC X(2).
           10 S4-RES-CONST-TYP     PIC X(3).
           10 S4-RES-FAM-RNG-CD    PIC X(1).
           10 S4-RES-HSUSWND-IND   PIC X(1).
           10 S4-RES-OCC-TYP       PIC X(1).
           10 S4-RES-PREMS-TYP     PIC X(2).
           10 S4-SAI-EXT-COV-CD    PIC X(1).
           10 S4-SAI-TYP           PIC X(3).
           10 S4-SAR-HST-PROT-CD   PIC X(2).
           10 S4-SAR-PKGP-CD       PIC X(4).
           10 S4-SAR-PUB-PROT-CD   PIC X(2).
           10 S4-SAR-TYP           PIC X(4).
           10 S4-UISR-PRIMARY-CD   PIC X(1).
           10 S4-UISR-TYP          PIC X(2).
           10 S4-ULYL-MFG-BW-CD    PIC X(1).
           10 S4-ULYL-MFG-PTW-CD   PIC X(1).
           10 S4-ULYL-POA-RNG-CD   PIC X(2).
           10 S4-CLD-ADJ-CLM-DT    PIC X(10).
           10 S4-CLD-CAT-INCI-CD   PIC X(6).
           10 S4-CLD-CMPN-FIL-ID   PIC X(11).
           10 S4-CLD-OCUR-DT       PIC X(10).
           10 S4-CLM-SUB-OFF-NBR   PIC X(3).
           10 S4-CLM-ATLAS-YR      PIC X(2).
           10 S4-CLM-SEQ-NBR       PIC X(6).
           10 S4-CSCL-HISTCOL-CD   PIC X(3).
           10 S4-CSCS-BA-ID        PIC X(11).
           10 S4-CSCS-BA-SEQ-NBR   PIC S9(5)V USAGE COMP-3.
           10 S4-CSD-CT-IND        PIC X(1).
           10 S4-CSFX-ID           PIC X(3).
           10 S4-CTD-INCIDENT-CD   PIC X(1).
           10 S4-CD-ID             PIC X(11).
           10 S4-CD-EFF-DT         PIC X(10).
           10 S4-CD-EXP-DT         PIC X(10).
           10 S4-GLS-ABC-CD        PIC X(5).
           10 S4-GLS-GLSC-CD       PIC X(2).
           10 S4-GLS-SCHED-IND     PIC X(1).
           10 S4-GLS-TBOP-CD       PIC X(3).
           10 S4-GLS-TYP           PIC X(1).
           10 S4-BA-END-DT         PIC X(10).
           10 S4-BA-PREV-ID        PIC X(11).
           10 S4-BA-PREV-SEQ-NBR   PIC S9(5)V USAGE COMP-3.
           10 S4-BA-SRCE-STR-ID    PIC X(9).
           10 S4-CBA-RSN-CD        PIC X(7).
           10 S4-CBA-TYP           PIC X(4).
           10 S4-SSD-SFIL-ID       PIC X(17).
           10 S4-SSD-PRCS-PER-YR   PIC X(4).
           10 S4-DED-DEDC-CD       PIC X(3).
           10 S4-DED-LDAP-CD       PIC X(3).
           10 S4-DED-AMT           PIC S9(9)V9(2) USAGE COMP-3.
           10 S4-DED-AMT-RNG-CD    PIC X(3).
           10 S4-DED-CAP-AMT       PIC S9(9)V USAGE COMP-3.
           10 S4-DED-METH-TYP      PIC X(3).
           10 S4-DED-MIN-AMT       PIC S9(11)V USAGE COMP-3.
           10 S4-DED-PCT           PIC S9(3)V9(4) USAGE COMP-3.
           10 S4-DED-PCT-RNG-CD    PIC X(1).
           10 S4-DED-POA-IND       PIC X(1).
           10 S4-LMT-LMTC-CD       PIC X(5).
           10 S4-LMT-LDAP-CD       PIC X(3).
           10 S4-LMT-AMT           PIC S9(9)V9(2) USAGE COMP-3.
           10 S4-LMT-AMT-RNG-CD    PIC X(3).
           10 S4-LMT-CMPN-BD-CD    PIC X(5).
           10 S4-LMT-STACK-CD      PIC X(1).
           10 S4-LMT-SUBLMT-IND    PIC X(1).
           10 S4-LMT-VALU-TYP      PIC X(3).
           10 S4-LMT-XS-IND        PIC X(1).
           10 S4-LMT-XSPCTRG-CD    PIC X(1).
           10 S4-CLM-CONV-IND      PIC X(1).
           10 S4-CLM-CONV-DT       PIC X(10).
      ******************************************************************
      * INDICATOR VARIABLE STRUCTURE                                   *
      ******************************************************************
       01  IMACA-S4-GLASS.
           10 INDSTRUC           PIC S9(4) USAGE COMP OCCURS 195 TIMES.
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 195     *
      ******************************************************************
