LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO003T_PROVINCIA  "
 ( "CD_PAIS           " POSITION(00007:00008) CHAR(002)
 , "CD_PVC            " POSITION(00009:00010) DECIMAL
 , "DS_PVC            " POSITION(00011:00030) CHAR(020)
 )