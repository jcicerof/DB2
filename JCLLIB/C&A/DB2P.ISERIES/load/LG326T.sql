LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG326T_ATD_FL     "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "CD_FL_ATD         " POSITION(00010:00012) DECIMAL
 , "ST_ATD_PREF       " POSITION(00013:00013) CHAR(001)
 )
