LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PT027T_SIT_MODELO "
 ( "CD_SIT_MDL        " POSITION(00007:00008) DECIMAL
 , "DS_SIT_MDL_PRG    " POSITION(00009:00048) CHAR(040)
 , "DS_SIT_MDL_SPH    " POSITION(00049:00088) CHAR(040)
 , "DS_SIT_MDL_IGL    " POSITION(00089:00128) CHAR(040)
 )
