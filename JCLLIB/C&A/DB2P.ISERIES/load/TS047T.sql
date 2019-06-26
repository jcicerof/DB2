LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS047T_SNT        "
 ( "DT_VGM            " POSITION(00007:00016) DATE EXTERNAL
 , "NU_VGM            " POSITION(00017:00020) INTEGER
 , "DT_SNT            " POSITION(00021:00030) DATE EXTERNAL
 , "HR_SNT            " POSITION(00031:00038) TIME EXTERNAL
 , "DT_IDTF_SEGR      " POSITION(00039:00048) DATE EXTERNAL
 , "HR_IDTF_SEGR      " POSITION(00049:00056) TIME EXTERNAL
 , "DT_LIBR_SEGR      " POSITION(00057:00066) DATE EXTERNAL
 , "HR_LIBR_SEGR      " POSITION(00067:00074) TIME EXTERNAL
 , "CD_TIP_SNT        " POSITION(00075:00076) SMALLINT
 , "CD_SIT_SNT        " POSITION(00077:00078) SMALLINT
 , "CD_USR_LIBR       " POSITION(00079:00086) CHAR(008)
 , "CD_USR_ID         " POSITION(00087:00094) CHAR(008)
 , "DS_OBS_SNT        " POSITION(00095:00144) CHAR(050)
 , "IN_EXG_DAD        " POSITION(00145:00145) CHAR(001)
 )
