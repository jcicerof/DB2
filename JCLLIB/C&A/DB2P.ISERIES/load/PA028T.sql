LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA028T_GRU_PRD_BNF"
 ( "NI_PROM           " POSITION(00007:00010) DECIMAL
 , "CD_COND_PROM      " POSITION(00011:00012) DECIMAL
 , "NI_GRU_PRD        " POSITION(00013:00016) DECIMAL
 , "PC_PTC            " POSITION(00017:00019) DECIMAL
 )