LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CS001T_CALCULO    "
 ( "CD_CLC            " POSITION(00007:00009) CHAR(003)
 , "NO_CLC            " POSITION(00010:00054) CHAR(045)
 , "NO_MOD_CLC        " POSITION(00055:00062) CHAR(008)
 )
