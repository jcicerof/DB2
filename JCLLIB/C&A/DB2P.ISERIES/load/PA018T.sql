LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA018T_PRM_SMU    "
 ( "NI_PRM_SMU        " POSITION(00007:00009) DECIMAL
 , "NU_ITV_GIRO       " POSITION(00010:00011) DECIMAL
 , "CD_CLS            " POSITION(00013:00014) DECIMAL
                          NULLIF(00012)=X'FF'
 , "CD_CLS_COD        " POSITION(00016:00017) DECIMAL
                          NULLIF(00015)=X'FF'
 , "CD_FNE            " POSITION(00019:00020) DECIMAL
                          NULLIF(00018)=X'FF'
 , "CD_PAIS           " POSITION(00021:00022) CHAR(002)
 , "CD_TXA_IFL        " POSITION(00023:00028) CHAR(006)
 , "CD_TXA_CNL        " POSITION(00029:00034) CHAR(006)
 , "CD_FNE_BASE       " POSITION(00035:00036) DECIMAL
 , "CD_PAIS_BASE      " POSITION(00037:00038) CHAR(002)
 )