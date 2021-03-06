LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."OL002T_ATVD_OPD   "
 ( "CD_OPD_LGS        " POSITION(00007:00009) DECIMAL
 , "CD_ATVD           " POSITION(00010:00011) SMALLINT
 , "DT_INI_VIG        " POSITION(00012:00021) DATE EXTERNAL
 , "DT_FIM_VIG        " POSITION(00022:00031) DATE EXTERNAL
 , "CD_FTR_CRC_MON    " POSITION(00032:00037) CHAR(006)
 , "VL_CST_ATVD_PCA   " POSITION(00038:00046) DECIMAL
 , "VL_CST_ATVD_VOL   " POSITION(00047:00055) DECIMAL
 , "QT_PCA_VOL        " POSITION(00056:00057) SMALLINT
 , "CD_USR            " POSITION(00058:00065) CHAR(008)
 , "DT_ULT_ATLZ       " POSITION(00066:00075) DATE EXTERNAL
 , "HR_ULT_ATLZ       " POSITION(00076:00083) TIME EXTERNAL
 , "IN_APL_QTD_DIA_CST" POSITION(00084:00084) CHAR(001)
 )
