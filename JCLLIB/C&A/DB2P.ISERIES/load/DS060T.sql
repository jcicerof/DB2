LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS060T_RGI_LOJ_FL "
 ( "NI_RGI_LOJ        " POSITION(00007:00008) SMALLINT
 , "CD_FL             " POSITION(00009:00011) DECIMAL
 )