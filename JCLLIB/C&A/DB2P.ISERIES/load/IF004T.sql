LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."IF004T_TIP_MOV_GRU"
 ( "CD_GRU_MOV        " POSITION(00007:00008) SMALLINT
 , "CD_TIP_MOV        " POSITION(00009:00010) SMALLINT
 )