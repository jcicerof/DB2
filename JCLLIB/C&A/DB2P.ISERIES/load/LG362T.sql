LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG362T_RGR_INSP   "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "QT_PCA_INI_RGR    " POSITION(00010:00013) INTEGER
 , "QT_PCA_FIM_RGR    " POSITION(00014:00017) INTEGER
 , "QT_PCA_INSP       " POSITION(00018:00019) SMALLINT
 )
