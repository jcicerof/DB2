LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS001T_FOR_LOJ    "
 ( "CD_DEPTO_COM      " POSITION(00007:00008) DECIMAL
 , "CD_LOJ            " POSITION(00009:00011) DECIMAL
 , "CD_FOR            " POSITION(00012:00017) CHAR(006)
 , "NU_DIA_ETG_FOR    " POSITION(00019:00020) SMALLINT
                          NULLIF(00018)=X'FF'
 )