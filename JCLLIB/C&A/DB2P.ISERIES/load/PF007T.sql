LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PF007T_RGI_PED_COO"
 ( "NI_PED_MST        " POSITION(00007:00010) DECIMAL
 , "CD_FNE_MST        " POSITION(00011:00012) DECIMAL
 , "CD_PAIS_MST       " POSITION(00013:00014) CHAR(002)
 , "CD_RGI_PRC_MST    " POSITION(00015:00017) DECIMAL
 , "NI_PED_ECV        " POSITION(00018:00021) DECIMAL
 , "CD_FNE_ECV        " POSITION(00022:00023) DECIMAL
 , "CD_PAIS_ECV       " POSITION(00024:00025) CHAR(002)
 , "CD_RGI_PRC_ECV    " POSITION(00026:00028) DECIMAL
 , "CD_TIP_COO        " POSITION(00029:00030) DECIMAL
 )