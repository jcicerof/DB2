LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG548T_FND_ATD_REC"
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "DT_ATD_REC        " POSITION(00010:00019) DATE EXTERNAL
 , "NU_ATD_REC        " POSITION(00020:00022) DECIMAL
 , "HR_ATD_REC        " POSITION(00023:00030) TIME EXTERNAL
 , "CD_FND_VST_FOR    " POSITION(00031:00032) DECIMAL
 , "IN_EXG_DAD        " POSITION(00033:00033) CHAR(001)
 )
