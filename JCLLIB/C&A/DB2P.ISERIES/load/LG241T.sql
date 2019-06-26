LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG241T_RGR_ETQ    "
 ( "NI_SEQ_RGR        " POSITION(00007:00010) INTEGER
 , "CD_PAIS           " POSITION(00011:00012) CHAR(002)
 , "CD_FNE            " POSITION(00013:00014) DECIMAL
 , "CD_DIV_COM        " POSITION(00015:00016) DECIMAL
 , "CD_DEPTO_COM      " POSITION(00017:00018) DECIMAL
 , "CD_CLS            " POSITION(00019:00020) DECIMAL
 , "CD_CLS_COD        " POSITION(00021:00022) DECIMAL
 , "NI_MDL            " POSITION(00023:00026) DECIMAL
 , "CD_TIP_PED        " POSITION(00027:00028) DECIMAL
 , "CD_MDLD_ACDM_DIS  " POSITION(00029:00029) CHAR(001)
 , "CD_FL             " POSITION(00030:00032) DECIMAL
 , "CD_TIP_ETQ        " POSITION(00033:00034) DECIMAL
 , "NI_PED            " POSITION(00035:00038) DECIMAL
 , "CD_PCS            " POSITION(00039:00040) DECIMAL
 , "CD_ATV            " POSITION(00041:00042) DECIMAL
 , "DT_INI_VIG        " POSITION(00043:00052) DATE EXTERNAL
 , "DT_FIM_VIG        " POSITION(00053:00062) DATE EXTERNAL
 , "VL_VEN_MNR        " POSITION(00063:00069) DECIMAL
 , "VL_VEN_MAIOR      " POSITION(00070:00076) DECIMAL
 , "TS_OCO_REGRA      " POSITION(00077:00102) TIMESTAMP EXTERNAL
 , "CD_USR            " POSITION(00103:00110) CHAR(008)
 , "IN_EXG_DAD        " POSITION(00111:00111) CHAR(001)
 )