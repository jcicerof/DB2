LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG204T_CTR_ORI_ETQ"
 ( "NI_PL             " POSITION(00007:00011) DECIMAL
 , "NI_DOC_FIS        " POSITION(00012:00016) DECIMAL
 , "NI_PED            " POSITION(00017:00020) DECIMAL
 , "IN_EXG_DAD        " POSITION(00021:00021) CHAR(001)
 )
