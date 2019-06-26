LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG100T_AMOSTRA    "
 ( "NI_AMST           " POSITION(00007:00010) DECIMAL
 , "DT_REC_AMST       " POSITION(00011:00020) DATE EXTERNAL
 , "CD_TIP_AMST       " POSITION(00021:00022) DECIMAL
 , "CD_SIT_AMST       " POSITION(00023:00024) DECIMAL
 , "NI_PED_ORI        " POSITION(00025:00028) DECIMAL
 , "CD_USR_RPO        " POSITION(00029:00036) CHAR(008)
 , "DT_IMP_ETI        " POSITION(00038:00047) DATE EXTERNAL
                          NULLIF(00037)=X'FF'
 , "IN_EXG_DAD        " POSITION(00048:00048) CHAR(001)
 )
