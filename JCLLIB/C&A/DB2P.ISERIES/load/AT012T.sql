LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."AT012T_TMOV_VRSPOS"
 ( "CD_VRS_POS        " POSITION(00007:00008) DECIMAL
 , "CD_RLS_VRS        " POSITION(00009:00010) DECIMAL
 , "CD_MOV_POS        " POSITION(00011:00012) DECIMAL
 )
