LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PF056T_TIP_OPR_PED"
 ( "CD_OPR_PED        " POSITION(00007:00008) SMALLINT
 , "NO_OPR_PED        " POSITION(00009:00048) CHAR(040)
 )