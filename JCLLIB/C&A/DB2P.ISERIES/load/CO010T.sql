LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO010T_DIV_COM    "
 ( "CD_DIV_COM        " POSITION(00007:00008) DECIMAL
 , "DS_DIV_COM        " POSITION(00009:00023) CHAR(015)
 , "CD_FNE            " POSITION(00024:00025) DECIMAL
 , "CD_DIV_SAP        " POSITION(00027:00028) SMALLINT
                          NULLIF(00026)=X'FF'
 )
