LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."IF002T_PLN_PAG_EMP"
 ( "CD_EMP            " POSITION(00007:00008) SMALLINT
 , "CD_PLN_PAG_EMP    " POSITION(00009:00012) INTEGER
 , "NO_PLN_PAG_EMP    " POSITION(00014:00033) CHAR(020)
                          NULLIF(00013)=X'FF'
 )