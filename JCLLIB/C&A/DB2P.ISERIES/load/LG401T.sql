LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG401T_OBS_VGM    "
 ( "CD_OBS_VGM        " POSITION(00007:00008) CHAR(002)
 , "DT_VGM            " POSITION(00009:00018) DATE EXTERNAL
 , "NU_VGM            " POSITION(00019:00022) INTEGER
 , "NU_SCL_VGM        " POSITION(00023:00024) SMALLINT
 )
