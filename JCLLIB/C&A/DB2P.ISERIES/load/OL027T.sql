LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."OL027T_CTN_IMPT   "
 ( "CD_PCS_IMPT       " POSITION(00007:00026) CHAR(020)
 , "CD_CTN_PCS_IMPT   " POSITION(00027:00056) CHAR(030)
 , "IN_SIT_CTN        " POSITION(00057:00057) CHAR(001)
 , "TX_INF_CTN        " POSITION(00059:00158) CHAR(100)
                          NULLIF(00058)=X'FF'
 )
