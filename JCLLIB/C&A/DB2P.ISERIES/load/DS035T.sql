LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS035T_SMU_PED    "
 ( "NI_SKU            " POSITION(00007:00011) DECIMAL
 , "NI_MDL            " POSITION(00012:00015) DECIMAL
 , "CD_FOR            " POSITION(00016:00021) CHAR(006)
 , "DT_INI_ETG_PED    " POSITION(00022:00031) DATE EXTERNAL
 , "CD_LOJ            " POSITION(00032:00034) DECIMAL
 , "DT_FIM_ETG_PED    " POSITION(00035:00044) DATE EXTERNAL
 , "DT_PAD            " POSITION(00045:00054) DATE EXTERNAL
 , "PC_ICMS_PRD       " POSITION(00055:00056) DECIMAL
 , "VL_PRC_COM_PRD    " POSITION(00057:00063) DECIMAL
 , "QT_ITEM_PPT       " POSITION(00064:00069) DECIMAL
 , "QT_ITEM_APV       " POSITION(00071:00076) DECIMAL
                          NULLIF(00070)=X'FF'
 )
