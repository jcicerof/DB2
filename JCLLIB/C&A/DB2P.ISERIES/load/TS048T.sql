LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS048T_TIP_UND_CBR"
 ( "CD_TIP_UND_CBR    " POSITION(00007:00008) SMALLINT
 , "NO_TIP_UND_CBR_PTG" POSITION(00009:00018) CHAR(010)
 , "NO_TIP_UND_CBR_ESP" POSITION(00019:00028) CHAR(010)
 , "NO_TIP_UND_CBR_ING" POSITION(00029:00038) CHAR(010)
 )
