LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PF019T_PACK_PDR   "
 ( "NI_MDL            " POSITION(00007:00010) DECIMAL
 , "CD_PACK_PDR_MDL   " POSITION(00011:00012) DECIMAL
 , "DS_PACK_PDR_PRG   " POSITION(00013:00072) CHAR(060)
 , "DS_PACK_PDR_SPH   " POSITION(00073:00132) CHAR(060)
 , "DS_PACK_PDR_IGL   " POSITION(00133:00192) CHAR(060)
 )
