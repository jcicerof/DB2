LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PT038T_COR_SET_CLC"
 ( "CD_TMA_CLC        " POSITION(00007:00009) DECIMAL
 , "CD_GRU_CLC        " POSITION(00010:00012) DECIMAL
 , "CD_SET_CLC        " POSITION(00013:00016) DECIMAL
 , "CD_COR            " POSITION(00017:00018) DECIMAL
 , "CD_TOM            " POSITION(00019:00020) DECIMAL
 )
