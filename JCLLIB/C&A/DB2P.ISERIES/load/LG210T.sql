LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG210T_APTO_ARM   "
 ( "CD_APTO_LOC_ARM   " POSITION(00007:00008) DECIMAL
 , "NO_APTO_LOC_ARM   " POSITION(00009:00038) CHAR(030)
 )
