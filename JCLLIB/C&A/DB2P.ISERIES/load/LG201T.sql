LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG201T_CTR_PPR_DSC"
 ( "NI_PL             " POSITION(00007:00011) DECIMAL
 , "NU_ORD_VOL_PL     " POSITION(00012:00014) DECIMAL
 , "CD_BOL            " POSITION(00015:00016) DECIMAL
 , "NU_LIN            " POSITION(00017:00019) DECIMAL
 )