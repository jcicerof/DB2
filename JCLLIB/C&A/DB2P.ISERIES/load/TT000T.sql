LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TT000T_ADMR_CRE   "
 ( "CD_ADMR_CRE       " POSITION(00007:00008) SMALLINT
 , "SL_ADMR_CRE       " POSITION(00009:00010) CHAR(002)
 , "NO_ADMR_CRE       " POSITION(00011:00030) CHAR(020)
 )