LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG122T_LAU_ANL_LAB"
 ( "NI_LAU_LAB        " POSITION(00007:00011) DECIMAL
 , "TS_LAU_LAB        " POSITION(00012:00037) TIMESTAMP EXTERNAL
 , "CD_USR_INI_TST    " POSITION(00038:00045) CHAR(008)
 , "TS_INI_TST        " POSITION(00046:00071) TIMESTAMP EXTERNAL
 , "CD_USR_FNZ_TST    " POSITION(00072:00079) CHAR(008)
 , "TS_FIM_TST        " POSITION(00080:00105) TIMESTAMP EXTERNAL
 , "CD_RSU_LAU        " POSITION(00106:00107) DECIMAL
 , "DS_LAU_LAB        " POSITION(00108:00361) CHAR(254)
 , "ST_RSU_LAU_VIA_NET" POSITION(00362:00362) CHAR(001)
 , "CD_TIP_RSU_LAU    " POSITION(00363:00364) DECIMAL
 )