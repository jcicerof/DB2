LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG505T_TIP_DVG_REC"
 ( "CD_TIP_DVG_REC    " POSITION(00007:00008) DECIMAL
 , "DS_TIP_DVG_REC_PRG" POSITION(00009:00033) CHAR(025)
 , "DS_TIP_DVG_REC_SPH" POSITION(00034:00058) CHAR(025)
 , "DS_TIP_DVG_REC_IGL" POSITION(00059:00083) CHAR(025)
 , "ST_BLQ_PCS        " POSITION(00084:00084) CHAR(001)
 , "CD_PCS            " POSITION(00085:00086) DECIMAL
 , "CD_GRU_DVG_REC    " POSITION(00087:00088) DECIMAL
 )