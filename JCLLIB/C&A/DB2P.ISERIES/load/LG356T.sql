LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG356T_TIP_ALR_LGS"
 ( "CD_TIP_ALR_LGS    " POSITION(00007:00008) SMALLINT
 , "TX_DS_TIP_ALR_LGS " POSITION(00009:00088) CHAR(080)
 )
