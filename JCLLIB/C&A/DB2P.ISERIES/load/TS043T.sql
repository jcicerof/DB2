LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS043T_ROTA       "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "CD_ROTA           " POSITION(00010:00011) SMALLINT
 , "NU_OCO_SEML_ROTA  " POSITION(00012:00013) SMALLINT
 , "DS_ROTA           " POSITION(00014:00028) CHAR(015)
 , "ST_CMPL_ROTA      " POSITION(00029:00029) CHAR(001)
 , "CD_TIP_VEIC       " POSITION(00030:00031) SMALLINT
 , "IN_ROTA_CNT_DIS   " POSITION(00032:00032) CHAR(001)
 , "IN_ROTA_CGM_RGI   " POSITION(00033:00033) CHAR(001)
 , "CD_RGI_TRNP       " POSITION(00035:00036) SMALLINT
                          NULLIF(00034)=X'FF'
 , "IN_EXG_DAD        " POSITION(00037:00037) CHAR(001)
 )
