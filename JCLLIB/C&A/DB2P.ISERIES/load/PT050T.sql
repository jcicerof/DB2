LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PT050T_TIP_APL_FIB"
 ( "CD_TIP_APL_FIB    " POSITION(00007:00008) DECIMAL
 , "DS_TIP_APL_FIB_PRG" POSITION(00009:00038) CHAR(030)
 , "DS_TIP_APL_FIB_SPH" POSITION(00039:00068) CHAR(030)
 , "DS_TIP_APL_FIB_IGL" POSITION(00069:00098) CHAR(030)
 )
