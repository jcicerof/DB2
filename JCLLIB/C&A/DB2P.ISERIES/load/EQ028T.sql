LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."EQ028T_MOV_RLC_ETQ"
 ( "CD_MOV_ETQ        " POSITION(00007:00008) DECIMAL
 , "NU_SEQ_RLC        " POSITION(00009:00010) DECIMAL
 , "CD_MOV_RLC        " POSITION(00011:00012) DECIMAL
 )
