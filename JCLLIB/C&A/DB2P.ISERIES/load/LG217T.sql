LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG217T_CTR_CG_EXPS"
 ( "NI_PL             " POSITION(00007:00011) DECIMAL
 , "NU_ORD_VOL_PL     " POSITION(00012:00014) DECIMAL
 , "CD_PACK_REC       " POSITION(00015:00015) CHAR(001)
 , "NU_PACK_REC       " POSITION(00016:00018) DECIMAL
 , "CD_FL_LOCZ_ETQ    " POSITION(00019:00021) DECIMAL
 , "IN_EXG_DAD        " POSITION(00022:00022) CHAR(001)
 )
