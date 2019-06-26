LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG516T_ACT_ITEM   "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "DT_ATD_REC        " POSITION(00010:00019) DATE EXTERNAL
 , "NU_ATD_REC        " POSITION(00020:00022) DECIMAL
 , "NU_ITEM_ATD_REC   " POSITION(00023:00024) DECIMAL
 , "HR_ATD_REC        " POSITION(00025:00032) TIME EXTERNAL
 , "TS_ANC_ATD        " POSITION(00034:00059) TIMESTAMP EXTERNAL
                          NULLIF(00033)=X'FF'
 , "DT_ENT_ITEM_ATD   " POSITION(00061:00070) DATE EXTERNAL
                          NULLIF(00060)=X'FF'
 , "HR_ENT_ITEM_ATD   " POSITION(00072:00079) TIME EXTERNAL
                          NULLIF(00071)=X'FF'
 , "DT_SAI_ITEM_ATD   " POSITION(00081:00090) DATE EXTERNAL
                          NULLIF(00080)=X'FF'
 , "HR_SAI_ITEM_ATD   " POSITION(00092:00099) TIME EXTERNAL
                          NULLIF(00091)=X'FF'
 , "NU_DOCA           " POSITION(00101:00102) DECIMAL
                          NULLIF(00100)=X'FF'
 , "IN_EXG_DAD        " POSITION(00103:00103) CHAR(001)
 )
