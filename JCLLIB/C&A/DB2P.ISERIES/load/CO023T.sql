LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO023T_CLD_FNC    "
 ( "ST_ABE_PREV       " POSITION(00007:00007) CHAR(001)
 , "ST_ABE_REAL       " POSITION(00008:00008) CHAR(001)
 , "DS_MTV            " POSITION(00009:00058) CHAR(050)
 , "CD_FL             " POSITION(00059:00061) DECIMAL
 , "DT_CLD_FNC        " POSITION(00062:00071) DATE EXTERNAL
 )