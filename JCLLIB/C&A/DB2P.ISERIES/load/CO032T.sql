LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO032T_ATB_GEN_DMN"
 ( "CD_ATB_GEN_FL     " POSITION(00007:00009) DECIMAL
 , "CD_DMN_ATB_GEN_FL " POSITION(00010:00011) DECIMAL
 , "DS_DMN_ATB_GEN_FL " POSITION(00012:00041) CHAR(030)
 )