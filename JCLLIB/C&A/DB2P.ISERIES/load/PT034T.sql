LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PT034T_TMA_COLECAO"
 ( "CD_TMA_CLC        " POSITION(00007:00009) DECIMAL
 , "DS_TMA_CLC        " POSITION(00010:00039) CHAR(030)
 , "CD_ESTA           " POSITION(00040:00041) DECIMAL
 )
