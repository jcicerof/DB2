LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PF037T_QPFS_PED   "
 ( "NI_PED            " POSITION(00007:00010) DECIMAL
 , "CD_NIV_QPFS       " POSITION(00011:00011) CHAR(001)
 , "CD_GRAU_NIV_QPFS  " POSITION(00012:00012) DECIMAL
 )
