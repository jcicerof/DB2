LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."EQ018T_SOL_TRF    "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "NI_SOL            " POSITION(00010:00015) DECIMAL
 , "CD_FL_DEST        " POSITION(00016:00018) DECIMAL
 , "ST_PRC_DIF        " POSITION(00019:00019) CHAR(001)
 , "CD_TIP_ETQ_DEST   " POSITION(00021:00022) DECIMAL
                          NULLIF(00020)=X'FF'
 )