LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS068T_TIP_EQP    "
 ( "CD_TIP_EQP        " POSITION(00007:00008) SMALLINT
 , "DS_TIP_EQP_PRG    " POSITION(00009:00033) CHAR(025)
 , "DS_TIP_EQP_SPH    " POSITION(00034:00058) CHAR(025)
 , "DS_TIP_EQP_IGL    " POSITION(00059:00083) CHAR(025)
 )
