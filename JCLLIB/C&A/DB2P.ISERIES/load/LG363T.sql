LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG363T_SRE_NF_DEST"
 ( "CD_FL_ARM_ORI     " POSITION(00007:00009) DECIMAL
 , "CD_FL_ARM_DEST    " POSITION(00010:00012) DECIMAL
 , "CD_TIP_ETQ_DEST   " POSITION(00013:00014) DECIMAL
 , "NU_SRE_NF         " POSITION(00015:00016) CHAR(002)
 )
