LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA096T_TIP_ATZ_MDL"
 ( "CD_TIP_ATZ_MDL    " POSITION(00007:00008) SMALLINT
 , "TX_TIP_ATZ_MDL_PTG" POSITION(00009:00058) CHAR(050)
 , "TX_TIP_ATZ_MDL_SPH" POSITION(00059:00108) CHAR(050)
 , "TX_TIP_ATZ_MDL_IGL" POSITION(00109:00158) CHAR(050)
 )