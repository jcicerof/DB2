LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO050T_CLS_COD_CAT"
 ( "CD_CAT_PRD_ANL    " POSITION(00007:00008) SMALLINT
 , "CD_FNE            " POSITION(00009:00010) DECIMAL
 , "CD_CLS            " POSITION(00011:00012) DECIMAL
 , "CD_CLS_COD        " POSITION(00013:00014) DECIMAL
 )