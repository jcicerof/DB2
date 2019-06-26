LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS076T_VLR_FRT_VGM"
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "CD_ROTA           " POSITION(00010:00011) SMALLINT
 , "CD_TRAN           " POSITION(00012:00015) INTEGER
 , "CD_TIP_VEIC       " POSITION(00016:00017) SMALLINT
 , "DT_INI_VIG        " POSITION(00018:00027) DATE EXTERNAL
 , "DT_FIM_VIG        " POSITION(00029:00038) DATE EXTERNAL
                          NULLIF(00028)=X'FF'
 , "VL_FRT_VGM_NOR    " POSITION(00039:00046) DECIMAL
 , "VL_FRT_VGM_XTR    " POSITION(00047:00054) DECIMAL
 , "VL_DIR_VGM        " POSITION(00055:00062) DECIMAL
 , "VL_VGM_PRA_RET    " POSITION(00063:00070) DECIMAL
 , "CD_USR            " POSITION(00072:00079) CHAR(008)
                          NULLIF(00071)=X'FF'
 , "VL_MNT_VGM        " POSITION(00081:00088) DECIMAL
                          NULLIF(00080)=X'FF'
 , "CD_USR_ATLZ       " POSITION(00090:00097) CHAR(008)
                          NULLIF(00089)=X'FF'
 , "IN_EXG_DAD        " POSITION(00098:00098) CHAR(001)
 )
