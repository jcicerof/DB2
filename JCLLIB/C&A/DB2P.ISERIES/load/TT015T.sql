LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TT015T_LSNG_CRD   "
 ( "NU_CAR_INI_CRD    " POSITION(00007:00015) DECIMAL
 , "NU_CAR_FIM_CRD    " POSITION(00016:00024) DECIMAL
 , "CD_MTV_INC        " POSITION(00025:00025) CHAR(001)
 )