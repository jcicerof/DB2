LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."IF006T_UND_NEG    "
 ( "CD_UND_NEG        " POSITION(00007:00008) SMALLINT
 , "NO_UND_NEG        " POSITION(00010:00029) CHAR(020)
                          NULLIF(00009)=X'FF'
 )
