LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG417T_MEIO_CMU   "
 ( "CD_MEIO_CMU       " POSITION(00007:00008) DECIMAL
 , "DS_MEIO_CMU_PRG   " POSITION(00009:00023) CHAR(015)
 , "DS_MEIO_CMU_SPH   " POSITION(00024:00038) CHAR(015)
 , "DS_MEIO_CMU_IGL   " POSITION(00039:00053) CHAR(015)
 )