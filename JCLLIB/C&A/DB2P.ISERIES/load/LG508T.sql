LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG508T_TIP_CBD_PED"
 ( "NI_PED            " POSITION(00007:00010) DECIMAL
 , "NU_REC_PED        " POSITION(00011:00012) DECIMAL
 , "CD_TIP_CBD        " POSITION(00013:00014) DECIMAL
 , "QT_CBD_REC        " POSITION(00015:00018) INTEGER
 , "IN_INSP_CBD       " POSITION(00019:00019) CHAR(001)
 , "IN_TIP_CBD_ENV    " POSITION(00020:00020) CHAR(001)
 , "IN_EXG_DAD        " POSITION(00021:00021) CHAR(001)
 )
