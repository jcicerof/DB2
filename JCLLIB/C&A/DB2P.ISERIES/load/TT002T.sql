LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TT002T_ECC_TRM    "
 ( "CD_ADMR_CRE       " POSITION(00007:00008) SMALLINT
 , "DT_ECC_TRM_ADMR_CR" POSITION(00009:00018) DATE EXTERNAL
 )
