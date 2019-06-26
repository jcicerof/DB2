LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG360T_DET_CTR_TRS"
 ( "NI_DOC_FIS        " POSITION(00007:00011) DECIMAL
 , "NI_PED            " POSITION(00012:00015) DECIMAL
 , "CD_PACK_REC       " POSITION(00016:00016) CHAR(001)
 , "NU_PACK_REC       " POSITION(00017:00019) DECIMAL
 , "NI_SKU            " POSITION(00020:00024) DECIMAL
 , "CD_FL_DTN         " POSITION(00025:00027) DECIMAL
 , "QT_PCA_TRS        " POSITION(00028:00031) INTEGER
 , "IN_ENT_ETQ        " POSITION(00032:00032) CHAR(001)
 , "NI_PL             " POSITION(00034:00038) DECIMAL
                          NULLIF(00033)=X'FF'
 , "DT_ENT_ETQ        " POSITION(00040:00049) DATE EXTERNAL
                          NULLIF(00039)=X'FF'
 , "CD_TIP_ETQ_DTN    " POSITION(00051:00052) DECIMAL
                          NULLIF(00050)=X'FF'
 , "IN_SKU_CVS_LGD    " POSITION(00053:00053) CHAR(001)
 , "IN_EXG_DAD        " POSITION(00054:00054) CHAR(001)
 )