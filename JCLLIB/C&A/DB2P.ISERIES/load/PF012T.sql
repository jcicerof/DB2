LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PF012T_RTY_UTI_CLS"
 ( "CD_FNE            " POSITION(00007:00008) DECIMAL
 , "CD_CLS            " POSITION(00009:00010) DECIMAL
 , "CD_CLS_COD        " POSITION(00011:00012) DECIMAL
 , "CD_MRC            " POSITION(00013:00014) DECIMAL
 , "CD_RTY            " POSITION(00015:00018) DECIMAL
 )
