LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG564T_PL_ASCC    "
 ( "NI_PL             " POSITION(00007:00011) DECIMAL
 , "NI_ASCC_PL        " POSITION(00012:00017) DECIMAL
 , "IN_EXG_DAD        " POSITION(00018:00018) CHAR(001)
 )
