LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS064T_NF_RCG     "
 ( "NI_NF_RCG         " POSITION(00007:00010) INTEGER
 , "NU_NF_RCG         " POSITION(00012:00015) INTEGER
                          NULLIF(00011)=X'FF'
 , "NU_SER_NF_RCG     " POSITION(00017:00019) CHAR(003)
                          NULLIF(00016)=X'FF'
 , "CD_FL             " POSITION(00021:00023) DECIMAL
                          NULLIF(00020)=X'FF'
 , "CD_FOR            " POSITION(00025:00030) CHAR(006)
                          NULLIF(00024)=X'FF'
 , "DT_EMS_NF         " POSITION(00032:00041) DATE EXTERNAL
                          NULLIF(00031)=X'FF'
 , "PC_ISS            " POSITION(00043:00045) DECIMAL
                          NULLIF(00042)=X'FF'
 , "VL_BASE_CLC_ISS   " POSITION(00047:00055) DECIMAL
                          NULLIF(00046)=X'FF'
 , "VL_ISS            " POSITION(00057:00065) DECIMAL
                          NULLIF(00056)=X'FF'
 , "PC_IR             " POSITION(00067:00069) DECIMAL
                          NULLIF(00066)=X'FF'
 , "VL_BASE_CLC_IR    " POSITION(00071:00079) DECIMAL
                          NULLIF(00070)=X'FF'
 , "VL_IR             " POSITION(00081:00089) DECIMAL
                          NULLIF(00080)=X'FF'
 , "VL_TOT_NF         " POSITION(00091:00099) DECIMAL
                          NULLIF(00090)=X'FF'
 , "DT_MAX_PCST       " POSITION(00101:00110) DATE EXTERNAL
                          NULLIF(00100)=X'FF'
 , "IN_ENV_SAP        " POSITION(00111:00111) CHAR(001)
 , "DT_PAG_FOR_RCG    " POSITION(00113:00122) DATE EXTERNAL
                          NULLIF(00112)=X'FF'
 )
