LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."EQ052T_CTR_PAIS   "
 ( "CD_PAIS           " POSITION(00007:00008) CHAR(002)
 , "DT_ULT_PROCE_PAIS " POSITION(00009:00018) DATE EXTERNAL
 , "NU_ANO_CRC_IFL_HIS" POSITION(00019:00021) DECIMAL
 , "NU_MES_CRC_IFL_HIS" POSITION(00022:00023) DECIMAL
 )
