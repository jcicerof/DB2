LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."IF009T_TIP_PRD_SAP"
 ( "CD_TIP_PRD_SAP    " POSITION(00007:00008) SMALLINT
 , "NO_TIP_PRD_SAP    " POSITION(00009:00028) CHAR(020)
 )
