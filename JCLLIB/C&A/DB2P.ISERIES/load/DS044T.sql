LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS044T_EMAIL_FOR  "
 ( "NI_EMAIL_FOR      " POSITION(00007:00010) INTEGER
 , "CD_FOR            " POSITION(00011:00016) CHAR(006)
 , "NO_EMAIL_FOR      " POSITION(00017:00144) CHAR(128)
 )
