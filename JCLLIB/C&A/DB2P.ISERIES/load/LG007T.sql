LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG007T_ETI_PACK   "
 ( "NI_SOL_ETI        " POSITION(00007:00010) DECIMAL
 , "NI_PED            " POSITION(00011:00014) DECIMAL
 , "CD_PACK_PED       " POSITION(00015:00015) CHAR(001)
 , "QT_VOL_PACK       " POSITION(00016:00016) DECIMAL
 , "QT_PACK           " POSITION(00017:00019) DECIMAL
 , "IN_EXG_DAD        " POSITION(00020:00020) CHAR(001)
 )
