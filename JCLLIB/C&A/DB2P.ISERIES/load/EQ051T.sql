LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."EQ051T_CTR_FL     "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "CD_TIP_ETQ        " POSITION(00010:00011) DECIMAL
 , "CD_FL_ARM         " POSITION(00012:00014) DECIMAL
 , "CD_SIT_ETQ        " POSITION(00015:00016) DECIMAL
 , "DT_ULT_PROCE_FL   " POSITION(00017:00026) DATE EXTERNAL
 )
