LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."AT011T_TIP_MOVPOS "
 ( "CD_MOV_POS        " POSITION(00007:00008) DECIMAL
 , "DS_MOV_POS        " POSITION(00009:00028) CHAR(020)
 , "CD_MOV_ETQ        " POSITION(00029:00030) DECIMAL
 )
