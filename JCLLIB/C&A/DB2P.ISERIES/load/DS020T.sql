LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS020T_EMAIL_CPR  "
 ( "NI_EMAIL_CPR      " POSITION(00007:00010) INTEGER
 , "CD_LOJ            " POSITION(00011:00013) DECIMAL
 , "CD_DEPTO_COM      " POSITION(00014:00015) DECIMAL
 , "NO_EMAIL_CPR      " POSITION(00016:00143) CHAR(128)
 )
