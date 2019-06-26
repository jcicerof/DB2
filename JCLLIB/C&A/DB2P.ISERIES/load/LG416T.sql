LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG416T_AVI_DVL_PED"
 ( "CD_TIP_EXP_ESP    " POSITION(00007:00008) DECIMAL
 , "NI_PED            " POSITION(00009:00012) DECIMAL
 , "NU_OCO_PED        " POSITION(00013:00014) DECIMAL
 , "NU_SEQ_AVI_DVL_PED" POSITION(00015:00015) DECIMAL
 , "NO_CTT_AVI_DVL_PED" POSITION(00016:00055) CHAR(040)
 , "DT_CTT_AVI_DVL_PED" POSITION(00056:00065) DATE EXTERNAL
 , "HR_CTT_AVI_DVL_PED" POSITION(00066:00073) TIME EXTERNAL
 , "CD_MEIO_CMU       " POSITION(00074:00075) DECIMAL
 , "TX_OBS_AVS_DVL_PED" POSITION(00077:00228) VARCHAR
                          NULLIF(00076)=X'FF'
 , "IN_EXG_DAD        " POSITION(00229:00229) CHAR(001)
 )