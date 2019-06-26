LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."OL013T_PCS_OPD_LGS"
 ( "CD_PCS_IMPT       " POSITION(00007:00026) CHAR(020)
 , "CD_OPD_LGS        " POSITION(00027:00029) DECIMAL
 , "DT_REC_CGM_CNT_DIS" POSITION(00031:00040) DATE EXTERNAL
                          NULLIF(00030)=X'FF'
 , "DT_FIM_PCST_CGM   " POSITION(00042:00051) DATE EXTERNAL
                          NULLIF(00041)=X'FF'
 , "CD_SIT_PCS_IMPT   " POSITION(00052:00053) SMALLINT
 , "CD_USR            " POSITION(00054:00061) CHAR(008)
 , "DT_ULT_ATLZ       " POSITION(00062:00071) DATE EXTERNAL
 , "HR_ULT_ATLZ       " POSITION(00072:00079) TIME EXTERNAL
 )