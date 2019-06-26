LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA031T_BNFC       "
 ( "NI_PROM           " POSITION(00007:00010) DECIMAL
 , "CD_COND_PROM      " POSITION(00011:00012) DECIMAL
 , "CD_TIP_BNFC       " POSITION(00013:00014) SMALLINT
 , "CD_TIP_VLR_BNFC   " POSITION(00015:00015) DECIMAL
 , "TX_DS_BNFC        " POSITION(00016:00115) CHAR(100)
 , "QT_PCA_BNFC       " POSITION(00117:00120) INTEGER
                          NULLIF(00116)=X'FF'
 , "CD_MDLD_FNC       " POSITION(00122:00125) INTEGER
                          NULLIF(00121)=X'FF'
 , "CD_ADMR           " POSITION(00127:00128) SMALLINT
                          NULLIF(00126)=X'FF'
 , "PC_DCT_PROM       " POSITION(00130:00132) DECIMAL
                          NULLIF(00129)=X'FF'
 , "VL_DCT_PROM       " POSITION(00134:00141) DECIMAL
                          NULLIF(00133)=X'FF'
 , "CD_FMA_BNFC       " POSITION(00142:00142) DECIMAL
 , "NI_SKU            " POSITION(00144:00148) DECIMAL
                          NULLIF(00143)=X'FF'
 , "CD_REF            " POSITION(00150:00152) DECIMAL
                          NULLIF(00149)=X'FF'
 )