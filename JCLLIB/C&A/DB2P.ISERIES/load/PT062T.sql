LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PT062T_GRU_FIB_NCM"
 ( "NU_PRD_NCM        " POSITION(00007:00010) INTEGER
 , "CD_DET_NCM        " POSITION(00011:00020) CHAR(010)
 , "NI_GRU_FIB_TXL    " POSITION(00021:00024) INTEGER
 )