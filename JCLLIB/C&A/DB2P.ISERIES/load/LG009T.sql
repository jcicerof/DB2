LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG009T_TIP_PCS_SOL"
 ( "CD_TIP_PCS_SOL    " POSITION(00007:00008) DECIMAL
 , "DS_TIP_PCS_SOL_PRG" POSITION(00009:00023) CHAR(015)
 , "DS_TIP_PCS_SOL_SPH" POSITION(00024:00038) CHAR(015)
 , "DS_TIP_PCS_SOL_IGL" POSITION(00039:00053) CHAR(015)
 )