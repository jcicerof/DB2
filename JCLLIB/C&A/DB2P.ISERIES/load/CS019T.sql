LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CS019T_CUS_FRT    "
 ( "CD_RGI_TRNP       " POSITION(00007:00008) SMALLINT
 , "CD_FL             " POSITION(00009:00011) DECIMAL
 , "CD_GRU_PRD        " POSITION(00012:00014) CHAR(003)
 , "DT_VIG_INI        " POSITION(00015:00024) DATE EXTERNAL
 , "VL_UNI_FRT        " POSITION(00025:00032) DECIMAL
 )