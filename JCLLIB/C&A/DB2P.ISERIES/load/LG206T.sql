LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG206T_RGR_MOV_ETQ"
 ( "CD_FL_ORI         " POSITION(00007:00009) DECIMAL
 , "CD_TIP_ETQ_ORI    " POSITION(00010:00011) DECIMAL
 , "CD_FL_ARM_ORI     " POSITION(00012:00014) DECIMAL
 , "CD_FL_DEST        " POSITION(00015:00017) DECIMAL
 , "CD_TIP_ETQ_DEST   " POSITION(00018:00019) DECIMAL
 , "CD_FL_ARM_DEST    " POSITION(00020:00022) DECIMAL
 )
