LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS040T_RGI_FL     "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "CD_RGI_TRNP       " POSITION(00010:00011) SMALLINT
 , "CD_FL_RGI_TRNP    " POSITION(00012:00014) DECIMAL
 , "DT_INI_VIG        " POSITION(00015:00024) DATE EXTERNAL
 , "DT_FIM_VIG        " POSITION(00026:00035) DATE EXTERNAL
                          NULLIF(00025)=X'FF'
 )
