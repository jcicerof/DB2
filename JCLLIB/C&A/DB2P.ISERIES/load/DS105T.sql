LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS105T_OPR_CLC    "
 ( "CD_OPR_CLC        " POSITION(00007:00008) SMALLINT
 , "TX_OPR_CLC        " POSITION(00009:00053) CHAR(045)
 , "IN_OPR            " POSITION(00054:00055) SMALLINT
 )
