//IBM1JCFD JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',
//         MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=L,NOTIFY=IBM1JCF
/*JOBPARM Z=O,HOLD=ALL,S=ASYS,T=1439
//*--------------------------------------------------------------------
//*  DB2A - DB2A.DB2REPLACE NOCOPYPEND
//*  DB2D - DB2S.DB2LOAD/DB2S.DB2RUNLB
//*  DB2J - DB2K.DB2LOAD/DB2K.DB2RUNLB
//*  DB2E - DB2F.DB2LOAD/DB2F.DB2RUNLB
//*  DB2H - DB2H.DB2LOAD/DB2H.DB2RUNLB
//*  DB2P - DB2C.DB2LOAD/DB2C.DB2RUNLB
//*  DB2Q - DB2R.DB2LOAD/DB2R.DB2RUNLB
//*--------------------------------------------------------------------
//        JCLLIB ORDER=(DBA5.DB2.PROCLIB)
//LOAD    EXEC LOAD,DSN=DB2E,LIB=DB2F
//SYSDISC DD DUMMY
//SYSIN   DD *
TEMPLATE FZY3YL48
     DSN('DBA5.DUPL.REC.DMAC1P01.SCDP1P01.D2016355')
     DISP(OLD,KEEP,KEEP)
LOAD DATA INDDN FZY3YL48 LOG NO  REPLACE NOCOPYPEND
 EBCDIC  CCSID(00037,00000,00000)
 INTO TABLE
 "ERSPROD".
 "MACT_CD_CLM_DESC"
 WHEN(00001:00002) = X'0003'
 NUMRECS             13158061
 ( "CD_CLM_SUB_OFF_NBR"
  POSITION(  00003:00005) CHAR(00003)
 , "CD_CLM_ATLAS_YR"
  POSITION(  00006:00007) CHAR(00002)
 , "CD_CLM_SEQ_NBR"
  POSITION(  00008:00013) CHAR(00006)
 , "CD_CSFX_ID"
  POSITION(  00014:00016) CHAR(00003)
 , "CD_CSSH_RAC_CD"
  POSITION(  00017:00024) CHAR(00008)
 , "CD_CFA_DEDSUSP_CD"
  POSITION(  00025:00028) CHAR(00004)
 , "CD_CSFX_OPEN_DT"
  POSITION(  00030:00039) DATE EXTERNAL
                          NULLIF(00029)=X'FF'
 , "CD_CSFX_ORIG_DT"
  POSITION(  00041:00050) DATE EXTERNAL
                          NULLIF(00040)=X'FF'
 , "CD_CSSH_INS_TYP"
  POSITION(  00051:00051) CHAR(00001)
 , "CD_CSSH_REINS_TYP"
  POSITION(  00052:00053) CHAR(00002)
 , "CD_BA_BK_DT"
  POSITION(  00054:00059) CHAR(00006)
 , "CD_AV_POT_CR_IND"
  POSITION(  00060:00060) CHAR(00001)
 , "CD_CLD_ACT_CD"
  POSITION(  00061:00064) CHAR(00004)
 , "CD_CLD_BRND_TXT"
  POSITION(  00065:00079) CHAR(00015)
 , "CD_CLD_CANP_CD"
  POSITION(  00080:00081) CHAR(00002)
 , "CD_CLD_CLM_LN_CD"
  POSITION(  00082:00082) CHAR(00001)
 , "CD_CLD_CLM_MADE_DT"
  POSITION(  00084:00093) DATE EXTERNAL
                          NULLIF(00083)=X'FF'
 , "CD_CLD_CLS_DT"
  POSITION(  00095:00100) CHAR(00006)
                          NULLIF(00094)=X'FF'
 , "CD_CLD_CTRY_CD"
  POSITION(  00101:00103) CHAR(00003)
 , "CD_CLD_CTPL_TXT"
  POSITION(  00104:00123) CHAR(00020)
 , "CD_CLD_DISPS_TYP"
  POSITION(  00124:00124) CHAR(00001)
 , "CD_CLD_GEN_LOC_TXT"
  POSITION(  00125:00139) CHAR(00015)
 , "CD_CLD_HAZ_CD"
  POSITION(  00140:00143) CHAR(00004)
 , "CD_CLD_INDUS_CD"
  POSITION(  00144:00145) CHAR(00002)
 , "CD_CLD_INJ_SRC_CD"
  POSITION(  00146:00147) CHAR(00002)
 , "CD_CLD_MAJ_PRD_TYP"
  POSITION(  00148:00151) CHAR(00004)
 , "CD_CLD_MATL_CD"
  POSITION(  00152:00153) CHAR(00002)
 , "CD_CLD_MIL_INC_NBR"
  POSITION(  00154:00157) DECIMAL
 , "CD_CLD_OCUR_TM"
  POSITION(  00159:00166) TIME EXTERNAL
                          NULLIF(00158)=X'FF'
 , "CD_CLD_RD_COND_CD"
  POSITION(  00167:00169) CHAR(00003)
 , "CD_CLD_RES_STUS_CD"
  POSITION(  00170:00170) CHAR(00001)
 , "CD_CLD_ST_CD"
  POSITION(  00171:00172) CHAR(00002)
 , "CD_CLD_STUS_CD"
  POSITION(  00173:00173) CHAR(00001)
 , "CD_CLD_SUBST_CD"
  POSITION(  00174:00176) CHAR(00003)
 , "CD_CLD_TXT"
  POSITION(  00177:00266) CHAR(00090)
 , "CD_CLD_WREG_CD"
  POSITION(  00267:00268) CHAR(00002)
 , "CD_CLD_2ND_PRD_TYP"
  POSITION(  00269:00272) CHAR(00004)
 , "CD_CLT_BIRTH_DT"
  POSITION(  00274:00283) DATE EXTERNAL
                          NULLIF(00273)=X'FF'
 , "CD_CLT_GENDR_TYP"
  POSITION(  00284:00284) CHAR(00001)
 , "CD_CLT_MRTLSTUS_CD"
  POSITION(  00285:00285) CHAR(00001)
 , "CD_CLT_NBR"
  POSITION(  00286:00288) CHAR(00003)
 , "CD_CLT_NM"
  POSITION(  00289:00348) CHAR(00060)
 , "CD_CLT_SSN_ID"
  POSITION(  00349:00357) CHAR(00009)
 , "CD_CSCS_DTL_CD"
  POSITION(  00358:00361) CHAR(00004)
 , "CD_CSCS_QN_IND"
  POSITION(  00362:00362) CHAR(00001)
 , "CD_CSD_ADJ_METH_CD"
  POSITION(  00363:00364) CHAR(00002)
 , "CD_CSD_ADSF_IND"
  POSITION(  00365:00365) CHAR(00001)
 , "CD_CSD_ATRISK_IND"
  POSITION(  00366:00366) CHAR(00001)
 , "CD_CSD_BEN_OST_IND"
  POSITION(  00367:00367) CHAR(00001)
 , "CD_CSD_BDY_PART_CD"
  POSITION(  00368:00371) CHAR(00004)
 , "CD_CSD_BLKENT_IND"
  POSITION(  00372:00372) CHAR(00001)
 , "CD_CSD_COL_CD"
  POSITION(  00373:00379) CHAR(00007)
 , "CD_CSD_DSP_COUN_CD"
  POSITION(  00380:00381) CHAR(00002)
 , "CD_CSD_DISPT_RL_CD"
  POSITION(  00382:00383) CHAR(00002)
 , "CD_CSD_DTH_IND"
  POSITION(  00384:00384) CHAR(00001)
 , "CD_CSD_DTL_WORD_CD"
  POSITION(  00385:00398) CHAR(00014)
 , "CD_CSD_DVP_CD"
  POSITION(  00399:00399) CHAR(00001)
 , "CD_CSD_EINTAPP_IND"
  POSITION(  00400:00400) CHAR(00001)
 , "CD_CSD_EMRG_ISS_CD"
  POSITION(  00401:00404) CHAR(00004)
 , "CD_CSD_INITMKUP_DT"
  POSITION(  00406:00415) DATE EXTERNAL
                          NULLIF(00405)=X'FF'
 , "CD_CSD_INTAPP_IND"
  POSITION(  00416:00416) CHAR(00001)
 , "CD_CSD_LF_PENS_IND"
  POSITION(  00417:00417) CHAR(00001)
 , "CD_CSD_LGLE_ID"
  POSITION(  00418:00428) CHAR(00011)
 , "CD_CSD_LIABOVR_IND"
  POSITION(  00429:00429) CHAR(00001)
 , "CD_CSD_LN_ABBR_CD"
  POSITION(  00430:00434) CHAR(00005)
 , "CD_CSD_LOC_DESC_CD"
  POSITION(  00435:00438) CHAR(00004)
 , "CD_CSD_LSS_FFIC_DT"
  POSITION(  00440:00449) DATE EXTERNAL
                          NULLIF(00439)=X'FF'
 , "CD_CSD_MEDTRMNT_CD"
  POSITION(  00450:00450) CHAR(00001)
 , "CD_CSD_NAT_INJ_CD"
  POSITION(  00451:00454) CHAR(00004)
 , "CD_CSD_NONCOMP_IND"
  POSITION(  00455:00455) CHAR(00001)
 , "CD_CSD_NOTC_DT"
  POSITION(  00456:00461) CHAR(00006)
 , "CD_CSD_ONESHOT_IND"
  POSITION(  00462:00462) CHAR(00001)
 , "CD_CSD_ORGU_ID"
  POSITION(  00463:00468) CHAR(00006)
 , "CD_CSD_PR_AM_CD"
  POSITION(  00469:00470) CHAR(00002)
 , "CD_CSD_PROP_AFF_CD"
  POSITION(  00471:00473) CHAR(00003)
 , "CD_CSD_REAC_IND"
  POSITION(  00474:00474) CHAR(00001)
 , "CD_CSD_SAIS_DIV_CD"
  POSITION(  00475:00486) CHAR(00012)
 , "CD_CSD_SAL_CLS_DT"
  POSITION(  00487:00492) CHAR(00006)
 , "CD_CSD_SAL_OPEN_DT"
  POSITION(  00493:00498) CHAR(00006)
 , "CD_CSD_SALRSNCL_CD"
  POSITION(  00499:00499) CHAR(00001)
 , "CD_CSD_STUS_CD"
  POSITION(  00500:00501) CHAR(00002)
 , "CD_CSD_SUB_CLS_DT"
  POSITION(  00502:00507) CHAR(00006)
 , "CD_CSD_SUB_OPEN_DT"
  POSITION(  00508:00513) CHAR(00006)
 , "CD_CSD_SUBRSNCL_CD"
  POSITION(  00514:00514) CHAR(00001)
 , "CD_CSD_SUIT_DSP_CD"
  POSITION(  00515:00516) CHAR(00002)
 , "CD_CSD_SUIT_DSP_DT"
  POSITION(  00517:00522) CHAR(00006)
 , "CD_CSD_SUIT_RCV_DT"
  POSITION(  00523:00528) CHAR(00006)
 , "CD_CSD_SUMM_RPT_CD"
  POSITION(  00529:00530) CHAR(00002)
 , "CD_CSD_TMLS_RNG_CD"
  POSITION(  00531:00531) CHAR(00001)
 , "CD_CSD_TRANMETH_CD"
  POSITION(  00532:00535) CHAR(00004)
 , "CD_CSD_VNDR_TAX_ID"
  POSITION(  00536:00544) CHAR(00009)
 , "CD_CSD_WC_DIS_TYP"
  POSITION(  00545:00546) CHAR(00002)
 , "CD_CSD_WC_VOC_IND"
  POSITION(  00547:00547) CHAR(00001)
 , "CD_CSD_WC_WAGE_AMT"
  POSITION(  00548:00552) DECIMAL
 , "CD_CSD_XTRASETL_CD"
  POSITION(  00553:00554) CHAR(00002)
 , "CD_CSFX_CLS_DT"
  POSITION(  00556:00565) DATE EXTERNAL
                          NULLIF(00555)=X'FF'
 , "CD_CSFX_REOPEN_IND"
  POSITION(  00566:00566) CHAR(00001)
 , "CD_CSS_LITIG_IND"
  POSITION(  00567:00567) CHAR(00001)
 , "CD_CSS_RECOV_IND"
  POSITION(  00568:00568) CHAR(00001)
 , "CD_CSS_SFX_STUS_CD"
  POSITION(  00569:00569) CHAR(00001)
 , "CD_CSSD_CONTRCT_CD"
  POSITION(  00570:00571) CHAR(00002)
 , "CD_CSSD_RC_DED_AMT"
  POSITION(  00572:00577) DECIMAL
 , "CD_CSSH_FACLTV_IND"
  POSITION(  00578:00578) CHAR(00001)
 , "CD_CSSH_SHR_TYP"
  POSITION(  00579:00579) CHAR(00001)
 , "CD_CSST_ADJ_ID"
  POSITION(  00580:00582) CHAR(00003)
 , "CD_CSV_SVC_TYP"
  POSITION(  00583:00584) CHAR(00002)
 , "CD_LEI_POT_CR_IND"
  POSITION(  00585:00585) CHAR(00001)
 , "CD_RA_COV_NOTE_ID"
  POSITION(  00586:00600) CHAR(00015)
 , "CD_VOCR_START_DT"
  POSITION(  00601:00606) CHAR(00006)
 , "CD_CLD_PROPLOC_TXT"
  POSITION(  00607:00666) CHAR(00060)
 , "CD_CLD_COV_LMT_AMT"
  POSITION(  00667:00675) CHAR(00009)
 , "CD_CLD_ECF_COST_CD"
  POSITION(  00676:00676) CHAR(00001)
 , "CD_CSD_CDEGDMG_CD"
  POSITION(  00677:00677) CHAR(00001)
 , "CD_CSD_CDEGLIAB_CD"
  POSITION(  00678:00678) CHAR(00001)
 , "CD_CSD_CPTY_CD"
  POSITION(  00679:00679) CHAR(00001)
 , "CD_CSD_SEC_RNG_CD"
  POSITION(  00680:00680) CHAR(00001)
 , "CD_CSD_SNEC_RNG_CD"
  POSITION(  00681:00681) CHAR(00001)
 , "CD_CSD_SLIABRNG_CD"
  POSITION(  00682:00682) CHAR(00001)
 , "CD_CSD_PLNTFFRM_NM"
  POSITION(  00683:00707) CHAR(00025)
 , "CD_CSD_FIREORIG_CD"
  POSITION(  00708:00711) CHAR(00004)
 , "CD_CLD_AREAPRAC_CD"
  POSITION(  00712:00716) CHAR(00005)
 , "CD_CLD_ENGAGLTR_CD"
  POSITION(  00717:00717) CHAR(00001)
 , "CD_CLD_FEESUIT_CD"
  POSITION(  00718:00718) CHAR(00001)
 , "CD_CLD_NONFFIC_ID"
  POSITION(  00719:00748) CHAR(00030)
 , "CD_CSAR_LOC_ID"
  POSITION(  00749:00764) CHAR(00016)
 , "CD_LOSS_LOC_STATE"
  POSITION(  00765:00766) CHAR(00002)
 )
