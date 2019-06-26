LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS017T_TOL_REC    "
 ( "CD_DEPTO_COM      " POSITION(00007:00008) DECIMAL
 , "PC_TOL_QT         " POSITION(00010:00011) DECIMAL
                          NULLIF(00009)=X'FF'
 , "PC_TOL_PRC        " POSITION(00013:00014) DECIMAL
                          NULLIF(00012)=X'FF'
 , "QT_MIN_DIA_PRD    " POSITION(00016:00017) DECIMAL
                          NULLIF(00015)=X'FF'
 , "QT_PAR_FLX_FIN    " POSITION(00019:00020) SMALLINT
                          NULLIF(00018)=X'FF'
 )