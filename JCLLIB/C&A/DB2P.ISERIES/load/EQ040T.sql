LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."EQ040T_MTV_PND_MOV"
 ( "CD_MTV_PND_MOV    " POSITION(00007:00008) DECIMAL
 , "DS_MTV_PND_MOV    " POSITION(00009:00038) CHAR(030)
 )
