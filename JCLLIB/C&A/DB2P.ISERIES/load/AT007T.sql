LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."AT007T_TIP_SIT_TRM"
 ( "CD_SIT_TRM        " POSITION(00007:00008) DECIMAL
 , "DS_SIT_TRM        " POSITION(00009:00028) CHAR(020)
 )
