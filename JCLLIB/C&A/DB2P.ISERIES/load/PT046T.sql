LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PT046T_CPA_PUB    "
 ( "NI_CPA_PUB        " POSITION(00007:00010) DECIMAL
 , "DS_CPA_PUB        " POSITION(00011:00090) CHAR(080)
 , "CD_PAIS           " POSITION(00091:00092) CHAR(002)
 )