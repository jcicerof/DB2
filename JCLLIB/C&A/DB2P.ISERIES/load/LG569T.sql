LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG569T_DVG_CFC_PED"
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "NI_PED            " POSITION(00010:00013) DECIMAL
 , "NU_REC_PED        " POSITION(00014:00015) DECIMAL
 , "CD_FL_DTN         " POSITION(00016:00018) DECIMAL
 , "CD_TIP_DVG_REC    " POSITION(00019:00020) DECIMAL
 , "DT_DVG_CFC_PACK_LO" POSITION(00022:00031) DATE EXTERNAL
                          NULLIF(00021)=X'FF'
 , "HR_DVG_CFC_PACK_LO" POSITION(00033:00040) TIME EXTERNAL
                          NULLIF(00032)=X'FF'
 , "CD_USR            " POSITION(00042:00049) CHAR(008)
                          NULLIF(00041)=X'FF'
 , "IN_EXG_DAD        " POSITION(00050:00050) CHAR(001)
 )