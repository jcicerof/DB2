LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PT016T_GRAU_INSCNS"
 ( "CD_INS_CNS        " POSITION(00007:00008) DECIMAL
 , "CD_GRAU_INS_CNS   " POSITION(00009:00010) DECIMAL
 , "VL_PRIO_GRAU      " POSITION(00011:00012) DECIMAL
 , "SR_IMG_GRAU_INS   " POSITION(00013:00267) CHAR(255)
 , "DS_GRAU_INS_PRG   " POSITION(00268:00347) CHAR(080)
 , "DS_GRAU_INS_SPH   " POSITION(00348:00427) CHAR(080)
 , "DS_GRAU_INS_IGL   " POSITION(00428:00507) CHAR(080)
 )