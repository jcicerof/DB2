LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TT017T_LSNG_AMEX  "
 ( "NU_CAR_CRE_AMEX   " POSITION(00007:00014) DECIMAL
 )
