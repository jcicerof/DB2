LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."OL008T_CBD_PED    "
 ( "NI_PED            " POSITION(00007:00010) DECIMAL
 , "CD_TIP_CBD        " POSITION(00011:00012) DECIMAL
 , "IN_ENV_CBD_OPD_LGS" POSITION(00013:00013) CHAR(001)
 )