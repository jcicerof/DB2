LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS089T_TIP_SCL_VGM"
 ( "CD_TIP_SCL_VGM    " POSITION(00007:00008) SMALLINT
 , "NO_TIP_SCL_VGM_PTG" POSITION(00009:00033) CHAR(025)
 , "NO_TIP_SCL_VGM_SPH" POSITION(00034:00058) CHAR(025)
 , "NO_TIP_SCL_VGM_IGL" POSITION(00059:00083) CHAR(025)
 )
