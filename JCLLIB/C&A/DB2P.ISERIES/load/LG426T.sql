LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG426T_PED_DOC_FIS"
 ( "CD_TIP_EXP_ESP    " POSITION(00007:00008) DECIMAL
 , "NI_PED            " POSITION(00009:00012) DECIMAL
 , "NU_OCO_PED        " POSITION(00013:00014) DECIMAL
 , "NI_DOC_FIS        " POSITION(00015:00019) DECIMAL
 , "TP_DOC_FIS        " POSITION(00020:00020) CHAR(001)
 , "NI_DOC_EXP_ESP    " POSITION(00022:00025) INTEGER
                          NULLIF(00021)=X'FF'
 , "IN_EXP_ESP_TOT_PED" POSITION(00026:00026) CHAR(001)
 , "DT_EMS_DOC_FIS    " POSITION(00028:00037) DATE EXTERNAL
                          NULLIF(00027)=X'FF'
 , "HR_EMS_DOC_FIS    " POSITION(00039:00046) TIME EXTERNAL
                          NULLIF(00038)=X'FF'
 , "IN_EXG_DAD        " POSITION(00047:00047) CHAR(001)
 )
