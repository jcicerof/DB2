LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA046T_CLS_COD_PRD"
 ( "NI_GRU_PRD        " POSITION(00007:00010) DECIMAL
 , "CD_FNE            " POSITION(00011:00012) DECIMAL
 , "CD_CLS            " POSITION(00013:00014) DECIMAL
 , "CD_CLS_COD        " POSITION(00015:00016) DECIMAL
 , "VL_VEN_PRD_PROM   " POSITION(00018:00024) DECIMAL
                          NULLIF(00017)=X'FF'
 )
