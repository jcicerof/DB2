LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA058T_TOT_CPR_CLS"
 ( "NU_ANO_CEA        " POSITION(00007:00009) DECIMAL
 , "NU_MES_CEA        " POSITION(00010:00011) DECIMAL
 , "CD_DIV_COM        " POSITION(00012:00013) DECIMAL
 , "CD_DEPTO_COM      " POSITION(00014:00015) DECIMAL
 , "CD_USR            " POSITION(00016:00023) CHAR(008)
 , "CD_FNE            " POSITION(00024:00025) DECIMAL
 , "CD_CLS            " POSITION(00026:00027) DECIMAL
 , "VL_TOT_REM_CPR_CLS" POSITION(00028:00036) DECIMAL
 , "QT_PCA_REM_CPR_CLS" POSITION(00037:00040) INTEGER
 )