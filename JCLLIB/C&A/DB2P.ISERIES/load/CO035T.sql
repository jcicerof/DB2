LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO035T_TIP_ETQ_FL "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "CD_TIP_ETQ        " POSITION(00010:00011) DECIMAL
 , "CD_FL_ARM         " POSITION(00012:00014) DECIMAL
 )
