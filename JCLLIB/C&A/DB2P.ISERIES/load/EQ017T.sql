LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."EQ017T_SOL_DOA    "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "NI_SOL            " POSITION(00010:00015) DECIMAL
 , "CD_DON            " POSITION(00016:00021) CHAR(006)
 )
