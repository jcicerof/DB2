LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG126T_RGR_REC_FOR"
 ( "CD_RGR_REC_FOR    " POSITION(00007:00007) CHAR(001)
 , "DS_RGR_REC_FOR_PRG" POSITION(00008:00027) CHAR(020)
 , "DS_RGR_REC_FOR_SPH" POSITION(00028:00047) CHAR(020)
 , "DS_RGR_REC_FOR_IGL" POSITION(00048:00067) CHAR(020)
 , "NU_NIV_RGR_REC_FOR" POSITION(00068:00069) DECIMAL
 , "ST_AMST_PRE_REC   " POSITION(00070:00070) CHAR(001)
 , "ST_AMST_PED       " POSITION(00071:00071) CHAR(001)
 , "ST_INSP_QLD       " POSITION(00072:00072) CHAR(001)
 , "QT_MES_ANL_AMST   " POSITION(00073:00074) DECIMAL
 , "QT_PCA_RGR        " POSITION(00075:00079) DECIMAL
 , "PC_DVL            " POSITION(00080:00082) DECIMAL
 , "PC_AUD_QLD        " POSITION(00083:00085) DECIMAL
 , "MN_PRD            " POSITION(00086:00088) CHAR(003)
 , "IN_EXG_DAD        " POSITION(00089:00089) CHAR(001)
 )
