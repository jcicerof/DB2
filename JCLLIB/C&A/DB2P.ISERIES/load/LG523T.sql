LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG523T_TIP_PND_FOR"
 ( "CD_TIP_PND_FOR    " POSITION(00007:00008) DECIMAL
 , "DS_TIP_PND_FOR_PRG" POSITION(00009:00033) CHAR(025)
 , "DS_TIP_PND_FOR_SPH" POSITION(00034:00058) CHAR(025)
 , "DS_TIP_PND_FOR_IGL" POSITION(00059:00083) CHAR(025)
 )