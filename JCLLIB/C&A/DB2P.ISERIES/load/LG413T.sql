LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG413T_SKU_PED_EXP"
 ( "CD_TIP_EXP_ESP    " POSITION(00007:00008) DECIMAL
 , "NI_PED            " POSITION(00009:00012) DECIMAL
 , "NU_OCO_PED        " POSITION(00013:00014) DECIMAL
 , "CD_FL             " POSITION(00015:00017) DECIMAL
 , "CD_PACK_REC       " POSITION(00018:00018) CHAR(001)
 , "NU_PACK_REC       " POSITION(00019:00021) DECIMAL
 , "NI_SKU            " POSITION(00022:00026) DECIMAL
 , "QT_PCA_EXP_ESP    " POSITION(00027:00029) DECIMAL
 , "CD_FOR_DON        " POSITION(00031:00036) CHAR(006)
                          NULLIF(00030)=X'FF'
 , "IN_EXG_DAD        " POSITION(00037:00037) CHAR(001)
 )
