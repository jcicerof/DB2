LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO100T_CPL_INF_FOR"
 ( "CD_FOR            " POSITION(00007:00012) CHAR(006)
 , "CD_TIP_BLQ_SOC    " POSITION(00013:00014) SMALLINT
 , "CD_TIP_BLQ_CML    " POSITION(00015:00016) SMALLINT
 , "CD_SIT_TBT        " POSITION(00017:00018) SMALLINT
 , "CD_CCO_FOR        " POSITION(00019:00020) SMALLINT
 , "QT_DIA_ANT_EMS_PED" POSITION(00022:00023) SMALLINT
                          NULLIF(00021)=X'FF'
 )
