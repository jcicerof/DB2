LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PT056T_TIP_PRD    "
 ( "NI_TIP_PRD        " POSITION(00007:00010) INTEGER
 , "NI_TIP_UTL        " POSITION(00011:00014) INTEGER
 , "NO_TIP_PRD_PTG    " POSITION(00015:00064) CHAR(050)
 , "NO_TIP_PRD_SPH    " POSITION(00065:00114) CHAR(050)
 , "NO_TIP_PRD_IGL    " POSITION(00115:00164) CHAR(050)
 )
