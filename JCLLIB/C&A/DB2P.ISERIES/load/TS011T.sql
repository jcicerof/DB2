LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS011T_EQP_SCL    "
 ( "DT_VGM            " POSITION(00007:00016) DATE EXTERNAL
 , "NU_VGM            " POSITION(00017:00020) INTEGER
 , "NU_SCL_VGM        " POSITION(00021:00022) SMALLINT
 , "CD_EQP            " POSITION(00023:00026) INTEGER
 , "TS_GER_SCL        " POSITION(00028:00053) TIMESTAMP EXTERNAL
                          NULLIF(00027)=X'FF'
 , "IN_EXG_DAD        " POSITION(00054:00054) CHAR(001)
 )
