LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."RL007T_MTV_TIP_TRC"
 ( "CD_TIP_TRC        " POSITION(00007:00008) SMALLINT
 , "CD_MTV_TRC        " POSITION(00009:00010) SMALLINT
 )
