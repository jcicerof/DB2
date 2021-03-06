LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS023T_OCO_ETG_ART"
 ( "NI_GER_OCO        " POSITION(00007:00010) INTEGER
 , "CD_FL             " POSITION(00011:00013) DECIMAL
 , "CD_FOR            " POSITION(00015:00020) CHAR(006)
                          NULLIF(00014)=X'FF'
 , "DT_INC_OCO        " POSITION(00021:00030) DATE EXTERNAL
 , "HR_INC_OCO        " POSITION(00031:00038) TIME EXTERNAL
 , "CD_USR_INC_OCO    " POSITION(00039:00046) CHAR(008)
 , "DT_ULT_ATLZ_OCO   " POSITION(00048:00057) DATE EXTERNAL
                          NULLIF(00047)=X'FF'
 , "HR_ULT_ATLZ_OCO   " POSITION(00059:00066) TIME EXTERNAL
                          NULLIF(00058)=X'FF'
 , "CD_USR_ULT_ATLZ   " POSITION(00068:00075) CHAR(008)
                          NULLIF(00067)=X'FF'
 , "NO_ASD_CMU_OCO    " POSITION(00076:00105) CHAR(030)
 , "TX_DS_OCO         " POSITION(00106:00361) VARCHAR
 )
