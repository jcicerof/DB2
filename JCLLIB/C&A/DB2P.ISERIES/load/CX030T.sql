LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CX030T_MTV_DVG    "
 ( "CD_MTV_DVG        " POSITION(00007:00008) SMALLINT
 , "TX_MTV_DVG_PTG    " POSITION(00009:00053) CHAR(045)
 , "TX_MTV_DVG_SPH    " POSITION(00054:00098) CHAR(045)
 , "TX_MTV_DVG_IGL    " POSITION(00099:00143) CHAR(045)
 , "VL_MIN_UTL_MTV    " POSITION(00144:00152) DECIMAL
 , "VL_MAX_UTL_MTV    " POSITION(00153:00161) DECIMAL
 , "IN_MTV_UTL_RSTR   " POSITION(00162:00162) CHAR(001)
 )
