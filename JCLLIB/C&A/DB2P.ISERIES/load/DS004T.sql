LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS004T_SIT_PED    "
 ( "CD_SIT_PED        " POSITION(00007:00008) SMALLINT
 , "NO_SIT_PED        " POSITION(00010:00026) VARCHAR
                          NULLIF(00009)=X'FF'
 )
