LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PT029T_NIV_QPFS   "
 ( "CD_NIV_QPFS       " POSITION(00007:00007) CHAR(001)
 )
