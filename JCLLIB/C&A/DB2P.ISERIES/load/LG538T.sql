LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG538T_ENV_PED_ALO"
 ( "NI_OCO            " POSITION(00007:00010) INTEGER
 , "CD_MOV            " POSITION(00011:00011) DECIMAL
 , "CD_OCO            " POSITION(00012:00013) DECIMAL
 , "NU_PED            " POSITION(00014:00017) DECIMAL
 , "CD_RGI_PRC        " POSITION(00019:00021) DECIMAL
                          NULLIF(00018)=X'FF'
 , "TS_OCO_ENV        " POSITION(00022:00047) TIMESTAMP EXTERNAL
 , "ST_ALO            " POSITION(00048:00048) CHAR(001)
 , "DT_PGM            " POSITION(00050:00059) DATE EXTERNAL
                          NULLIF(00049)=X'FF'
 , "DT_REC_PED        " POSITION(00061:00070) DATE EXTERNAL
                          NULLIF(00060)=X'FF'
 , "DT_DVL            " POSITION(00072:00081) DATE EXTERNAL
                          NULLIF(00071)=X'FF'
 , "DT_RTD_ETQ_CNT    " POSITION(00083:00092) DATE EXTERNAL
                          NULLIF(00082)=X'FF'
 , "CD_PAIS_DEST      " POSITION(00094:00095) CHAR(002)
                          NULLIF(00093)=X'FF'
 , "NI_MDL            " POSITION(00097:00100) DECIMAL
                          NULLIF(00096)=X'FF'
 , "CD_SIT_PED        " POSITION(00102:00103) DECIMAL
                          NULLIF(00101)=X'FF'
 , "CD_PAIS_PED       " POSITION(00105:00106) CHAR(002)
                          NULLIF(00104)=X'FF'
 , "TP_GRD_ENTR       " POSITION(00108:00109) DECIMAL
                          NULLIF(00107)=X'FF'
 , "CD_FNE_PED        " POSITION(00111:00112) DECIMAL
                          NULLIF(00110)=X'FF'
 , "CD_FL_ETG         " POSITION(00114:00116) DECIMAL
                          NULLIF(00113)=X'FF'
 , "NU_SEQ_RTD        " POSITION(00117:00118) SMALLINT
 , "CD_SIT_ALCC       " POSITION(00119:00120) SMALLINT
 )
