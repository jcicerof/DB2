LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG021T_SIT_BUREAU "
 ( "NI_BUR            " POSITION(00007:00008) SMALLINT
 , "DT_SIT_BUR        " POSITION(00009:00018) DATE EXTERNAL
 , "CD_USR            " POSITION(00019:00026) CHAR(008)
 , "CD_TIP_SIT_BUR    " POSITION(00027:00027) DECIMAL
 )
