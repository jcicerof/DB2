LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG005T_LOC_IMP_ETI"
 ( "CD_LOC_IMP_ETI    " POSITION(00007:00007) DECIMAL
 , "DS_LOC_IMP_ETI_PRG" POSITION(00008:00027) CHAR(020)
 , "DS_LOC_IMP_ETI_SPH" POSITION(00028:00047) CHAR(020)
 , "DS_LOC_IMP_ETI_IGL" POSITION(00048:00067) CHAR(020)
 )
