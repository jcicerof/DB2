LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."ES021T_CLS_RFS    "
 ( "CD_CLS_RFS        " POSITION(00007:00008) SMALLINT
 , "NO_CLS_RFS        " POSITION(00009:00048) CHAR(040)
 , "CD_DPT_RFS        " POSITION(00049:00050) SMALLINT
 , "NU_ORD_APR_CLS    " POSITION(00051:00052) SMALLINT
 , "IN_TOT_DPT_RFS    " POSITION(00053:00053) CHAR(001)
 , "CD_UND_MDD        " POSITION(00054:00055) SMALLINT
 )
