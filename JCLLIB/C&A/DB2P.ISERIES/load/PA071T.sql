LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA071T_PCT_REM_ECC"
 ( "CD_FNE            " POSITION(00007:00008) DECIMAL
 , "CD_PAIS           " POSITION(00009:00010) CHAR(002)
 , "NU_ANO_CEA        " POSITION(00011:00013) DECIMAL
 , "CD_CLS            " POSITION(00014:00015) DECIMAL
 , "PC_RED_REM        " POSITION(00016:00018) DECIMAL
 , "PC_REM_ECC        " POSITION(00019:00021) DECIMAL
 )