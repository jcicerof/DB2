LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA060T_TOT_CPR_SOL"
 ( "NU_ANO_CEA        " POSITION(00007:00009) DECIMAL
 , "NU_MES_CEA        " POSITION(00010:00011) DECIMAL
 , "CD_DIV_COM        " POSITION(00012:00013) DECIMAL
 , "CD_DEPTO_COM      " POSITION(00014:00015) DECIMAL
 , "CD_USR            " POSITION(00016:00023) CHAR(008)
 , "CD_FNE            " POSITION(00024:00025) DECIMAL
 , "CD_CLS            " POSITION(00026:00027) DECIMAL
 , "CD_CLS_COD        " POSITION(00028:00029) DECIMAL
 , "NI_MDL            " POSITION(00030:00033) DECIMAL
 , "NI_SOL            " POSITION(00034:00039) DECIMAL
 , "VL_TOT_REM_CPR_SOL" POSITION(00040:00048) DECIMAL
 , "QT_PCA_REM_CPR_SOL" POSITION(00049:00052) INTEGER
 )
