LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG430T_PRM_CTR_BLQ"
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "CD_FL_DTN         " POSITION(00010:00012) DECIMAL
 , "CD_MDLD_ACMD_DIS  " POSITION(00013:00013) CHAR(001)
 , "IN_BLQ            " POSITION(00014:00014) CHAR(001)
 )
