LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS032T_TIP_PRT_EQP"
 ( "CD_TIP_PRT_EQP    " POSITION(00007:00008) SMALLINT
 , "NO_TIP_PRT_EQP_PTG" POSITION(00009:00023) CHAR(015)
 , "NO_TIP_PRT_EQP_ESP" POSITION(00024:00038) CHAR(015)
 , "NO_TIP_PRT_EQP_ING" POSITION(00039:00053) CHAR(015)
 )
