LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG132T_TIP_CRTF   "
 ( "CD_TIP_CERTF_QLD  " POSITION(00007:00008) DECIMAL
 , "DS_CERTF_QLD_PRG  " POSITION(00009:00038) CHAR(030)
 , "DS_CERTF_QLD_SPH  " POSITION(00039:00068) CHAR(030)
 , "DS_CERTF_QLD_IGL  " POSITION(00069:00098) CHAR(030)
 )
