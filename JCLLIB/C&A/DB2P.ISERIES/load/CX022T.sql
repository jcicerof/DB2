LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CX022T_DVG_OCT    "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "CD_BCO            " POSITION(00010:00011) DECIMAL
 , "DT_DPO_FL         " POSITION(00012:00021) DATE EXTERNAL
 , "NU_OCT            " POSITION(00022:00027) DECIMAL
 , "DT_MOV            " POSITION(00028:00037) DATE EXTERNAL
 , "CD_AG             " POSITION(00038:00040) DECIMAL
 , "NU_CTA_CRNT       " POSITION(00041:00046) DECIMAL
 , "VL_OCT_FL         " POSITION(00047:00054) DECIMAL
 , "DT_MOV_BCO        " POSITION(00055:00064) DATE EXTERNAL
 , "DT_DPO_BCO        " POSITION(00065:00074) DATE EXTERNAL
 , "VL_OCT_BCO        " POSITION(00075:00082) DECIMAL
 , "DT_DVG            " POSITION(00083:00092) DATE EXTERNAL
 , "DS_MTV_DVG        " POSITION(00093:00142) CHAR(050)
 )
