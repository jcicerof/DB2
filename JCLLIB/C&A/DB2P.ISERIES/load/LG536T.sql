LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG536T_GRU_MDLD   "
 ( "CD_GRU_PRD        " POSITION(00007:00009) CHAR(003)
 , "CD_MDLD_ACDM_REC  " POSITION(00010:00010) CHAR(001)
 , "CD_MDLD_ACDM_DIS  " POSITION(00011:00011) CHAR(001)
 , "QT_CM_ALTU_PCA    " POSITION(00012:00016) DECIMAL
 , "QT_CM_LGR_PCA     " POSITION(00017:00021) DECIMAL
 , "QT_CM_PRFDD_PCA   " POSITION(00022:00026) DECIMAL
 , "QT_CM3_CUB_PCA    " POSITION(00027:00033) DECIMAL
 , "QT_GR_PESO_PCA    " POSITION(00034:00038) DECIMAL
 )
