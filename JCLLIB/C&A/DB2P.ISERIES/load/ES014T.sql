LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."ES014T_FL_ESPL    "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "CD_FL_ESPL        " POSITION(00010:00012) DECIMAL
 )
