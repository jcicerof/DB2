LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PT003T_DMS_MODELO "
 ( "NI_MDL            " POSITION(00007:00010) DECIMAL
 , "NI_DMS            " POSITION(00011:00011) DECIMAL
 , "TP_DMS            " POSITION(00012:00013) DECIMAL
 )
