LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG607T_TPO_MDI    "
 ( "AN_PRO_CEA        " POSITION(00007:00008) SMALLINT
 , "ME_PRO_CEA        " POSITION(00009:00010) SMALLINT
 , "NU_SEM_PRO_CEA    " POSITION(00011:00012) SMALLINT
 , "DI_SEM_PRO_CEA    " POSITION(00013:00014) SMALLINT
 , "NU_ITV_HOR        " POSITION(00015:00016) SMALLINT
 , "CD_PAIS           " POSITION(00017:00018) CHAR(002)
 , "CD_FL             " POSITION(00019:00021) DECIMAL
 , "CD_FLX            " POSITION(00022:00023) DECIMAL
 , "QT_PCA_TPO        " POSITION(00025:00033) DECIMAL
                          NULLIF(00024)=X'FF'
 , "QT_PCA_PCS        " POSITION(00035:00038) INTEGER
                          NULLIF(00034)=X'FF'
 , "QT_PED_PCS        " POSITION(00040:00043) INTEGER
                          NULLIF(00039)=X'FF'
 , "IN_EXG_DAD        " POSITION(00044:00044) CHAR(001)
 )