LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."ES005T_VEN_LOJ    "
 ( "DT_MOV_VEN_LOJ    " POSITION(00007:00016) DATE EXTERNAL
 , "CD_FL             " POSITION(00017:00019) DECIMAL
 , "CD_DIV_COM        " POSITION(00020:00021) DECIMAL
 , "HR_ITT            " POSITION(00022:00025) CHAR(004)
 , "CD_TIP_ORI_ITT    " POSITION(00026:00026) CHAR(001)
 , "QT_VEN_LOJ        " POSITION(00027:00030) INTEGER
 , "VL_VEN_LOJ        " POSITION(00031:00038) DECIMAL
 )