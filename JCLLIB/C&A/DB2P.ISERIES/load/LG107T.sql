LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG107T_RGR_APV_RSU"
 ( "CD_TIP_RSU        " POSITION(00007:00008) DECIMAL
 , "CD_TIP_APV        " POSITION(00009:00010) DECIMAL
 )