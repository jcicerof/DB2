LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG328T_FCH_TUR_TRA"
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "DT_FCH            " POSITION(00010:00019) DATE EXTERNAL
 , "CD_PCS            " POSITION(00020:00021) DECIMAL
 , "CD_ATV            " POSITION(00022:00023) DECIMAL
 , "NI_TUR_TRA        " POSITION(00024:00025) DECIMAL
 , "CD_MDLD_ACDM_REC  " POSITION(00026:00026) CHAR(001)
 , "CD_MDLD_ACDM_DIS  " POSITION(00027:00027) CHAR(001)
 , "QT_PCA_ENT        " POSITION(00028:00032) DECIMAL
 , "QT_PCA_AJU        " POSITION(00033:00037) DECIMAL
 , "QT_PCA_DVL        " POSITION(00038:00042) DECIMAL
 , "QT_PCA_PRDC       " POSITION(00043:00047) DECIMAL
 , "QT_PCA_SLD        " POSITION(00048:00052) DECIMAL
 , "QT_PCA_DES        " POSITION(00054:00056) DECIMAL
                          NULLIF(00053)=X'FF'
 , "IN_EXG_DAD        " POSITION(00057:00057) CHAR(001)
 )
