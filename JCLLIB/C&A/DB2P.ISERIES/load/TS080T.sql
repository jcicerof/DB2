LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS080T_VEIC_SCL   "
 ( "DT_VGM            " POSITION(00007:00016) DATE EXTERNAL
 , "NU_VGM            " POSITION(00017:00020) INTEGER
 , "NU_SCL_VGM        " POSITION(00021:00022) SMALLINT
 , "CD_VEIC           " POSITION(00023:00030) CHAR(008)
 , "TS_GER_SCL        " POSITION(00032:00057) TIMESTAMP EXTERNAL
                          NULLIF(00031)=X'FF'
 , "IN_EXG_DAD        " POSITION(00058:00058) CHAR(001)
 )