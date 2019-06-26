LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS023T_LEL_CG     "
 ( "DT_VGM            " POSITION(00007:00016) DATE EXTERNAL
 , "NU_VGM            " POSITION(00017:00020) INTEGER
 , "DT_INI_LEL_CG     " POSITION(00021:00030) DATE EXTERNAL
 , "DT_FIM_LEL_CG     " POSITION(00031:00040) DATE EXTERNAL
 , "VL_INI_LEL_CG     " POSITION(00041:00048) DECIMAL
 , "VL_FIM_LEL_CG     " POSITION(00049:00056) DECIMAL
 , "CD_TRAN           " POSITION(00058:00061) INTEGER
                          NULLIF(00057)=X'FF'
 , "CD_SIT_LEL_CG     " POSITION(00062:00063) SMALLINT
 , "CD_TIP_VEIC       " POSITION(00064:00065) SMALLINT
 , "DS_OBS_LEL_CG     " POSITION(00066:00115) CHAR(050)
 , "DT_CGM            " POSITION(00117:00126) DATE EXTERNAL
                          NULLIF(00116)=X'FF'
 , "HR_CGM            " POSITION(00128:00135) TIME EXTERNAL
                          NULLIF(00127)=X'FF'
 , "DT_PVS_SAI_CGM    " POSITION(00137:00146) DATE EXTERNAL
                          NULLIF(00136)=X'FF'
 , "HR_PVS_SAI_CGM    " POSITION(00148:00155) TIME EXTERNAL
                          NULLIF(00147)=X'FF'
 , "DT_CHD            " POSITION(00157:00166) DATE EXTERNAL
                          NULLIF(00156)=X'FF'
 , "HR_CHD            " POSITION(00168:00175) TIME EXTERNAL
                          NULLIF(00167)=X'FF'
 , "CD_FL             " POSITION(00176:00178) DECIMAL
 , "CD_ROTA           " POSITION(00179:00180) SMALLINT
 )