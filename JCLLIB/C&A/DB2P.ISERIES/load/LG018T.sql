LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG018T_TEL_BUREAU "
 ( "NI_BUR            " POSITION(00007:00008) SMALLINT
 , "NU_TEL_BUR        " POSITION(00009:00014) DECIMAL
 , "CD_TIP_TEL_BUR    " POSITION(00015:00024) CHAR(010)
 , "NU_DDD_BUR        " POSITION(00026:00027) SMALLINT
                          NULLIF(00025)=X'FF'
 , "NU_DDI_BUR        " POSITION(00029:00030) SMALLINT
                          NULLIF(00028)=X'FF'
 , "NU_RM_BUR         " POSITION(00032:00033) SMALLINT
                          NULLIF(00031)=X'FF'
 )
