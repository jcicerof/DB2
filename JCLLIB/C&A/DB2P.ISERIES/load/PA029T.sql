LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA029T_MDL_GRU_PRD"
 ( "NI_MDL            " POSITION(00007:00010) DECIMAL
 , "NI_GRU_PRD        " POSITION(00011:00014) DECIMAL
 , "VL_VEN_PRD_PROM   " POSITION(00016:00022) DECIMAL
                          NULLIF(00015)=X'FF'
 )
