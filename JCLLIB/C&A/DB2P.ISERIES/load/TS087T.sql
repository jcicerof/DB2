LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS087T_TIP_CBR_FRT"
 ( "CD_TIP_CBR_FRT_RET" POSITION(00007:00008) SMALLINT
 , "NO_TIP_CBR_FRT_RET" POSITION(00009:00038) CHAR(030)
 , "CD_FMA_ACDM_REC   " POSITION(00039:00039) CHAR(001)
 )