LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."GR003T_SIT_CAR    "
 ( "CD_SIT_CAR        " POSITION(00007:00008) DECIMAL
 , "DS_SIT_CAR_PRG    " POSITION(00009:00038) CHAR(030)
 , "DS_SIT_CAR_SPH    " POSITION(00039:00068) CHAR(030)
 , "DS_SIT_CAR_IGL    " POSITION(00069:00098) CHAR(030)
 )