LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG601T_PRO_CEA    "
 ( "AN_PRO_CEA        " POSITION(00007:00008) SMALLINT
 , "ME_PRO_CEA        " POSITION(00009:00010) SMALLINT
 , "NU_SEM_PRO_CEA    " POSITION(00011:00012) SMALLINT
 , "DI_SEM_PRO_CEA    " POSITION(00013:00014) SMALLINT
 , "NU_ITV_HOR        " POSITION(00015:00016) SMALLINT
 , "DT_CLD_CEA        " POSITION(00017:00026) DATE EXTERNAL
 , "IN_EXG_DAD        " POSITION(00027:00027) CHAR(001)
 )
