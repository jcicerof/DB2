LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."AT003T_DET_BLC_MOV"
 ( "DT_MOV            " POSITION(00007:00016) DATE EXTERNAL
 , "CD_FL             " POSITION(00017:00019) DECIMAL
 , "CD_LOG_POS        " POSITION(00020:00021) DECIMAL
 , "NU_PCI_MAPA       " POSITION(00022:00023) DECIMAL
 , "NU_BLC            " POSITION(00024:00026) DECIMAL
 , "NU_DET_BLC        " POSITION(00027:00028) DECIMAL
 , "CD_VRS_POS        " POSITION(00029:00030) DECIMAL
 , "CD_RLS_VRS        " POSITION(00031:00032) DECIMAL
 , "CD_MOV_POS        " POSITION(00033:00034) DECIMAL
 , "SR_DAD_MOV        " POSITION(00035:00284) CHAR(250)
 , "CD_SIT_DET_BLC    " POSITION(00285:00286) DECIMAL
 )
