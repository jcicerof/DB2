LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO026T_GRU_LOJ_CNL"
 ( "CD_GRU_LOJ_CNL    " POSITION(00007:00008) DECIMAL
 , "DS_GRU_LOJ_CNL    " POSITION(00009:00038) CHAR(030)
 )
