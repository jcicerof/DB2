LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG104T_FIB_TXL_DVG"
 ( "PC_FIB_TXL_DVG    " POSITION(00007:00009) DECIMAL
 , "NI_AMST           " POSITION(00010:00013) DECIMAL
 , "NI_MDL            " POSITION(00014:00017) DECIMAL
 , "NI_ART            " POSITION(00018:00019) DECIMAL
 , "CD_FIB_TXL        " POSITION(00020:00022) DECIMAL
 , "CD_TIP_APL_FIB    " POSITION(00023:00024) DECIMAL
 )
