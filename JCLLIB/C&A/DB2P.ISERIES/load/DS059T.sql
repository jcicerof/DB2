LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS059T_RGI_LOJ    "
 ( "NI_RGI_LOJ        " POSITION(00007:00008) SMALLINT
 , "NI_OPD_CEL        " POSITION(00009:00010) SMALLINT
 , "NI_OPD_REGN_CEL   " POSITION(00011:00014) INTEGER
 , "NO_RGI_LOJ        " POSITION(00015:00054) CHAR(040)
 )
