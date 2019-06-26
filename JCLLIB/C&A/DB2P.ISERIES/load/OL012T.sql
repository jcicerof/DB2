LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."OL012T_INF_FIS_PED"
 ( "NI_PED            " POSITION(00007:00010) DECIMAL
 , "QT_PCA_PED        " POSITION(00011:00014) INTEGER
 , "VL_PU             " POSITION(00015:00023) DECIMAL
 , "VL_TOT_ITEM       " POSITION(00024:00032) DECIMAL
 , "PC_ALQ_ICMS       " POSITION(00033:00036) DECIMAL
 , "PC_ALQ_IPI        " POSITION(00037:00040) DECIMAL
 , "VL_ICMS           " POSITION(00041:00049) DECIMAL
 , "VL_IPI            " POSITION(00050:00058) DECIMAL
 , "VL_CST_CPL        " POSITION(00059:00067) DECIMAL
 , "QT_VOL            " POSITION(00068:00071) INTEGER
 , "VL_TOT_NF_ORI     " POSITION(00072:00080) DECIMAL
 , "VL_BASE_CLC_ORI   " POSITION(00081:00089) DECIMAL
 , "VL_FRT_ORI        " POSITION(00090:00098) DECIMAL
 , "VL_SGR_ORI        " POSITION(00099:00107) DECIMAL
 , "VL_OTR_DSP_ORI    " POSITION(00108:00116) DECIMAL
 , "VL_PESO_BRU_ORI   " POSITION(00117:00125) DECIMAL
 , "VL_PESO_LIQ_ORI   " POSITION(00126:00134) DECIMAL
 , "VL_PIS_COFINS_ORI " POSITION(00135:00143) DECIMAL
 , "TX_DS_EPC_VOL_ORI " POSITION(00145:00159) CHAR(015)
                          NULLIF(00144)=X'FF'
 , "TX_OBS_NF_ORI     " POSITION(00161:00310) CHAR(150)
                          NULLIF(00160)=X'FF'
 , "NI_DOC_FIS        " POSITION(00312:00316) DECIMAL
                          NULLIF(00311)=X'FF'
 )