LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA065T_REF_PRC_CSS"
 ( "CD_FNE            " POSITION(00007:00008) DECIMAL
 , "CD_PAIS           " POSITION(00009:00010) CHAR(002)
 , "CD_CSS_PRC_REM    " POSITION(00011:00012) SMALLINT
 , "CD_REF            " POSITION(00013:00015) DECIMAL
 , "CD_USR_ULT_ATLZ   " POSITION(00016:00023) CHAR(008)
 , "DT_ULT_ATLZ       " POSITION(00024:00033) DATE EXTERNAL
 , "HR_ULT_ATLZ       " POSITION(00034:00041) TIME EXTERNAL
 )