LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS013T_DVL_NF     "
 ( "NI_DVL            " POSITION(00007:00010) INTEGER
 , "NI_NF             " POSITION(00011:00016) DECIMAL
 )