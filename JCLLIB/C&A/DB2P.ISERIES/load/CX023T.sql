LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CX023T_TIP_MOV    "
 ( "CD_TIP_MOV        " POSITION(00007:00008) DECIMAL
 , "DS_TIP_MOV        " POSITION(00009:00038) CHAR(030)
 , "CD_PGM_FMT_MOV    " POSITION(00040:00047) CHAR(008)
                          NULLIF(00039)=X'FF'
 )