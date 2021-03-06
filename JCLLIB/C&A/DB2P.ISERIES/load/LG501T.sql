LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG501T_ACT_REC_PED"
 ( "NI_PED            " POSITION(00007:00010) DECIMAL
 , "NU_REC_PED        " POSITION(00011:00012) DECIMAL
 , "CD_FL             " POSITION(00014:00016) DECIMAL
                          NULLIF(00013)=X'FF'
 , "DT_ATD_REC        " POSITION(00018:00027) DATE EXTERNAL
                          NULLIF(00017)=X'FF'
 , "NU_ATD_REC        " POSITION(00029:00031) DECIMAL
                          NULLIF(00028)=X'FF'
 , "NU_ITEM_ATD_REC   " POSITION(00033:00034) DECIMAL
                          NULLIF(00032)=X'FF'
 , "HR_ATD_REC        " POSITION(00036:00043) TIME EXTERNAL
                          NULLIF(00035)=X'FF'
 , "DT_ANC_ECT        " POSITION(00045:00054) DATE EXTERNAL
                          NULLIF(00044)=X'FF'
 , "QT_CBD_REC        " POSITION(00055:00057) DECIMAL
 , "ST_PCA_ETD_FOR    " POSITION(00058:00058) CHAR(001)
 , "ST_INSP_REC       " POSITION(00059:00059) CHAR(001)
 , "QT_CM_ALTU_CUB    " POSITION(00060:00064) DECIMAL
 , "QT_CM_LGR_CUB     " POSITION(00065:00069) DECIMAL
 , "QT_CM_PRFDD_CUB   " POSITION(00070:00074) DECIMAL
 , "QT_CM3_CUB_PCA    " POSITION(00075:00082) DECIMAL
 , "QT_CM3_CUB        " POSITION(00083:00090) DECIMAL
 , "QT_PCA_CUB        " POSITION(00091:00094) DECIMAL
 , "QT_GR_PESO_PCA    " POSITION(00095:00099) DECIMAL
 , "QT_KG_PESO_CUB    " POSITION(00100:00107) DECIMAL
 , "TS_INI_REC_PED    " POSITION(00108:00133) TIMESTAMP EXTERNAL
 , "TS_FIM_REC_PED    " POSITION(00135:00160) TIMESTAMP EXTERNAL
                          NULLIF(00134)=X'FF'
 , "DS_OBS_REC_PED    " POSITION(00162:00415) CHAR(254)
                          NULLIF(00161)=X'FF'
 , "ST_PED_ALC        " POSITION(00416:00416) CHAR(001)
 , "NI_PRIO_PROCE_PED " POSITION(00417:00418) DECIMAL
 , "CD_MDLD_ACDM_REC  " POSITION(00419:00419) CHAR(001)
 , "CD_MDLD_ACDM_DIS  " POSITION(00420:00420) CHAR(001)
 , "CD_SIT_REC_PED    " POSITION(00421:00422) DECIMAL
 , "CD_TIP_PED        " POSITION(00423:00424) DECIMAL
 , "CD_TIP_TAG        " POSITION(00426:00427) DECIMAL
                          NULLIF(00425)=X'FF'
 , "CD_TMA_CLC        " POSITION(00429:00431) DECIMAL
                          NULLIF(00428)=X'FF'
 , "CD_GRU_CLC        " POSITION(00433:00435) DECIMAL
                          NULLIF(00432)=X'FF'
 , "CD_SET_CLC        " POSITION(00437:00440) DECIMAL
                          NULLIF(00436)=X'FF'
 , "CD_TIP_COO        " POSITION(00441:00442) DECIMAL
 , "CD_FLX_CAL        " POSITION(00444:00445) DECIMAL
                          NULLIF(00443)=X'FF'
 , "CD_FLX_CFM        " POSITION(00447:00448) DECIMAL
                          NULLIF(00446)=X'FF'
 , "DT_GRD_BOA        " POSITION(00450:00459) DATE EXTERNAL
                          NULLIF(00449)=X'FF'
 , "ST_SELO_INSP_ALFG " POSITION(00461:00461) CHAR(001)
                          NULLIF(00460)=X'FF'
 , "DT_CMU_ALFG       " POSITION(00463:00472) DATE EXTERNAL
                          NULLIF(00462)=X'FF'
 , "DT_LIBR_INSP      " POSITION(00474:00483) DATE EXTERNAL
                          NULLIF(00473)=X'FF'
 , "IN_PRIO_ATD_PED   " POSITION(00484:00484) CHAR(001)
 , "NU_SEQ_DOC_FIS    " POSITION(00486:00490) DECIMAL
                          NULLIF(00485)=X'FF'
 , "IN_REC_PED_SAP    " POSITION(00491:00491) CHAR(001)
 , "IN_PED_GRDO       " POSITION(00492:00492) CHAR(001)
 , "CD_FLX_ORI        " POSITION(00494:00495) DECIMAL
                          NULLIF(00493)=X'FF'
 , "IN_DIS_PED        " POSITION(00496:00496) CHAR(001)
 , "IN_PED_EDI        " POSITION(00497:00497) CHAR(001)
 , "IN_EXG_DAD        " POSITION(00498:00498) CHAR(001)
 )
