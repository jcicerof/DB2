LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG105T_RSU_AMST   "
 ( "DT_RSU_AMST       " POSITION(00007:00016) DATE EXTERNAL
 , "ST_RSU_FIM        " POSITION(00017:00017) CHAR(001)
 , "NI_AMST           " POSITION(00018:00021) DECIMAL
 , "CD_TIP_RSU        " POSITION(00022:00023) DECIMAL
 , "CD_TIP_APV        " POSITION(00024:00025) DECIMAL
 , "CD_USR            " POSITION(00026:00033) CHAR(008)
 )
