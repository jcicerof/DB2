LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."IF029T_PFX_BIN    "
 ( "NU_BIN_INI        " POSITION(00007:00010) INTEGER
 , "NU_BIN_FIM        " POSITION(00011:00014) INTEGER
 , "CD_BAN_CAR_CRE    " POSITION(00015:00016) SMALLINT
 , "NU_BYT_BIN        " POSITION(00017:00018) SMALLINT
 , "NU_BYT_CAR_CRE    " POSITION(00019:00020) SMALLINT
 )