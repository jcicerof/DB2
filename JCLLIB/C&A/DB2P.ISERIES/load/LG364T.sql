LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG364T_CUB_VOL    "
 ( "NI_CUB_VOL        " POSITION(00007:00008) SMALLINT
 , "QT_CM_ALT_CUB_VOL " POSITION(00009:00013) DECIMAL
 , "QT_CM_LGR_CUB_VOL " POSITION(00014:00018) DECIMAL
 , "QT_CM_PFD_CUB_VOL " POSITION(00019:00023) DECIMAL
 , "QT_CM3_CUB_VOL    " POSITION(00024:00028) DECIMAL
 , "NO_CUB_VOL        " POSITION(00029:00058) CHAR(030)
 )
