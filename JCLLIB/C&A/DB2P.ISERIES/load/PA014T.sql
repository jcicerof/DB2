LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA014T_CCR        "
 ( "NI_CCR            " POSITION(00007:00009) DECIMAL
 , "NO_CCR            " POSITION(00010:00054) CHAR(045)
 )
