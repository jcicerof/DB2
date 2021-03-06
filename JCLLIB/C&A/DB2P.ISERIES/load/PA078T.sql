LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA078T_CSD_REM    "
 ( "NI_SOL            " POSITION(00007:00012) DECIMAL
 , "CD_FNE            " POSITION(00013:00014) DECIMAL
 , "NU_ANO_CEA        " POSITION(00015:00017) DECIMAL
 , "NU_SEM_CEA        " POSITION(00018:00019) DECIMAL
 , "CD_DIV_COM        " POSITION(00020:00021) DECIMAL
 , "CD_DEPTO_COM      " POSITION(00022:00023) DECIMAL
 , "CD_CLS            " POSITION(00024:00025) DECIMAL
 , "NI_TIP_REM        " POSITION(00026:00027) DECIMAL
 , "VL_SOL_REM_SMU    " POSITION(00029:00037) DECIMAL
                          NULLIF(00028)=X'FF'
 , "VL_SOL_REM_RLZ    " POSITION(00039:00047) DECIMAL
                          NULLIF(00038)=X'FF'
 , "QT_PCA_SOL_REM_SMU" POSITION(00049:00052) INTEGER
                          NULLIF(00048)=X'FF'
 , "QT_PCA_SOL_REM_RLZ" POSITION(00054:00057) INTEGER
                          NULLIF(00053)=X'FF'
 , "QT_MDL_SOL_REM_SMU" POSITION(00059:00062) INTEGER
                          NULLIF(00058)=X'FF'
 , "QT_MDL_SOL_REM_RLZ" POSITION(00064:00067) INTEGER
                          NULLIF(00063)=X'FF'
 , "VL_SOL_REM_ATU    " POSITION(00069:00077) DECIMAL
                          NULLIF(00068)=X'FF'
 , "QT_PCA_SOL_REM_ATU" POSITION(00079:00082) INTEGER
                          NULLIF(00078)=X'FF'
 , "QT_MDL_SOL_REM_ATU" POSITION(00084:00087) INTEGER
                          NULLIF(00083)=X'FF'
 )
