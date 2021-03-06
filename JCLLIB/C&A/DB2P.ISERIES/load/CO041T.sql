LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO041T_ASD        "
 ( "CD_EMP            " POSITION(00007:00008) SMALLINT
 , "CD_REG_ASD        " POSITION(00009:00012) INTEGER
 , "NO_ASD            " POSITION(00013:00072) CHAR(060)
 , "DT_NSC_ASD        " POSITION(00073:00082) DATE EXTERNAL
 , "NU_CPF_ASD        " POSITION(00083:00088) DECIMAL
 , "DT_ADS_ASD        " POSITION(00089:00098) DATE EXTERNAL
 , "CD_CNT_RSU_CTB    " POSITION(00099:00108) CHAR(010)
 , "CD_FL_ALCC_ASD    " POSITION(00110:00112) DECIMAL
                          NULLIF(00109)=X'FF'
 , "DT_DSS_ASD        " POSITION(00114:00123) DATE EXTERNAL
                          NULLIF(00113)=X'FF'
 )
