LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."AT013T_VERSAO_POS "
 ( "CD_VRS_POS        " POSITION(00007:00008) DECIMAL
 , "CD_RLS_VRS        " POSITION(00009:00010) DECIMAL
 , "DS_VRS_POS        " POSITION(00011:00030) CHAR(020)
 )
