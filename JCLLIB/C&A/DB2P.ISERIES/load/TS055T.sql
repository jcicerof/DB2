LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS055T_SIT_EQP    "
 ( "CD_SIT_EQP        " POSITION(00007:00008) SMALLINT
 , "DS_SIT_EQP_PRG    " POSITION(00009:00033) CHAR(025)
 , "DS_SIT_EQP_SPH    " POSITION(00034:00058) CHAR(025)
 , "DS_SIT_EQP_IGL    " POSITION(00059:00083) CHAR(025)
 )
