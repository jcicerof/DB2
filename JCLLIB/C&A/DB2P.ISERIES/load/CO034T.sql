LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO034T_TIP_ETQ    "
 ( "CD_TIP_ETQ        " POSITION(00007:00008) DECIMAL
 , "DS_TIP_ETQ        " POSITION(00009:00033) CHAR(025)
 )
