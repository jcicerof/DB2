LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA086T_SEM_PAIS_BS"
 ( "CD_FNE            " POSITION(00007:00008) DECIMAL
 , "CD_PAIS           " POSITION(00009:00010) CHAR(002)
 , "NU_SEM_CTR        " POSITION(00012:00013) SMALLINT
                          NULLIF(00011)=X'FF'
 )