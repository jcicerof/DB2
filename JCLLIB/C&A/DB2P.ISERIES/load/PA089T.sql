LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA089T_GRA_BS_CLS "
 ( "CD_FNE            " POSITION(00007:00008) DECIMAL
 , "CD_PAIS           " POSITION(00009:00010) CHAR(002)
 , "CD_CLS            " POSITION(00011:00012) DECIMAL
 , "NU_GRA_BS         " POSITION(00013:00014) SMALLINT
 , "PC_SPR_GIRO_PLNJ  " POSITION(00016:00018) DECIMAL
                          NULLIF(00015)=X'FF'
 )
