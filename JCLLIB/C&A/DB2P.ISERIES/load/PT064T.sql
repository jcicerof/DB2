LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PT064T_GRU_FIB_TXL"
 ( "NI_GRU_FIB_TXL    " POSITION(00007:00010) INTEGER
 , "NO_GRU_FIB_TXL_PTG" POSITION(00011:00050) CHAR(040)
 , "NO_GRU_FIB_TXL_SPH" POSITION(00051:00090) CHAR(040)
 , "NO_GRU_FIB_TXL_IGL" POSITION(00091:00130) CHAR(040)
 )
