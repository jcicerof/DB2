LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG550T_APV_RENT   "
 ( "NI_PED            " POSITION(00007:00010) DECIMAL
 , "DT_APV_PED_RENT   " POSITION(00012:00021) DATE EXTERNAL
                          NULLIF(00011)=X'FF'
 , "HR_APV_PED_RENT   " POSITION(00023:00030) TIME EXTERNAL
                          NULLIF(00022)=X'FF'
 , "TX_DS_CPL_RENT    " POSITION(00032:00081) CHAR(050)
                          NULLIF(00031)=X'FF'
 , "TX_DS_INSP_RENT   " POSITION(00083:00132) CHAR(050)
                          NULLIF(00082)=X'FF'
 , "CD_USR            " POSITION(00134:00141) CHAR(008)
                          NULLIF(00133)=X'FF'
 , "CD_MTV_RENT       " POSITION(00143:00144) SMALLINT
                          NULLIF(00142)=X'FF'
 , "IN_EXG_DAD        " POSITION(00145:00145) CHAR(001)
 )