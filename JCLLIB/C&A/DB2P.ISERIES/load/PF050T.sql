LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PF050T_FTR_PAIS   "
 ( "CD_PAIS           " POSITION(00007:00008) CHAR(002)
 , "CD_PAIS_IMPT      " POSITION(00009:00010) CHAR(002)
 , "CD_FTR_IMPT       " POSITION(00011:00012) SMALLINT
 )