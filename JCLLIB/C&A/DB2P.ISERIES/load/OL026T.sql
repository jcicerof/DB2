LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."OL026T_HIS_SLD_OPD"
 ( "DT_HIS_OPD_LGS    " POSITION(00007:00016) DATE EXTERNAL
 , "CD_OPD_LGS        " POSITION(00017:00019) DECIMAL
 , "CD_FL_DTN         " POSITION(00020:00022) DECIMAL
 , "CD_MDLD_ACDM_REC  " POSITION(00023:00023) CHAR(001)
 , "CD_MDLD_ACDM_DIS  " POSITION(00024:00024) CHAR(001)
 , "QT_PCA_SLD_ANT_OPD" POSITION(00025:00028) INTEGER
 , "QT_PCA_REC_OPD    " POSITION(00029:00032) INTEGER
 , "QT_PCA_EXPD_OPD   " POSITION(00033:00036) INTEGER
 , "QT_PCA_AJTD_OPD   " POSITION(00037:00040) INTEGER
 )
