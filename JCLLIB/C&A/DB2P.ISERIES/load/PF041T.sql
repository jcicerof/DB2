LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PF041T_FCH_CTO_RTY"
 ( "CD_MRC            " POSITION(00007:00008) DECIMAL
 , "NU_CTO_RTY        " POSITION(00009:00012) DECIMAL
 , "NU_FCH_CTO_RTY    " POSITION(00013:00014) SMALLINT
 , "DT_INI_FCH_CTO_RTY" POSITION(00015:00024) DATE EXTERNAL
 , "DT_FIM_FCH_CTO_RTY" POSITION(00025:00034) DATE EXTERNAL
 , "VL_DLR_CLC_FCH_CTO" POSITION(00036:00044) DECIMAL
                          NULLIF(00035)=X'FF'
 )
