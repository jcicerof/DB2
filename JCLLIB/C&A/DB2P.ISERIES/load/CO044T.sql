LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO044T_ICMS_CLS   "
 ( "CD_UF_ORI         " POSITION(00007:00008) CHAR(002)
 , "CD_UF_DTN         " POSITION(00009:00010) CHAR(002)
 , "CD_TIP_OPR        " POSITION(00011:00012) SMALLINT
 , "CD_CLS            " POSITION(00013:00014) DECIMAL
 , "DT_INI_VIG_ECC_CLS" POSITION(00015:00024) DATE EXTERNAL
 , "DT_FIM_VIG_ECC_CLS" POSITION(00025:00034) DATE EXTERNAL
 , "AL_ECC_ICMS_CLS   " POSITION(00035:00037) DECIMAL
 , "CD_TIP_SIT_TBT    " POSITION(00038:00038) CHAR(001)
 )
