LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."EQ043T_VEN_PROM   "
 ( "DT_ATLZ           " POSITION(00007:00016) DATE EXTERNAL
 , "DT_MOV            " POSITION(00017:00026) DATE EXTERNAL
 , "CD_FL             " POSITION(00027:00029) DECIMAL
 , "NI_PED            " POSITION(00030:00034) DECIMAL
 , "NI_SKU            " POSITION(00035:00039) DECIMAL
 , "NI_PROM           " POSITION(00040:00043) DECIMAL
 , "QT_VEN            " POSITION(00044:00048) DECIMAL
 , "VL_CUS_CTB        " POSITION(00049:00056) DECIMAL
 , "VL_VEN_CTB        " POSITION(00057:00064) DECIMAL
 , "VL_CUS_ETT        " POSITION(00065:00073) DECIMAL
 , "VL_VEN_ETT        " POSITION(00074:00082) DECIMAL
 , "VL_FRT            " POSITION(00083:00091) DECIMAL
 , "VL_AJU_BCP_ETT    " POSITION(00092:00100) DECIMAL
 , "VL_AJU_BCP_ASO    " POSITION(00101:00109) DECIMAL
 , "VL_AJU_BCP_CTB    " POSITION(00110:00117) DECIMAL
 )
