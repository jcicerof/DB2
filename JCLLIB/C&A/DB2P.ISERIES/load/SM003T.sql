LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."SM003T_GRD_CAB_FRM"
 ( "NI_FRM_MDD        " POSITION(00007:00010) INTEGER
 , "NU_VRS_FRM_MDD    " POSITION(00011:00012) SMALLINT
 , "NU_LIN_CAB_FRM_MDD" POSITION(00013:00014) SMALLINT
 , "NU_COL_GRD_CAB_FRM" POSITION(00015:00016) SMALLINT
 , "NI_TAM_CRP        " POSITION(00017:00018) SMALLINT
 )