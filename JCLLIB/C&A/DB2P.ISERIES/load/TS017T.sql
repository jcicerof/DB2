LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS017T_FRT_RET    "
 ( "DT_VGM            " POSITION(00007:00016) DATE EXTERNAL
 , "NU_VGM            " POSITION(00017:00020) INTEGER
 , "DT_RET            " POSITION(00021:00030) DATE EXTERNAL
 , "HR_RET            " POSITION(00031:00038) TIME EXTERNAL
 , "CD_SIT_FRT_RET    " POSITION(00039:00040) SMALLINT
 , "DS_OBS_FRT_RET    " POSITION(00041:00090) CHAR(050)
 , "QT_M3_DPV_VGM     " POSITION(00092:00094) DECIMAL
                          NULLIF(00091)=X'FF'
 , "DT_SAI_LOJ        " POSITION(00096:00105) DATE EXTERNAL
                          NULLIF(00095)=X'FF'
 , "HR_SAI_LOJ        " POSITION(00107:00114) TIME EXTERNAL
                          NULLIF(00106)=X'FF'
 , "CD_FL             " POSITION(00115:00117) DECIMAL
 , "CD_ROTA           " POSITION(00118:00119) SMALLINT
 , "IN_EXG_DAD        " POSITION(00120:00120) CHAR(001)
 )
