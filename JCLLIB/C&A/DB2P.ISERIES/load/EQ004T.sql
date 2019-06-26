LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."EQ004T_PRM_INV_FL "
 ( "CD_PAIS           " POSITION(00007:00008) CHAR(002)
 , "NU_ANO_BASE_INV   " POSITION(00009:00011) DECIMAL
 , "NU_INV            " POSITION(00012:00013) DECIMAL
 , "CD_FL             " POSITION(00014:00016) DECIMAL
 , "CD_TIP_ETQ        " POSITION(00017:00018) DECIMAL
 , "CD_FL_ARM         " POSITION(00019:00021) DECIMAL
 , "DT_FSI_INV        " POSITION(00022:00031) DATE EXTERNAL
 , "DT_BASE_INV       " POSITION(00032:00041) DATE EXTERNAL
 , "IN_EMS_ACMD       " POSITION(00042:00042) CHAR(001)
 , "ST_CONT_FSI       " POSITION(00043:00043) CHAR(001)
 , "CD_INV_FL_CAN     " POSITION(00044:00044) CHAR(001)
 , "ST_REC_CONT_FSI   " POSITION(00045:00045) CHAR(001)
 , "ST_EXTC_POS_BASE  " POSITION(00046:00046) CHAR(001)
 , "ST_EXTC_POS_FSI   " POSITION(00047:00047) CHAR(001)
 , "DT_FIM_INV_BASE   " POSITION(00048:00057) DATE EXTERNAL
 , "DT_FIM_INV_DTA_FSI" POSITION(00058:00067) DATE EXTERNAL
 , "CD_AJT_INV        " POSITION(00068:00068) CHAR(001)
 , "DT_AJT_INV        " POSITION(00070:00079) DATE EXTERNAL
                          NULLIF(00069)=X'FF'
 , "DT_LIBR_CONT_FSI  " POSITION(00081:00090) DATE EXTERNAL
                          NULLIF(00080)=X'FF'
 , "DT_LIBR_DTA_BASE  " POSITION(00092:00101) DATE EXTERNAL
                          NULLIF(00091)=X'FF'
 , "DT_LIBR_DTA_FSI   " POSITION(00103:00112) DATE EXTERNAL
                          NULLIF(00102)=X'FF'
 , "DT_LIBR_TRS       " POSITION(00114:00123) DATE EXTERNAL
                          NULLIF(00113)=X'FF'
 )