LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG301T_NF         "
 ( "NI_DOC_FIS        " POSITION(00007:00011) DECIMAL
 , "NU_NF             " POSITION(00013:00016) DECIMAL
                          NULLIF(00012)=X'FF'
 , "NU_SRE_NF         " POSITION(00018:00019) CHAR(002)
                          NULLIF(00017)=X'FF'
 , "DS_NTZ_OPR_NF     " POSITION(00021:00120) CHAR(100)
                          NULLIF(00020)=X'FF'
 , "CD_FIS_OPR_NF     " POSITION(00122:00127) CHAR(006)
                          NULLIF(00121)=X'FF'
 , "VL_CLC_ICMS_NF    " POSITION(00129:00136) DECIMAL
                          NULLIF(00128)=X'FF'
 , "VL_ICMS_NF        " POSITION(00138:00145) DECIMAL
                          NULLIF(00137)=X'FF'
 , "VL_CLC_ICMS_SBT   " POSITION(00147:00154) DECIMAL
                          NULLIF(00146)=X'FF'
 , "VL_ICMS_SBT_NF    " POSITION(00156:00163) DECIMAL
                          NULLIF(00155)=X'FF'
 , "VL_TOT_PRD_NF     " POSITION(00165:00172) DECIMAL
                          NULLIF(00164)=X'FF'
 , "VL_FRT_NF         " POSITION(00174:00181) DECIMAL
                          NULLIF(00173)=X'FF'
 , "VL_SEGR_NF        " POSITION(00183:00190) DECIMAL
                          NULLIF(00182)=X'FF'
 , "VL_DSP_ACE_NF     " POSITION(00192:00199) DECIMAL
                          NULLIF(00191)=X'FF'
 , "VL_TOT_IPI_NF     " POSITION(00201:00208) DECIMAL
                          NULLIF(00200)=X'FF'
 , "VL_TOT_NF         " POSITION(00210:00217) DECIMAL
                          NULLIF(00209)=X'FF'
 , "VL_AMT_FIN_NF     " POSITION(00219:00226) DECIMAL
                          NULLIF(00218)=X'FF'
 , "VL_ECG_NF         " POSITION(00228:00235) DECIMAL
                          NULLIF(00227)=X'FF'
 , "IN_EXG_DAD        " POSITION(00236:00236) CHAR(001)
 )
