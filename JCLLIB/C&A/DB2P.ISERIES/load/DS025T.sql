LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS025T_INV_ETQ_LOJ"
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "NI_SKU            " POSITION(00010:00014) DECIMAL
 , "NI_MDL            " POSITION(00016:00019) DECIMAL
                          NULLIF(00015)=X'FF'
 , "QT_PRD_INV        " POSITION(00020:00025) DECIMAL
 , "DT_PCST_INV       " POSITION(00027:00036) DATE EXTERNAL
                          NULLIF(00026)=X'FF'
 )