LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS099T_CHD_LOJ    "
 ( "CD_MEIO_TRP       " POSITION(00007:00008) SMALLINT
 , "CD_FL_ORI         " POSITION(00009:00011) DECIMAL
 , "CD_FL_DTN         " POSITION(00012:00014) DECIMAL
 , "IN_PAS_CNT_DIS    " POSITION(00015:00015) CHAR(001)
 , "NU_HO_PVT_VGM     " POSITION(00016:00017) SMALLINT
 , "NU_DIA_PVT_VGM    " POSITION(00018:00019) SMALLINT
 , "TS_ATU            " POSITION(00020:00045) TIMESTAMP EXTERNAL
 , "CD_USR            " POSITION(00046:00053) CHAR(008)
 , "NU_KM_VGM         " POSITION(00054:00055) SMALLINT
 )
