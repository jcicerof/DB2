LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG532T_PL         "
 ( "NI_PL             " POSITION(00007:00011) DECIMAL
 , "TS_GER_PL         " POSITION(00012:00037) TIMESTAMP EXTERNAL
 , "TS_FIM_DIS_PL     " POSITION(00039:00064) TIMESTAMP EXTERNAL
                          NULLIF(00038)=X'FF'
 , "QT_VOL            " POSITION(00065:00070) DECIMAL
 , "NI_ASCC_PL        " POSITION(00072:00077) DECIMAL
                          NULLIF(00071)=X'FF'
 , "CD_FL_ORI         " POSITION(00078:00080) DECIMAL
 , "CD_TIP_ETQ_ORI    " POSITION(00081:00082) DECIMAL
 , "CD_FL_ARM_ORI     " POSITION(00083:00085) DECIMAL
 , "CD_FL_DEST        " POSITION(00086:00088) DECIMAL
 , "CD_TIP_ETQ_DEST   " POSITION(00089:00090) DECIMAL
 , "CD_FL_ARM_DEST    " POSITION(00091:00093) DECIMAL
 , "NI_PED            " POSITION(00094:00097) DECIMAL
 , "NU_REC_PED        " POSITION(00098:00099) DECIMAL
 , "NI_PRIO_PROCE_PED " POSITION(00100:00101) DECIMAL
 , "CD_USR_CGM_PL     " POSITION(00103:00110) CHAR(008)
                          NULLIF(00102)=X'FF'
 , "NU_ORD_APR_FL     " POSITION(00111:00112) SMALLINT
 , "IN_EXG_DAD        " POSITION(00113:00113) CHAR(001)
 , "NU_VGM_SNT        " POSITION(00115:00118) INTEGER
                          NULLIF(00114)=X'FF'
 )