LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA052T_ETQ_SKU    "
 ( "NI_SKU            " POSITION(00007:00011) DECIMAL
 , "QT_PCA_ETQ        " POSITION(00012:00016) DECIMAL
 , "CD_FNE            " POSITION(00017:00018) DECIMAL
 , "CD_CLS            " POSITION(00019:00020) DECIMAL
 , "CD_CLS_COD        " POSITION(00021:00022) DECIMAL
 , "NI_MDL            " POSITION(00023:00026) DECIMAL
 )