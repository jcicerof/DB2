LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."AT018T_CTR_VRSPOS "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "CD_VRS_POS        " POSITION(00010:00011) DECIMAL
 , "DT_IMPL_VRS_POS   " POSITION(00012:00021) DATE EXTERNAL
 , "CD_RLS_VRS        " POSITION(00022:00023) DECIMAL
 )
