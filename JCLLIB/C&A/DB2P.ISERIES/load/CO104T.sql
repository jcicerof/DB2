LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO104T_SIT_TBT_FOR"
 ( "CD_SIT_TBT        " POSITION(00007:00008) SMALLINT
 , "SL_SIT_TBT        " POSITION(00009:00010) CHAR(002)
 , "TX_SIT_TBT        " POSITION(00011:00050) CHAR(040)
 )