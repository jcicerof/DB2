LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PT063T_ESPL_MDL   "
 ( "NI_SKU            " POSITION(00007:00011) DECIMAL
 , "NI_MDL            " POSITION(00012:00015) DECIMAL
 , "NI_SKU_ESPL       " POSITION(00016:00020) DECIMAL
 , "NI_MDL_ESPL       " POSITION(00021:00024) DECIMAL
 , "IN_SKU_DMY        " POSITION(00025:00025) CHAR(001)
 )