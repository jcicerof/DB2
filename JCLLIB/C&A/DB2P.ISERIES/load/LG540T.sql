LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG540T_DET_ENV_PED"
 ( "NI_OCO            " POSITION(00007:00010) INTEGER
 , "NU_DET_OCO        " POSITION(00011:00013) DECIMAL
 , "QT_PCA_GRD        " POSITION(00014:00019) DECIMAL
 , "CD_PACK           " POSITION(00020:00020) CHAR(001)
 , "QT_PCA_GRD_SKU    " POSITION(00021:00026) DECIMAL
 , "QT_PACK_GRD       " POSITION(00027:00032) DECIMAL
 , "QT_TOT_PCA_SKU    " POSITION(00033:00038) DECIMAL
 , "NI_SKU            " POSITION(00039:00043) DECIMAL
 )
