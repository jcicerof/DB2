LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS081T_FCH_VGM    "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "CD_RGI_TRNP       " POSITION(00010:00011) SMALLINT
 , "CD_TIP_FCH_VGM    " POSITION(00012:00013) SMALLINT
 , "DT_INI_FCH_VGM    " POSITION(00014:00023) DATE EXTERNAL
 , "CD_SIT_FCH_VGM    " POSITION(00024:00025) SMALLINT
 , "DT_FIM_FCH_VGM    " POSITION(00026:00035) DATE EXTERNAL
 , "DT_FCH_CUS        " POSITION(00037:00046) DATE EXTERNAL
                          NULLIF(00036)=X'FF'
 , "HR_FCH_CUS        " POSITION(00048:00055) TIME EXTERNAL
                          NULLIF(00047)=X'FF'
 , "CD_USR            " POSITION(00057:00064) CHAR(008)
                          NULLIF(00056)=X'FF'
 , "QT_VGM_RLZ        " POSITION(00066:00069) INTEGER
                          NULLIF(00065)=X'FF'
 , "QT_M3_TRPR_VGM    " POSITION(00071:00075) DECIMAL
                          NULLIF(00070)=X'FF'
 , "QT_M3_CAPC_EQP_VGM" POSITION(00077:00081) DECIMAL
                          NULLIF(00076)=X'FF'
 , "QT_M3_PVT_MEN     " POSITION(00083:00087) DECIMAL
                          NULLIF(00082)=X'FF'
 , "VL_PAG_FRT        " POSITION(00089:00096) DECIMAL
                          NULLIF(00088)=X'FF'
 )
