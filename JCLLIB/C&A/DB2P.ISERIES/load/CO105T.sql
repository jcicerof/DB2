LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO105T_VOL_ACR_FOR"
 ( "CD_FOR            " POSITION(00007:00012) CHAR(006)
 , "CD_DEPTO_COM      " POSITION(00013:00014) DECIMAL
 , "DT_INI_VOL_ACR    " POSITION(00015:00024) DATE EXTERNAL
 , "DT_FIM_VOL_ACR    " POSITION(00025:00034) DATE EXTERNAL
 , "QT_PCA_MIN_ACR    " POSITION(00035:00038) INTEGER
 , "QT_PCA_MAX_ACR    " POSITION(00039:00042) INTEGER
 , "QT_PCA_MIN_ATLD   " POSITION(00043:00046) INTEGER
 , "QT_PCA_MAX_ATLD   " POSITION(00047:00050) INTEGER
 , "QT_PCA_PED_CRT    " POSITION(00051:00054) INTEGER
 )
