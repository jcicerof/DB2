LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."EQ042T_VEN_REM    "
 ( "DT_ATLZ           " POSITION(00007:00016) DATE EXTERNAL
 , "DT_MOV            " POSITION(00017:00026) DATE EXTERNAL
 , "CD_FL             " POSITION(00027:00029) DECIMAL
 , "NI_PED            " POSITION(00030:00034) DECIMAL
 , "NI_SKU            " POSITION(00035:00039) DECIMAL
 , "NI_REM            " POSITION(00040:00045) DECIMAL
 , "QT_VEN            " POSITION(00046:00050) DECIMAL
 , "VL_CUS_CTB        " POSITION(00051:00058) DECIMAL
 , "VL_VEN_CTB        " POSITION(00059:00066) DECIMAL
 , "VL_CUS_ETT        " POSITION(00067:00075) DECIMAL
 , "VL_VEN_ETT        " POSITION(00076:00084) DECIMAL
 , "VL_FRT            " POSITION(00085:00093) DECIMAL
 , "VL_AJU_BCP_ETT    " POSITION(00094:00102) DECIMAL
 , "VL_AJU_BCP_ASO    " POSITION(00103:00111) DECIMAL
 , "VL_AJU_BCP_CTB    " POSITION(00112:00119) DECIMAL
 )
