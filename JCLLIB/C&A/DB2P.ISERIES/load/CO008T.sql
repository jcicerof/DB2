LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO008T_FNE        "
 ( "CD_FNE            " POSITION(00007:00008) DECIMAL
 , "MN_FNE            " POSITION(00009:00011) CHAR(003)
 , "NO_FNE            " POSITION(00012:00041) CHAR(030)
 )