LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG016T_ENV_FOR    "
 ( "CD_FOR            " POSITION(00007:00012) CHAR(006)
 , "CD_FL             " POSITION(00013:00015) DECIMAL
 , "CD_MDLD_ENV_MAT   " POSITION(00016:00020) CHAR(005)
 )