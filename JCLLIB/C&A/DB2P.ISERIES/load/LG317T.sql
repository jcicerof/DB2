LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG317T_DOCA       "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "NU_DOCA           " POSITION(00010:00011) DECIMAL
 , "DS_DOCA_PRG       " POSITION(00012:00051) CHAR(040)
 , "DS_DOCA_SPH       " POSITION(00052:00091) CHAR(040)
 , "DS_DOCA_IGL       " POSITION(00092:00131) CHAR(040)
 , "TP_DOCA           " POSITION(00132:00132) CHAR(001)
 , "IN_LIB_DOCA       " POSITION(00133:00133) CHAR(001)
 )