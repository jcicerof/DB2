LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS003T_ITEM_PED   "
 ( "NI_PED_ETG_LOJ    " POSITION(00007:00010) INTEGER
 , "NI_MDL            " POSITION(00011:00014) DECIMAL
 , "NI_SKU            " POSITION(00015:00019) DECIMAL
 , "CD_RGI_PRC        " POSITION(00021:00024) DECIMAL
                          NULLIF(00020)=X'FF'
 , "VL_PRC_COM        " POSITION(00026:00032) DECIMAL
                          NULLIF(00025)=X'FF'
 , "PC_IPI            " POSITION(00034:00035) DECIMAL
                          NULLIF(00033)=X'FF'
 , "PC_ICMS           " POSITION(00037:00038) DECIMAL
                          NULLIF(00036)=X'FF'
 , "PC_DCT            " POSITION(00040:00042) DECIMAL
                          NULLIF(00039)=X'FF'
 , "QT_ITEM           " POSITION(00044:00049) DECIMAL
                          NULLIF(00043)=X'FF'
 , "NI_PED            " POSITION(00051:00054) DECIMAL
                          NULLIF(00050)=X'FF'
 , "QT_ITEM_PPT       " POSITION(00056:00061) DECIMAL
                          NULLIF(00055)=X'FF'
 )
