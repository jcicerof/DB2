LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG361T_HIS_TRD_LBL"
 ( "CD_TELA           " POSITION(00007:00016) CHAR(010)
 , "DS_IDI            " POSITION(00017:00019) CHAR(003)
 , "CD_LABEL          " POSITION(00020:00037) CHAR(018)
 , "DS_LABEL          " POSITION(00038:00077) CHAR(040)
 , "CD_PGM            " POSITION(00078:00085) CHAR(008)
 )
