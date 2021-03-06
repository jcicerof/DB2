LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."SM001T_VRS_FRM_MDD"
 ( "NI_FRM_MDD        " POSITION(00007:00010) INTEGER
 , "NU_VRS_FRM_MDD    " POSITION(00011:00012) SMALLINT
 , "NI_NRM_ISO        " POSITION(00014:00015) SMALLINT
                          NULLIF(00013)=X'FF'
 , "TX_OBS_FRM_MDD    " POSITION(00017:00116) CHAR(100)
                          NULLIF(00016)=X'FF'
 , "TX_CMH_IMG_FRM_MDD" POSITION(00118:00217) CHAR(100)
                          NULLIF(00117)=X'FF'
 , "NO_APD_CQ         " POSITION(00219:00268) CHAR(050)
                          NULLIF(00218)=X'FF'
 , "NO_APD_COM        " POSITION(00270:00319) CHAR(050)
                          NULLIF(00269)=X'FF'
 , "DT_APV_CQ         " POSITION(00321:00330) DATE EXTERNAL
                          NULLIF(00320)=X'FF'
 , "DT_APV_COM        " POSITION(00332:00341) DATE EXTERNAL
                          NULLIF(00331)=X'FF'
 , "TX_OBS_CPL_FRM    " POSITION(00343:00644) VARCHAR
                          NULLIF(00342)=X'FF'
 , "NI_FRM_BASE       " POSITION(00646:00649) INTEGER
                          NULLIF(00645)=X'FF'
 , "NU_VRS_FRM_BASE   " POSITION(00651:00652) SMALLINT
                          NULLIF(00650)=X'FF'
 )
