LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG003T_TIP_SOL_ETI"
 ( "CD_SIT_SOL_ETI    " POSITION(00007:00007) DECIMAL
 , "DS_SIT_SOL_ETI_PRG" POSITION(00008:00027) CHAR(020)
 , "DS_SIT_SOL_ETI_SPH" POSITION(00028:00047) CHAR(020)
 , "DS_SIT_SOL_ETI_IGL" POSITION(00048:00067) CHAR(020)
 )