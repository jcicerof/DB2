LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG113T_TIP_INSP   "
 ( "CD_TIP_INSP       " POSITION(00007:00008) DECIMAL
 , "DS_TIP_INSP_PRG   " POSITION(00009:00028) CHAR(020)
 , "DS_TIP_INSP_SPH   " POSITION(00029:00048) CHAR(020)
 , "DS_TIP_INSP_IGL   " POSITION(00049:00068) CHAR(020)
 )
