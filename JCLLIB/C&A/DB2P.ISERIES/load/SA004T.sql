LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."SA004T_OBS_FRM_AVL"
 ( "NI_TIP_FRM_AVL    " POSITION(00007:00008) SMALLINT
 , "NU_SEQ_CAB_OBS    " POSITION(00009:00010) SMALLINT
 , "NO_CAB_OBS_PTG    " POSITION(00011:00110) CHAR(100)
 , "NO_CAB_OBS_SPH    " POSITION(00111:00210) CHAR(100)
 , "NO_CAB_OBS_IGL    " POSITION(00211:00310) CHAR(100)
 )
