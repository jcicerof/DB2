LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG345T_USR_PFL    "
 ( "CD_USR            " POSITION(00007:00014) CHAR(008)
 , "NO_PFL_USR        " POSITION(00015:00024) CHAR(010)
 )