LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG415T_TIP_EXP_ESP"
 ( "CD_TIP_EXP_ESP    " POSITION(00007:00008) DECIMAL
 , "DS_TIP_EXP_ESP_PRG" POSITION(00009:00038) CHAR(030)
 , "DS_TIP_EXP_ESP_SPH" POSITION(00039:00068) CHAR(030)
 , "DS_TIP_EXP_ESP_IGL" POSITION(00069:00098) CHAR(030)
 )
