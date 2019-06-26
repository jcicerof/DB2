LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."IF026T_MAP_EVN_OTR"
 ( "CD_EMP            " POSITION(00007:00008) SMALLINT
 , "CD_MOD_SIS_IF     " POSITION(00009:00010) CHAR(002)
 , "CD_GRU_MOV        " POSITION(00011:00012) SMALLINT
 , "CD_TIP_MOV        " POSITION(00013:00014) SMALLINT
 , "CD_EVN_CTB        " POSITION(00016:00020) CHAR(005)
                          NULLIF(00015)=X'FF'
 , "CD_OPR_VEN_SAP    " POSITION(00022:00031) CHAR(010)
                          NULLIF(00021)=X'FF'
 , "NO_MAP_EVN_OTR    " POSITION(00033:00082) CHAR(050)
                          NULLIF(00032)=X'FF'
 , "CD_MOV_CONC_FIN   " POSITION(00084:00085) SMALLINT
                          NULLIF(00083)=X'FF'
 )