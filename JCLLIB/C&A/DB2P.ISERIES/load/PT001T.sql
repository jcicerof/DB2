LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PT001T_MODELO     "
 ( "NI_MDL            " POSITION(00007:00010) DECIMAL
 , "CD_SIT_MDL        " POSITION(00011:00012) DECIMAL
 , "ST_LOJ_NET        " POSITION(00013:00013) CHAR(001)
 , "ST_DCT_ASO        " POSITION(00014:00014) CHAR(001)
 , "TP_ETI_PRC_VEN    " POSITION(00015:00016) DECIMAL
 , "CD_MRC            " POSITION(00017:00018) DECIMAL
 , "NO_DOC_MDD_PDR    " POSITION(00019:00033) CHAR(015)
 , "DS_DTZ_MSG_ETI    " POSITION(00034:00113) CHAR(080)
 , "DS_MDL_PRG        " POSITION(00114:00213) CHAR(100)
 , "DS_MDL_SPH        " POSITION(00214:00313) CHAR(100)
 , "DS_MDL_IGL        " POSITION(00314:00413) CHAR(100)
 , "QT_ETI_MDL        " POSITION(00414:00414) DECIMAL
 , "CD_FNE            " POSITION(00415:00416) DECIMAL
 , "CD_CLS            " POSITION(00417:00418) DECIMAL
 , "CD_CLS_COD        " POSITION(00419:00420) DECIMAL
 , "CD_TIP_ETI_VEN    " POSITION(00421:00422) DECIMAL
 , "CD_RTY            " POSITION(00423:00425) DECIMAL
 , "CD_FML_PRD        " POSITION(00426:00428) DECIMAL
 , "ST_PRD_BASE       " POSITION(00429:00429) CHAR(001)
 , "QT_CM_ALTU_PCA    " POSITION(00431:00435) DECIMAL
                          NULLIF(00430)=X'FF'
 , "QT_CM_LGR_PCA     " POSITION(00437:00441) DECIMAL
                          NULLIF(00436)=X'FF'
 , "QT_CM_PRFDD_PCA   " POSITION(00443:00447) DECIMAL
                          NULLIF(00442)=X'FF'
 , "QT_CM3_CUB_PCA    " POSITION(00449:00456) DECIMAL
                          NULLIF(00448)=X'FF'
 , "QT_GR_PESO_PCA    " POSITION(00458:00462) DECIMAL
                          NULLIF(00457)=X'FF'
 , "CD_REF_BSC        " POSITION(00463:00463) CHAR(001)
 , "SR_OBS_MDL        " POSITION(00465:00721) VARCHAR
                          NULLIF(00464)=X'FF'
 , "NU_SEQ_ECC_DS_FIS " POSITION(00723:00724) SMALLINT
                          NULLIF(00722)=X'FF'
 , "CD_TIP_DMB_MDL    " POSITION(00725:00725) CHAR(001)
 , "IN_REM_MDL        " POSITION(00726:00726) CHAR(001)
 , "CD_CLS_COD_MST    " POSITION(00728:00729) DECIMAL
                          NULLIF(00727)=X'FF'
 , "NU_GRA_BS         " POSITION(00731:00732) SMALLINT
                          NULLIF(00730)=X'FF'
 , "NU_ANO_BS         " POSITION(00734:00736) DECIMAL
                          NULLIF(00733)=X'FF'
 , "NU_SEM_BS         " POSITION(00738:00739) DECIMAL
                          NULLIF(00737)=X'FF'
 , "NU_ANO_SM         " POSITION(00741:00743) DECIMAL
                          NULLIF(00740)=X'FF'
 , "NU_SEM_SM         " POSITION(00745:00746) DECIMAL
                          NULLIF(00744)=X'FF'
 , "PC_SPR_GIRO_PLNJ  " POSITION(00748:00750) DECIMAL
                          NULLIF(00747)=X'FF'
 , "IN_UTL_MDL        " POSITION(00751:00751) CHAR(001)
 )