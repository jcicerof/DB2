LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PF015T_TXA_DCT    "
 ( "DT_PCT_DCT        " POSITION(00007:00016) DATE EXTERNAL
 , "PC_DCT_DUP        " POSITION(00017:00019) DECIMAL
 )
