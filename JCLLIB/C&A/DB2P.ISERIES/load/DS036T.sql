LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS036T_SIT_CEL    "
 ( "NI_SIT_CEL        " POSITION(00007:00008) SMALLINT
 , "NO_SIT_CEL        " POSITION(00009:00025) VARCHAR
 )
