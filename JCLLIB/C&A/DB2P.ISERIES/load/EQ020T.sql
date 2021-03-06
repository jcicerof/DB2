LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."EQ020T_PED_SOL    "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "NI_SOL            " POSITION(00010:00015) DECIMAL
 , "NI_SKU            " POSITION(00016:00020) DECIMAL
 , "NI_PED            " POSITION(00021:00025) DECIMAL
 , "CD_TIP_ETQ        " POSITION(00026:00027) DECIMAL
 , "CD_FL_PPR         " POSITION(00028:00030) DECIMAL
 , "QT_PCA_ATT        " POSITION(00031:00035) DECIMAL
 , "VL_CUS_CTB_UNI    " POSITION(00037:00044) DECIMAL
                          NULLIF(00036)=X'FF'
 , "CD_REF_PED        " POSITION(00046:00048) DECIMAL
                          NULLIF(00045)=X'FF'
 , "CD_PED_LGD        " POSITION(00050:00058) CHAR(009)
                          NULLIF(00049)=X'FF'
 , "CD_POS_COR        " POSITION(00060:00060) DECIMAL
                          NULLIF(00059)=X'FF'
 , "CD_POS_TAM        " POSITION(00062:00062) DECIMAL
                          NULLIF(00061)=X'FF'
 , "CD_MOV_RIS        " POSITION(00064:00064) CHAR(001)
                          NULLIF(00063)=X'FF'
 )
