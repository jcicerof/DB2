LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PF034T_COR_PED    "
 ( "NI_PED            " POSITION(00007:00010) DECIMAL
 , "CD_COR            " POSITION(00011:00012) DECIMAL
 , "CD_TOM            " POSITION(00013:00014) DECIMAL
 , "DS_CMPL_COR       " POSITION(00016:00067) VARCHAR
                          NULLIF(00015)=X'FF'
 )
