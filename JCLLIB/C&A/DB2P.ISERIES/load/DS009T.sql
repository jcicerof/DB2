LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS009T_NF         "
 ( "NI_NF             " POSITION(00007:00012) DECIMAL
 , "NU_NF             " POSITION(00014:00017) DECIMAL
                          NULLIF(00013)=X'FF'
 , "NU_SRE            " POSITION(00019:00027) VARCHAR
                          NULLIF(00018)=X'FF'
 , "CD_LOJ            " POSITION(00029:00031) DECIMAL
                          NULLIF(00028)=X'FF'
 , "CD_FOR            " POSITION(00032:00037) CHAR(006)
 , "DT_EMSS           " POSITION(00039:00048) DATE EXTERNAL
                          NULLIF(00038)=X'FF'
 , "CD_CFOP           " POSITION(00050:00067) CHAR(018)
                          NULLIF(00049)=X'FF'
 , "HR_EMSS           " POSITION(00069:00076) TIME EXTERNAL
                          NULLIF(00068)=X'FF'
 , "VL_BASE_CAL_ICMS  " POSITION(00078:00084) DECIMAL
                          NULLIF(00077)=X'FF'
 , "VL_TOT_ICMS       " POSITION(00086:00092) DECIMAL
                          NULLIF(00085)=X'FF'
 , "VL_TOT_IPI        " POSITION(00094:00100) DECIMAL
                          NULLIF(00093)=X'FF'
 , "VL_TOT_DCT        " POSITION(00102:00108) DECIMAL
                          NULLIF(00101)=X'FF'
 , "VL_FRT            " POSITION(00110:00116) DECIMAL
                          NULLIF(00109)=X'FF'
 , "VL_TOT_PRD        " POSITION(00118:00124) DECIMAL
                          NULLIF(00117)=X'FF'
 , "VL_TOT_NF         " POSITION(00125:00131) DECIMAL
 , "CD_TP_NF          " POSITION(00133:00134) DECIMAL
                          NULLIF(00132)=X'FF'
 , "CD_USR            " POSITION(00136:00143) CHAR(008)
                          NULLIF(00135)=X'FF'
 , "DT_REC            " POSITION(00145:00154) DATE EXTERNAL
                          NULLIF(00144)=X'FF'
 , "DT_ULT_ATLZ_NF    " POSITION(00156:00165) DATE EXTERNAL
                          NULLIF(00155)=X'FF'
 )
