LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."EQ000T_ESTOQUE    "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "NI_PED            " POSITION(00010:00014) DECIMAL
 , "NI_SKU            " POSITION(00015:00019) DECIMAL
 , "DT_ATLZ           " POSITION(00020:00029) DATE EXTERNAL
 , "QT_ETQ            " POSITION(00030:00034) DECIMAL
 , "VL_CUS_CTB_UNI_ORI" POSITION(00035:00042) DECIMAL
 , "VL_CUS_CTB_UNI    " POSITION(00043:00050) DECIMAL
 , "VL_SLD_CUS_CTB    " POSITION(00051:00058) DECIMAL
 , "VL_SLD_VEN_CTB    " POSITION(00059:00066) DECIMAL
 , "VL_CUS_ETT_UNI    " POSITION(00067:00075) DECIMAL
 , "VL_SLD_CUS_ETT    " POSITION(00076:00084) DECIMAL
 , "VL_SLD_VEN_ETT    " POSITION(00085:00093) DECIMAL
 , "VL_SLD_FRT        " POSITION(00094:00102) DECIMAL
 , "CD_SIT_ETQ        " POSITION(00103:00104) DECIMAL
 )