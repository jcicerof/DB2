LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CX021T_LOG        "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "CD_TRN            " POSITION(00010:00012) DECIMAL
 , "DT_SIS            " POSITION(00013:00022) DATE EXTERNAL
 , "HR_SIS            " POSITION(00023:00030) TIME EXTERNAL
 , "CD_USR            " POSITION(00031:00038) CHAR(008)
 , "CD_TER            " POSITION(00039:00042) CHAR(004)
 , "TP_ATLZ           " POSITION(00043:00043) CHAR(001)
 )
