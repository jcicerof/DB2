LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PF045T_CTR_ALQ_RTY"
 ( "CD_MRC            " POSITION(00007:00008) DECIMAL
 , "NU_CTO_RTY        " POSITION(00009:00012) DECIMAL
 , "CD_ALQ_CTO_RTY    " POSITION(00013:00014) SMALLINT
 , "DT_INI_VIG_ALQ    " POSITION(00015:00024) DATE EXTERNAL
 , "DT_FIM_VIG_ALQ    " POSITION(00025:00034) DATE EXTERNAL
 , "PC_CLC_ALQ_CTO_RTY" POSITION(00035:00038) DECIMAL
 )