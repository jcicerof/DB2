LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA049T_REF_PRC_DMB"
 ( "CD_FNE            " POSITION(00007:00008) DECIMAL
 , "CD_PAIS           " POSITION(00009:00010) CHAR(002)
 , "CD_REF            " POSITION(00011:00013) DECIMAL
 , "CD_CLS            " POSITION(00014:00015) DECIMAL
 , "CD_CLS_COD        " POSITION(00016:00017) DECIMAL
 , "CD_REF_DMB        " POSITION(00019:00021) DECIMAL
                          NULLIF(00018)=X'FF'
 )
