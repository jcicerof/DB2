LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG553T_MTA_PRDT   "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "CD_PCS            " POSITION(00010:00011) DECIMAL
 , "CD_ATV            " POSITION(00012:00013) DECIMAL
 , "CD_MDLD_ACDM_REC  " POSITION(00014:00014) CHAR(001)
 , "CD_MDLD_ACDM_DIS  " POSITION(00015:00015) CHAR(001)
 , "DT_INI_VLDD_MTA   " POSITION(00016:00025) DATE EXTERNAL
 , "DT_FIM_VLDD_MTA   " POSITION(00027:00036) DATE EXTERNAL
                          NULLIF(00026)=X'FF'
 , "QT_PRZ_PMN_PED    " POSITION(00038:00043) DECIMAL
                          NULLIF(00037)=X'FF'
 , "DT_ATLZ_MTA_PRDT  " POSITION(00045:00054) DATE EXTERNAL
                          NULLIF(00044)=X'FF'
 , "CD_USR            " POSITION(00056:00063) CHAR(008)
                          NULLIF(00055)=X'FF'
 )
