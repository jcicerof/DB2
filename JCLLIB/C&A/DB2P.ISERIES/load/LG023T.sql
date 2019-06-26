LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG023T_AGD_ENTR   "
 ( "CD_FOR            " POSITION(00007:00012) CHAR(006)
 , "DT_AGD_ENTR       " POSITION(00013:00022) DATE EXTERNAL
 , "NU_AGD_ENTR       " POSITION(00023:00024) DECIMAL
 , "NI_PED            " POSITION(00025:00028) DECIMAL
 , "HR_INI_AGD_ENTR   " POSITION(00029:00036) TIME EXTERNAL
 , "HR_FIM_AGD_ENTR   " POSITION(00037:00044) TIME EXTERNAL
 , "CD_SEN_AGD_ENTR   " POSITION(00045:00054) CHAR(010)
 , "ST_CANC_AGD_ENTR  " POSITION(00055:00055) CHAR(001)
 , "CD_USR_PGM        " POSITION(00056:00063) CHAR(008)
 , "CD_FL             " POSITION(00065:00067) DECIMAL
                          NULLIF(00064)=X'FF'
 , "DT_ATD_REC        " POSITION(00069:00078) DATE EXTERNAL
                          NULLIF(00068)=X'FF'
 , "NU_ATD_REC        " POSITION(00080:00082) DECIMAL
                          NULLIF(00079)=X'FF'
 , "HR_ATD_REC        " POSITION(00084:00091) TIME EXTERNAL
                          NULLIF(00083)=X'FF'
 , "CD_MTV_CANC_AGD   " POSITION(00093:00094) SMALLINT
                          NULLIF(00092)=X'FF'
 , "IN_EXG_DAD        " POSITION(00095:00095) CHAR(001)
 )