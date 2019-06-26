LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG414T_PED_TIP_ESP"
 ( "CD_TIP_EXP_ESP    " POSITION(00007:00008) DECIMAL
 , "NI_PED            " POSITION(00009:00012) DECIMAL
 , "NU_OCO_PED        " POSITION(00013:00014) DECIMAL
 , "DT_SOL_EXP_ESP    " POSITION(00015:00024) DATE EXTERNAL
 , "DT_LIM_RCHT       " POSITION(00026:00035) DATE EXTERNAL
                          NULLIF(00025)=X'FF'
 , "DT_CANC           " POSITION(00037:00046) DATE EXTERNAL
                          NULLIF(00036)=X'FF'
 , "CD_FL             " POSITION(00047:00049) DECIMAL
 , "CD_USR            " POSITION(00050:00057) CHAR(008)
 , "CD_ORI_DOA        " POSITION(00059:00060) DECIMAL
                          NULLIF(00058)=X'FF'
 , "CD_MTV_BNF        " POSITION(00062:00063) DECIMAL
                          NULLIF(00061)=X'FF'
 , "CD_GRU_DEF        " POSITION(00065:00066) DECIMAL
                          NULLIF(00064)=X'FF'
 , "CD_TIP_DEF        " POSITION(00068:00069) DECIMAL
                          NULLIF(00067)=X'FF'
 , "CD_MTV_EXP_CAN    " POSITION(00071:00072) DECIMAL
                          NULLIF(00070)=X'FF'
 , "DS_OBS_EXP_ESP    " POSITION(00074:00575) VARCHAR
                          NULLIF(00073)=X'FF'
 , "DS_MTV_CANC_CPL   " POSITION(00577:00830) CHAR(254)
                          NULLIF(00576)=X'FF'
 , "ST_ENV_WEB        " POSITION(00831:00831) CHAR(001)
 , "NU_REC_PED        " POSITION(00833:00834) DECIMAL
                          NULLIF(00832)=X'FF'
 , "NU_SEQ_DOC_FIS    " POSITION(00836:00840) DECIMAL
                          NULLIF(00835)=X'FF'
 , "IN_EXP_ESP_TOT_PED" POSITION(00841:00841) CHAR(001)
 , "IN_RENT_DVL       " POSITION(00842:00842) CHAR(001)
 , "DT_PCST_VEN_ETQ   " POSITION(00844:00853) DATE EXTERNAL
                          NULLIF(00843)=X'FF'
 , "IN_EXP_ESP_GRD_BOA" POSITION(00854:00854) CHAR(001)
 , "NI_PL             " POSITION(00856:00860) DECIMAL
                          NULLIF(00855)=X'FF'
 , "PRC_VEN_CD        " POSITION(00862:00869) DECIMAL
                          NULLIF(00861)=X'FF'
 , "IN_EXG_DAD        " POSITION(00870:00870) CHAR(001)
 )
