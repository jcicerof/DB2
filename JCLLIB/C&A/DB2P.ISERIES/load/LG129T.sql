LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG129T_LOT_AMSTG  "
 ( "CD_LOT_AMSTG      " POSITION(00007:00008) DECIMAL
 , "DS_LOT_AMSTG_PRG  " POSITION(00009:00038) CHAR(030)
 , "DS_LOT_AMSTG_SPH  " POSITION(00039:00068) CHAR(030)
 , "DS_LOT_AMSTG_IGL  " POSITION(00069:00098) CHAR(030)
 , "QT_MIN_PCA_AMSTG  " POSITION(00099:00101) DECIMAL
 )
