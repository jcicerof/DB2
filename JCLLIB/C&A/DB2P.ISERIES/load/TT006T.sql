LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TT006T_TIP_MOV_STT"
 ( "CD_TIP_MOV_STT    " POSITION(00007:00008) SMALLINT
 , "NO_TIP_MOV_STT    " POSITION(00009:00058) CHAR(050)
 , "IN_TIP_MOV_STT_CRE" POSITION(00059:00059) CHAR(001)
 )
