LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TT018T_LSNG_SOLLO "
 ( "NU_CAR_CRE_SOLLO  " POSITION(00007:00015) DECIMAL
 )
