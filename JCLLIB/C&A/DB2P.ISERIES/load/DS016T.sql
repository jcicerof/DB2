LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS016T_ALERTA     "
 ( "NI_ALERTA         " POSITION(00007:00010) INTEGER
 , "CD_DEPTO_COM      " POSITION(00012:00013) DECIMAL
                          NULLIF(00011)=X'FF'
 , "DT_ALERTA         " POSITION(00015:00024) DATE EXTERNAL
                          NULLIF(00014)=X'FF'
 , "HR_ALERTA         " POSITION(00026:00033) TIME EXTERNAL
                          NULLIF(00025)=X'FF'
 , "TP_ALERTA         " POSITION(00035:00036) SMALLINT
                          NULLIF(00034)=X'FF'
 , "NO_ALERTA         " POSITION(00038:00239) VARCHAR
                          NULLIF(00037)=X'FF'
 , "CD_USR_LTR_ALR    " POSITION(00241:00248) CHAR(008)
                          NULLIF(00240)=X'FF'
 , "DT_LTR_ALR        " POSITION(00250:00259) DATE EXTERNAL
                          NULLIF(00249)=X'FF'
 , "HR_LTR_ALR        " POSITION(00261:00268) TIME EXTERNAL
                          NULLIF(00260)=X'FF'
 )