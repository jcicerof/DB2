LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PT047T_ATBGEN_PRD "
 ( "CD_FML_PRD        " POSITION(00007:00009) DECIMAL
 , "DS_FML_PRD_PRG    " POSITION(00010:00039) CHAR(030)
 , "DS_FML_PRD_SPH    " POSITION(00040:00069) CHAR(030)
 , "DS_FML_PRD_IGL    " POSITION(00070:00099) CHAR(030)
 )
