LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS044T_SEGR_FRT   "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "CD_RGI_TRNP       " POSITION(00010:00011) SMALLINT
 , "CD_TIP_SEGR       " POSITION(00012:00013) SMALLINT
 , "DT_INI_SEGR_FRT   " POSITION(00014:00023) DATE EXTERNAL
 , "DT_FIM_SEGR_FRT   " POSITION(00025:00034) DATE EXTERNAL
                          NULLIF(00024)=X'FF'
 , "VL_SEGR_FRT_IDA   " POSITION(00035:00042) DECIMAL
 , "VL_SEGR_FRT_RET   " POSITION(00043:00050) DECIMAL
 , "VL_SEGR_FRT_TRF   " POSITION(00051:00058) DECIMAL
 , "CD_USR            " POSITION(00060:00067) CHAR(008)
                          NULLIF(00059)=X'FF'
 )
