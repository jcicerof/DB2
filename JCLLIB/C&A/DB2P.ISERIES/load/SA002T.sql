LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."SA002T_ITEM_AVL   "
 ( "NI_ITEM_AVL       " POSITION(00007:00008) SMALLINT
 , "NI_GRU_AVL        " POSITION(00009:00010) SMALLINT
 , "NO_ITEM_AVL_PTG   " POSITION(00011:00110) CHAR(100)
 , "NO_ITEM_AVL_SPH   " POSITION(00111:00210) CHAR(100)
 , "NO_ITEM_AVL_IGL   " POSITION(00211:00310) CHAR(100)
 )
