LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."EQ021T_DMB_DEST   "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "NI_SOL            " POSITION(00010:00015) DECIMAL
 , "NI_SKU            " POSITION(00016:00020) DECIMAL
 , "NI_SKU_DEST       " POSITION(00021:00025) DECIMAL
 , "CD_TIP_ETQ        " POSITION(00026:00027) DECIMAL
 , "CD_FL_PPR         " POSITION(00028:00030) DECIMAL
 , "QT_PCA_ATT        " POSITION(00031:00035) DECIMAL
 )
