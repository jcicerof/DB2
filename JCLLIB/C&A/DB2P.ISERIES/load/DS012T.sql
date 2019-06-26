LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS012T_DVL        "
 ( "NI_DVL            " POSITION(00007:00010) INTEGER
 , "CD_LOJ            " POSITION(00012:00014) DECIMAL
                          NULLIF(00011)=X'FF'
 , "CD_FOR            " POSITION(00016:00021) CHAR(006)
                          NULLIF(00015)=X'FF'
 , "DT_DVL            " POSITION(00023:00032) DATE EXTERNAL
                          NULLIF(00022)=X'FF'
 , "NI_NF             " POSITION(00034:00039) DECIMAL
                          NULLIF(00033)=X'FF'
 , "TP_DVL            " POSITION(00041:00041) CHAR(001)
                          NULLIF(00040)=X'FF'
 , "HR_DVL_ART        " POSITION(00043:00050) TIME EXTERNAL
                          NULLIF(00042)=X'FF'
 )
