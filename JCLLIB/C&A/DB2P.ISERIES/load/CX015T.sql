LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CX015T_MAPA       "
 ( "DT_MOV            " POSITION(00007:00016) DATE EXTERNAL
 , "CD_FL             " POSITION(00017:00019) DECIMAL
 , "CD_CAT_OPR        " POSITION(00020:00021) DECIMAL
 , "CD_TIP_OPR        " POSITION(00022:00023) DECIMAL
 , "CD_FMA_PAG        " POSITION(00024:00025) DECIMAL
 , "DT_INC_MOV        " POSITION(00026:00035) DATE EXTERNAL
 , "VL_OPR            " POSITION(00036:00043) DECIMAL
 , "ST_CTBLZ          " POSITION(00044:00044) CHAR(001)
 , "DT_CTBLZ          " POSITION(00045:00054) DATE EXTERNAL
 )