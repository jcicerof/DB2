LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."ES003T_SCL_ITT    "
 ( "CD_PAIS           " POSITION(00007:00008) CHAR(002)
 , "HR_INI            " POSITION(00009:00012) CHAR(004)
 , "HR_FIM            " POSITION(00013:00016) CHAR(004)
 , "HR_ITT            " POSITION(00017:00020) CHAR(004)
 )
