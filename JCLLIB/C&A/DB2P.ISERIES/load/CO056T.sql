LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO056T_SDT_DPT    "
 ( "CD_DEPTO_COM      " POSITION(00007:00008) DECIMAL
 , "CD_SDT            " POSITION(00009:00010) SMALLINT
 )