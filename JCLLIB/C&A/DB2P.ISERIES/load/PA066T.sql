LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA066T_ECC_CLS_CSS"
 ( "CD_CLS            " POSITION(00007:00008) DECIMAL
 , "CD_FNE_CLS        " POSITION(00009:00010) DECIMAL
 , "CD_CSS_PRC_REM    " POSITION(00011:00012) SMALLINT
 , "CD_FNE            " POSITION(00013:00014) DECIMAL
 , "CD_PAIS           " POSITION(00015:00016) CHAR(002)
 , "CD_REF            " POSITION(00017:00019) DECIMAL
 , "CD_USR_ULT_ATLZ   " POSITION(00020:00027) CHAR(008)
 , "DT_ULT_ATLZ       " POSITION(00028:00037) DATE EXTERNAL
 , "HR_ULT_ATLZ       " POSITION(00038:00045) TIME EXTERNAL
 )