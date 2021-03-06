LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG308T_ITEM_FAC   "
 ( "NI_DOC_FIS        " POSITION(00007:00011) DECIMAL
 , "NU_ORD_ITEM_FIS   " POSITION(00012:00013) DECIMAL
 , "NU_PED_ITEM_FAC   " POSITION(00015:00018) DECIMAL
                          NULLIF(00014)=X'FF'
 , "CD_PRD_ITEM_FIS   " POSITION(00019:00023) DECIMAL
 , "DS_PRD_ITEM_FIS   " POSITION(00024:00073) CHAR(050)
 , "QT_ITEM_DOC_FIS   " POSITION(00074:00078) DECIMAL
 , "VL_UNI_ITEM_FAC   " POSITION(00079:00086) DECIMAL
 , "VL_TOT_ITEM_FAC   " POSITION(00087:00094) DECIMAL
 , "PC_ALQ_IVA_FAC    " POSITION(00095:00097) DECIMAL
 , "VL_IVA_ITEM_FAC   " POSITION(00098:00105) DECIMAL
 , "VL_DCT_ITEM_FAC   " POSITION(00106:00113) DECIMAL
 , "ST_DVG_PRC        " POSITION(00114:00114) CHAR(001)
 , "CD_UND_ITEM_FAC   " POSITION(00116:00120) CHAR(005)
                          NULLIF(00115)=X'FF'
 , "QT_VOL_ITEM_FAC   " POSITION(00121:00124) INTEGER
 , "IN_EXG_DAD        " POSITION(00125:00125) CHAR(001)
 )
