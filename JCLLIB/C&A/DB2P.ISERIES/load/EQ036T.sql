LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."EQ036T_HIS_ESTOQUE"
 ( "DT_ATLZ           " POSITION(00007:00016) DATE EXTERNAL
 , "CD_FL             " POSITION(00017:00019) DECIMAL
 , "NI_PED            " POSITION(00020:00024) DECIMAL
 , "NI_SKU            " POSITION(00025:00029) DECIMAL
 , "CD_SIT_ETQ        " POSITION(00030:00031) DECIMAL
 , "QT_ETQ            " POSITION(00032:00036) DECIMAL
 , "VL_CUS_CTB_UNI_ORI" POSITION(00037:00044) DECIMAL
 , "VL_SLD_CUS_CTB    " POSITION(00045:00052) DECIMAL
 , "VL_CUS_CTB_UNI    " POSITION(00053:00060) DECIMAL
 , "VL_SLD_VEN_CTB    " POSITION(00061:00068) DECIMAL
 , "VL_SLD_CUS_ETT    " POSITION(00069:00077) DECIMAL
 , "VL_CUS_ETT_UNI    " POSITION(00078:00086) DECIMAL
 , "VL_SLD_VEN_ETT    " POSITION(00087:00095) DECIMAL
 , "VL_SLD_FRT        " POSITION(00096:00104) DECIMAL
 )