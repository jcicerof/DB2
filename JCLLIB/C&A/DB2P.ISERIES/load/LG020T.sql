LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG020T_TIP_SIT_BUR"
 ( "CD_TIP_SIT_BUR    " POSITION(00007:00007) DECIMAL
 , "DS_TIP_SIT_BUR_PRG" POSITION(00008:00022) CHAR(015)
 , "DS_TIP_SIT_BUR_SPH" POSITION(00023:00037) CHAR(015)
 , "DS_TIP_SIT_BUR_IGL" POSITION(00038:00052) CHAR(015)
 )
