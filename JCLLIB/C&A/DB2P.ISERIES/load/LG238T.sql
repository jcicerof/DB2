LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG238T_HIS_QTD    "
 ( "CD_FL_ARM         " POSITION(00007:00009) DECIMAL
 , "DT_SAI_ETQ        " POSITION(00010:00019) DATE EXTERNAL
 , "CD_TIP_ETQ        " POSITION(00020:00021) DECIMAL
 , "CD_FL             " POSITION(00022:00024) DECIMAL
 , "NI_PED            " POSITION(00025:00028) DECIMAL
 , "CD_RGI_PRC        " POSITION(00029:00031) DECIMAL
 , "CD_PAIS           " POSITION(00032:00033) CHAR(002)
 , "CD_FNE            " POSITION(00034:00035) DECIMAL
 , "CD_DIV_COM        " POSITION(00036:00037) DECIMAL
 , "CD_DEPTO_COM      " POSITION(00038:00039) DECIMAL
 , "CD_CLS            " POSITION(00040:00041) DECIMAL
 , "CD_CLS_COD        " POSITION(00042:00043) DECIMAL
 , "QT_PCA_RTD_PVT    " POSITION(00045:00048) INTEGER
                          NULLIF(00044)=X'FF'
 , "QT_PCA_RTD_SOL    " POSITION(00050:00053) INTEGER
                          NULLIF(00049)=X'FF'
 , "QT_PCA_DIS        " POSITION(00055:00058) INTEGER
                          NULLIF(00054)=X'FF'
 )
