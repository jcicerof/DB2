LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."IF018T_FMA_PAG_VEN"
 ( "CD_FMA_PAG_VEN    " POSITION(00007:00014) CHAR(008)
 , "NO_FMA_PAG_VEN    " POSITION(00016:00035) CHAR(020)
                          NULLIF(00015)=X'FF'
 , "NO_FMA_PAG_VEN_SPH" POSITION(00037:00056) CHAR(020)
                          NULLIF(00036)=X'FF'
 )
