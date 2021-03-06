LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TT011T_SAQ_CTA    "
 ( "DT_SAQ_CTA        " POSITION(00007:00016) DATE EXTERNAL
 , "CD_FL             " POSITION(00017:00019) DECIMAL
 , "NU_PDV_FL         " POSITION(00020:00021) SMALLINT
 , "NU_SAQ_PDV_FL     " POSITION(00022:00025) INTEGER
 , "DT_CG_MOV_STT     " POSITION(00026:00035) DATE EXTERNAL
 , "CD_ADMR_CRE       " POSITION(00036:00037) SMALLINT
 , "NU_AG_CTA_SAQ     " POSITION(00038:00039) SMALLINT
 , "NU_CTA_SAQ        " POSITION(00040:00045) DECIMAL
 , "VL_SAQ_CTA        " POSITION(00046:00054) DECIMAL
 , "NU_PAR_FNC        " POSITION(00055:00056) SMALLINT
 , "DT_CTBLZ_SAQ      " POSITION(00057:00066) DATE EXTERNAL
 , "CD_TIP_SAQ        " POSITION(00067:00068) SMALLINT
 , "NU_SAQ_ADMR_CRE   " POSITION(00069:00072) INTEGER
 )
