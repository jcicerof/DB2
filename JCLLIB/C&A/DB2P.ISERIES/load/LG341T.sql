LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG341T_TIP_RPCS   "
 ( "CD_TIP_RPCS       " POSITION(00007:00008) SMALLINT
 , "NO_TIP_RPCS_PTG   " POSITION(00009:00028) CHAR(020)
 , "NO_TIP_RPCS_ESP   " POSITION(00029:00048) CHAR(020)
 , "NO_TIP_RPCS_ING   " POSITION(00049:00068) CHAR(020)
 )
