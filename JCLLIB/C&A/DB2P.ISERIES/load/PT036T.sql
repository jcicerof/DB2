LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PT036T_CLC_PAIS   "
 ( "CD_TMA_CLC        " POSITION(00007:00009) DECIMAL
 , "CD_PAIS           " POSITION(00010:00011) CHAR(002)
 , "DT_INI_TMA        " POSITION(00012:00021) DATE EXTERNAL
 , "DT_FIM_TMA        " POSITION(00022:00031) DATE EXTERNAL
 )
