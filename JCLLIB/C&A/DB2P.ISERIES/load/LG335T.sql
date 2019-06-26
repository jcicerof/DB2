LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG335T_CTR_DSC    "
 ( "NI_DOC_FIS        " POSITION(00007:00011) DECIMAL
 , "DT_VGM            " POSITION(00012:00021) DATE EXTERNAL
 , "NU_VGM            " POSITION(00022:00025) INTEGER
 , "CD_FL_DSC         " POSITION(00026:00028) DECIMAL
 , "TS_INI_DSC        " POSITION(00030:00055) TIMESTAMP EXTERNAL
                          NULLIF(00029)=X'FF'
 , "TS_FIM_DSC        " POSITION(00057:00082) TIMESTAMP EXTERNAL
                          NULLIF(00056)=X'FF'
 , "CD_USR            " POSITION(00084:00091) CHAR(008)
                          NULLIF(00083)=X'FF'
 , "IN_EXG_DAD        " POSITION(00092:00092) CHAR(001)
 )