LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG200T_END_LOC_ARM"
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "CD_CER_LOC_ARM    " POSITION(00010:00011) DECIMAL
 , "CD_AND_LOC_ARM    " POSITION(00012:00013) CHAR(002)
 , "CD_APTO_LOC_ARM   " POSITION(00014:00015) DECIMAL
 , "CD_BOL            " POSITION(00016:00017) DECIMAL
 )
