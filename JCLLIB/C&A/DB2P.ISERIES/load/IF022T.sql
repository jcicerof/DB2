LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."IF022T_MOD_IF_EMP "
 ( "CD_EMP            " POSITION(00007:00008) SMALLINT
 , "CD_MOD_SIS_IF     " POSITION(00009:00010) CHAR(002)
 , "CD_CNT_RSU_CTB    " POSITION(00011:00020) CHAR(010)
 )
