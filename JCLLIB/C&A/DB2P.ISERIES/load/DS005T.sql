LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS005T_REC        "
 ( "NI_REC            " POSITION(00007:00010) INTEGER
 , "CD_LOJ            " POSITION(00012:00014) DECIMAL
                          NULLIF(00011)=X'FF'
 , "CD_FOR            " POSITION(00016:00021) CHAR(006)
                          NULLIF(00015)=X'FF'
 , "DT_REC            " POSITION(00023:00032) DATE EXTERNAL
                          NULLIF(00022)=X'FF'
 , "NI_NF             " POSITION(00034:00039) DECIMAL
                          NULLIF(00033)=X'FF'
 , "HR_REC            " POSITION(00041:00048) TIME EXTERNAL
                          NULLIF(00040)=X'FF'
 , "CD_SIT_REC        " POSITION(00050:00051) SMALLINT
                          NULLIF(00049)=X'FF'
 , "NI_PED_NF         " POSITION(00053:00056) INTEGER
                          NULLIF(00052)=X'FF'
 , "NI_PED_ITEM       " POSITION(00058:00061) INTEGER
                          NULLIF(00057)=X'FF'
 , "CD_USR_REC_ITEM   " POSITION(00063:00070) CHAR(008)
                          NULLIF(00062)=X'FF'
 , "CD_USR_REC_NF     " POSITION(00072:00079) CHAR(008)
                          NULLIF(00071)=X'FF'
 )
