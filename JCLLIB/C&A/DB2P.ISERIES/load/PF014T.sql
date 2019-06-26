LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PF014T_CTO_RTY    "
 ( "CD_MRC            " POSITION(00007:00008) DECIMAL
 , "NU_CTO_RTY        " POSITION(00009:00012) DECIMAL
 , "DS_CTO            " POSITION(00013:00042) CHAR(030)
 , "PC_CLC_RTY        " POSITION(00043:00046) DECIMAL
 , "VL_RTY_CTO        " POSITION(00047:00053) DECIMAL
 , "VL_SLD_RTY_CTO    " POSITION(00054:00060) DECIMAL
 , "DT_VIG_INI        " POSITION(00061:00070) DATE EXTERNAL
 , "DT_VIG_FIM        " POSITION(00071:00080) DATE EXTERNAL
 , "CD_FTR_CRC_MON    " POSITION(00081:00086) CHAR(006)
 , "CD_PAIS           " POSITION(00087:00088) CHAR(002)
 , "PC_CMF            " POSITION(00090:00093) DECIMAL
                          NULLIF(00089)=X'FF'
 , "PC_COFINS         " POSITION(00095:00098) DECIMAL
                          NULLIF(00094)=X'FF'
 , "PC_DCT_FIN        " POSITION(00100:00103) DECIMAL
                          NULLIF(00099)=X'FF'
 , "PC_IR             " POSITION(00105:00108) DECIMAL
                          NULLIF(00104)=X'FF'
 , "PC_PIS            " POSITION(00110:00113) DECIMAL
                          NULLIF(00109)=X'FF'
 , "IN_CTO_RTY_ICMS   " POSITION(00114:00114) CHAR(001)
 , "IN_CTO_RTY_IPI    " POSITION(00115:00115) CHAR(001)
 , "IN_CTO_RTY_IVA    " POSITION(00116:00116) CHAR(001)
 , "IN_SIT_CTO_RTY    " POSITION(00117:00117) CHAR(001)
 , "DT_TOL_CTO_RTY    " POSITION(00119:00128) DATE EXTERNAL
                          NULLIF(00118)=X'FF'
 , "CD_TIP_CTO_RTY    " POSITION(00130:00131) SMALLINT
                          NULLIF(00129)=X'FF'
 )
