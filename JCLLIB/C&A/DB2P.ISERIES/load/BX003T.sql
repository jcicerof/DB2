LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."BX003T_NUMSKU_PARA"
 ( "NI_PED_RIS        " POSITION(00007:00010) DECIMAL
 , "NI_SKU            " POSITION(00011:00015) DECIMAL
 , "CD_PACK_PED       " POSITION(00016:00016) CHAR(001)
 , "CD_POS_COR        " POSITION(00017:00018) DECIMAL
 , "CD_POS_TAM        " POSITION(00019:00020) DECIMAL
 , "DS_COR            " POSITION(00021:00050) CHAR(030)
 , "QT_REC_SKU        " POSITION(00052:00057) DECIMAL
                          NULLIF(00051)=X'FF'
 )
