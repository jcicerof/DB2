LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PF001T_TIP_PAG    "
 ( "CD_TIP_PAG        " POSITION(00007:00008) DECIMAL
 , "DS_TIP_PAG        " POSITION(00009:00068) CHAR(060)
 )