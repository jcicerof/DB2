LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."IF023T_CNT_RSU_CTB"
 ( "CD_CNT_RSU_CTB    " POSITION(00007:00016) CHAR(010)
 , "CD_TIP_CNT_RSU_CTB" POSITION(00017:00017) CHAR(001)
 , "NO_CNT_RSU_CTB    " POSITION(00018:00067) CHAR(050)
 )
