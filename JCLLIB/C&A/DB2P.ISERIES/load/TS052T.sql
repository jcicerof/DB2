LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS052T_SIT_SOL    "
 ( "CD_SIT_SOL        " POSITION(00007:00008) SMALLINT
 , "DS_SIT_SOL_PRG    " POSITION(00009:00033) CHAR(025)
 , "DS_SIT_SOL_SPH    " POSITION(00034:00058) CHAR(025)
 , "DS_SIT_SOL_IGL    " POSITION(00059:00083) CHAR(025)
 )
