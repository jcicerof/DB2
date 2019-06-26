LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CX012T_LIBR_MOV   "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "DT_MOV            " POSITION(00010:00019) DATE EXTERNAL
 , "CD_FMA_PAG        " POSITION(00020:00021) DECIMAL
 , "VL_LIBR_MOV       " POSITION(00022:00029) DECIMAL
 , "PC_LIBR_FMA_PAG   " POSITION(00031:00033) DECIMAL
                          NULLIF(00030)=X'FF'
 , "DS_MTV_LIBR       " POSITION(00035:00084) CHAR(050)
                          NULLIF(00034)=X'FF'
 , "CD_USR            " POSITION(00086:00093) CHAR(008)
                          NULLIF(00085)=X'FF'
 , "DT_MAN_VLR        " POSITION(00095:00104) DATE EXTERNAL
                          NULLIF(00094)=X'FF'
 , "HR_MAN_VLR        " POSITION(00106:00113) TIME EXTERNAL
                          NULLIF(00105)=X'FF'
 , "IN_VLR_CTBLZ_SAP  " POSITION(00115:00115) CHAR(001)
                          NULLIF(00114)=X'FF'
 , "DT_CTBLZ          " POSITION(00117:00126) DATE EXTERNAL
                          NULLIF(00116)=X'FF'
 )
