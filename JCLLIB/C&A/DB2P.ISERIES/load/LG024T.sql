LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG024T_AUD_FOR    "
 ( "CD_FOR            " POSITION(00007:00012) CHAR(006)
 , "DT_INI_PRD_PED_AUD" POSITION(00013:00022) DATE EXTERNAL
 , "DT_FIM_PRD_PED_AUD" POSITION(00023:00032) DATE EXTERNAL
 , "QT_PED_PREV_AUD   " POSITION(00033:00034) DECIMAL
 , "QT_PED_AUD        " POSITION(00035:00036) DECIMAL
 )
