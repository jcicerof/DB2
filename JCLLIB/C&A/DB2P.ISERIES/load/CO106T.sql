LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO106T_CCO_FOR    "
 ( "CD_CCO_FOR        " POSITION(00007:00008) SMALLINT
 , "NO_CCO_FOR        " POSITION(00009:00028) CHAR(020)
 )
