LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG103T_IRR_AMST   "
 ( "NU_IRR_AMST       " POSITION(00007:00008) DECIMAL
 , "DS_IRR_AMST       " POSITION(00009:00262) CHAR(254)
 , "ST_INF_NET        " POSITION(00263:00263) CHAR(001)
 , "NI_AMST           " POSITION(00264:00267) DECIMAL
 )
