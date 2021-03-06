LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG351T_FCH_TUR_ETQ"
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "NI_TUR_TRA        " POSITION(00010:00011) DECIMAL
 , "DT_FECH           " POSITION(00012:00021) DATE EXTERNAL
 , "CD_TIP_ETQ        " POSITION(00022:00023) DECIMAL
 , "CD_MDLD_ACDM_REC  " POSITION(00024:00024) CHAR(001)
 , "CD_MDLD_ACDM_DIS  " POSITION(00025:00025) CHAR(001)
 , "QT_PCA_ENT_ETQ    " POSITION(00027:00030) INTEGER
                          NULLIF(00026)=X'FF'
 , "QT_PCA_SAI_ETQ    " POSITION(00032:00035) INTEGER
                          NULLIF(00031)=X'FF'
 , "QT_SLD_ETQ        " POSITION(00037:00040) INTEGER
                          NULLIF(00036)=X'FF'
 , "QT_PCA_AJTD_ETQ   " POSITION(00042:00047) DECIMAL
                          NULLIF(00041)=X'FF'
 , "IN_EXG_DAD        " POSITION(00048:00048) CHAR(001)
 )
