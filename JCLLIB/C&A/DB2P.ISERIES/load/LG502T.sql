LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG502T_FLX_PCS    "
 ( "NI_PED            " POSITION(00007:00010) DECIMAL
 , "NU_REC_PED        " POSITION(00011:00012) DECIMAL
 , "CD_PACK_REC       " POSITION(00013:00013) CHAR(001)
 , "NU_PACK_REC       " POSITION(00014:00016) DECIMAL
 , "NI_PL             " POSITION(00017:00021) DECIMAL
 , "CD_PCS            " POSITION(00022:00023) DECIMAL
 , "CD_ATV            " POSITION(00024:00025) DECIMAL
 , "QT_PCA_REC_PROCE  " POSITION(00026:00031) DECIMAL
 , "QT_PCA_AJU_PROCE  " POSITION(00032:00037) DECIMAL
 , "QT_PCA_DVL_PROCE  " POSITION(00039:00044) DECIMAL
                          NULLIF(00038)=X'FF'
 , "QT_PCA_EXP_PROCE  " POSITION(00045:00050) DECIMAL
 , "TS_INI_PROCE      " POSITION(00051:00076) TIMESTAMP EXTERNAL
 , "TS_FIM_PROCE      " POSITION(00078:00103) TIMESTAMP EXTERNAL
                          NULLIF(00077)=X'FF'
 , "CD_USR_FIM        " POSITION(00105:00112) CHAR(008)
                          NULLIF(00104)=X'FF'
 , "CD_USR_INI        " POSITION(00113:00120) CHAR(008)
 , "NI_TUR_TRA_INI    " POSITION(00122:00123) DECIMAL
                          NULLIF(00121)=X'FF'
 , "NI_TUR_TRA_FIM    " POSITION(00125:00126) DECIMAL
                          NULLIF(00124)=X'FF'
 , "QT_PCA_DES        " POSITION(00128:00130) DECIMAL
                          NULLIF(00127)=X'FF'
 , "IN_DVG_PRIO       " POSITION(00131:00131) CHAR(001)
 , "IN_PED_ORI_DIS    " POSITION(00132:00132) CHAR(001)
 , "IN_EXG_DAD        " POSITION(00133:00133) CHAR(001)
 )
