LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."IF035T_GRT_ESTD   "
 ( "CD_DEPTO_COM      " POSITION(00007:00008) DECIMAL
 , "CD_DIV_COM        " POSITION(00009:00010) DECIMAL
 , "CD_FOR            " POSITION(00011:00016) CHAR(006)
 , "VL_CMS_SGR        " POSITION(00017:00020) DECIMAL
 , "PC_RPS            " POSITION(00021:00023) DECIMAL
 , "PC_CMS            " POSITION(00024:00026) DECIMAL
 , "QT_DIA_PRZ        " POSITION(00027:00030) INTEGER
 , "DI_INI_FCH        " POSITION(00032:00033) SMALLINT
                          NULLIF(00031)=X'FF'
 , "AL_IOF            " POSITION(00034:00036) DECIMAL
 )
