LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO012T_CLS        "
 ( "CD_FNE            " POSITION(00007:00008) DECIMAL
 , "CD_CLS            " POSITION(00009:00010) DECIMAL
 , "DS_CLS_PRG        " POSITION(00011:00035) CHAR(025)
 , "DS_CLS_SPH        " POSITION(00037:00061) CHAR(025)
                          NULLIF(00036)=X'FF'
 , "DS_CLS_IGL        " POSITION(00063:00087) CHAR(025)
                          NULLIF(00062)=X'FF'
 , "CD_DEPTO_COM      " POSITION(00088:00089) DECIMAL
 , "CD_GRU_PRD        " POSITION(00091:00093) CHAR(003)
                          NULLIF(00090)=X'FF'
 , "DS_UND_CLS_PRG    " POSITION(00095:00098) CHAR(004)
                          NULLIF(00094)=X'FF'
 , "DS_UND_CLS_SPH    " POSITION(00100:00103) CHAR(004)
                          NULLIF(00099)=X'FF'
 , "DS_UND_CLS_IGL    " POSITION(00105:00108) CHAR(004)
                          NULLIF(00104)=X'FF'
 , "CD_ECC_DS_FIS     " POSITION(00109:00109) CHAR(001)
 , "IN_ATZ_VEN_MDL    " POSITION(00110:00110) CHAR(001)
 , "IN_IMP_EAN_PDV    " POSITION(00111:00111) CHAR(001)
 , "IN_IMP_NUM_SER_PDV" POSITION(00112:00112) CHAR(001)
 , "NI_FRM_MDD        " POSITION(00114:00117) INTEGER
                          NULLIF(00113)=X'FF'
 , "IN_CLS_REM_BX_GIRO" POSITION(00118:00118) CHAR(001)
 , "IN_PTC_REM_PTA_ETQ" POSITION(00119:00119) CHAR(001)
 , "CD_SDT            " POSITION(00121:00122) SMALLINT
                          NULLIF(00120)=X'FF'
 , "IN_GRT_ESTD       " POSITION(00123:00123) CHAR(001)
 , "IN_PTC_REM_IDD    " POSITION(00124:00124) CHAR(001)
 , "IN_PTC_REM_ALN    " POSITION(00125:00125) CHAR(001)
 , "IN_PTC_REM_SCOR   " POSITION(00126:00126) CHAR(001)
 )
