LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG028T_SRVR_IMPR  "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "CD_SRVR           " POSITION(00010:00011) DECIMAL
 , "NO_SRVR           " POSITION(00012:00031) CHAR(020)
 , "CD_END_IP         " POSITION(00032:00051) CHAR(020)
 )