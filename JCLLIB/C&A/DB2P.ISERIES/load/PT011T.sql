LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PT011T_FIB_TXL_ART"
 ( "NI_MDL            " POSITION(00007:00010) DECIMAL
 , "NI_ART            " POSITION(00011:00012) DECIMAL
 , "CD_FIB_TXL        " POSITION(00013:00014) DECIMAL
 , "CD_TIP_APL_FIB    " POSITION(00015:00016) DECIMAL
 , "PC_FIB_TXL_ART    " POSITION(00017:00019) DECIMAL
 )
