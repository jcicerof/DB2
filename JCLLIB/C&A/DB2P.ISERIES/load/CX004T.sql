LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CX004T_TIPO_TROCO "
 ( "CD_TIP_TRO        " POSITION(00007:00007) DECIMAL
 , "DS_TIP_TRO_PRG    " POSITION(00008:00037) CHAR(030)
 , "DS_TIP_TRO_SPH    " POSITION(00038:00067) CHAR(030)
 , "DS_TIP_TRO_IGL    " POSITION(00068:00097) CHAR(030)
 )