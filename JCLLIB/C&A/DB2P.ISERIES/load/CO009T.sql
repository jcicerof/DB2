LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO009T_FNE_CMZ_FNE"
 ( "CD_FNE            " POSITION(00007:00008) DECIMAL
 , "CD_FNE_CMZ        " POSITION(00009:00010) DECIMAL
 )
