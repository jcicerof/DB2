LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PF023T_MTD_ALO    "
 ( "CD_MTD            " POSITION(00007:00010) DECIMAL
 , "CD_USR            " POSITION(00011:00018) CHAR(008)
 , "ST_GLB            " POSITION(00019:00019) CHAR(001)
 , "DS_MTD            " POSITION(00020:00069) CHAR(050)
 , "ST_COO            " POSITION(00070:00070) CHAR(001)
 , "CD_PAIS           " POSITION(00071:00072) CHAR(002)
 , "CD_FNE            " POSITION(00073:00074) DECIMAL
 , "ST_MTD_ATI        " POSITION(00075:00075) CHAR(001)
 )
