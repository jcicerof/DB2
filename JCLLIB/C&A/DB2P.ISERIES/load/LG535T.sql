LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG535T_GRU_DVG_REC"
 ( "CD_GRU_DVG_REC    " POSITION(00007:00008) DECIMAL
 , "DS_GRU_DVG_REC_PRG" POSITION(00009:00038) CHAR(030)
 , "DS_GRU_DVG_REC_SPH" POSITION(00039:00068) CHAR(030)
 , "DS_GRU_DVG_REC_IGL" POSITION(00069:00098) CHAR(030)
 )
