LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS018T_IDI        "
 ( "SR_IDI_PAG        " POSITION(00007:00108) VARCHAR
 , "CD_IDI_LNG        " POSITION(00109:00109) CHAR(001)
 , "NI_IDI            " POSITION(00110:00111) SMALLINT
 , "CD_IDI_TIP        " POSITION(00112:00112) CHAR(001)
 , "SR_IDI_TXT        " POSITION(00114:00215) VARCHAR
                          NULLIF(00113)=X'FF'
 )