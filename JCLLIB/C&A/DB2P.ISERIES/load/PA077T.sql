LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA077T_MDL_REM_COM"
 ( "CD_CLS            " POSITION(00007:00008) DECIMAL
 , "CD_FNE            " POSITION(00009:00010) DECIMAL
 , "CD_CLS_COD        " POSITION(00011:00012) DECIMAL
 , "NI_MDL            " POSITION(00013:00016) DECIMAL
 , "DT_ULT_PCST_MDL   " POSITION(00017:00026) DATE EXTERNAL
 , "CD_ICTC_MDL       " POSITION(00027:00028) SMALLINT
 )
