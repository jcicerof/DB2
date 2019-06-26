LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CS008T_INF_CLC    "
 ( "CD_PAIS           " POSITION(00007:00008) CHAR(002)
 , "NI_PED            " POSITION(00009:00012) DECIMAL
 , "NI_SKU            " POSITION(00013:00017) DECIMAL
 , "DT_MOV            " POSITION(00018:00027) DATE EXTERNAL
 , "CD_FL             " POSITION(00028:00030) DECIMAL
 , "CD_TIP_ETQ        " POSITION(00031:00032) DECIMAL
 , "CD_FL_ARM         " POSITION(00033:00035) DECIMAL
 , "QT_PCA_INSP       " POSITION(00036:00039) INTEGER
 , "DT_ENT_ETQ        " POSITION(00040:00049) DATE EXTERNAL
 , "DT_ENT_ETQ_AJT    " POSITION(00050:00059) DATE EXTERNAL
 , "PC_ICMS_PED       " POSITION(00060:00061) DECIMAL
 , "PC_IPI_PED        " POSITION(00062:00063) DECIMAL
 , "PC_IVA_PED        " POSITION(00064:00065) DECIMAL
 , "VL_IDC_CLCD       " POSITION(00066:00074) DECIMAL
 , "VL_IDC_MCD_FI     " POSITION(00075:00083) DECIMAL
 , "VL_COM_SKU_PED    " POSITION(00084:00092) DECIMAL
 , "VL_UNI_ITEM_NF    " POSITION(00093:00101) DECIMAL
 , "CD_PAIS_DEST      " POSITION(00102:00103) CHAR(002)
 , "NI_MDL            " POSITION(00104:00107) DECIMAL
 , "ST_SKU_DMY        " POSITION(00108:00108) CHAR(001)
 , "VL_DCT_ITEM_NF    " POSITION(00109:00117) DECIMAL
 , "IN_PCST           " POSITION(00118:00119) SMALLINT
 )
