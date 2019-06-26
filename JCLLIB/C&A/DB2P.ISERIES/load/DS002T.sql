LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS002T_PED_ETG_LOJ"
 ( "NI_PED_ETG_LOJ    " POSITION(00007:00010) INTEGER
 , "DT_EMSS           " POSITION(00012:00021) DATE EXTERNAL
                          NULLIF(00011)=X'FF'
 , "DT_ULT_ENTR       " POSITION(00023:00032) DATE EXTERNAL
                          NULLIF(00022)=X'FF'
 , "DT_REC            " POSITION(00034:00043) DATE EXTERNAL
                          NULLIF(00033)=X'FF'
 , "DT_PRI_ENTR       " POSITION(00045:00054) DATE EXTERNAL
                          NULLIF(00044)=X'FF'
 , "HR_EMSS           " POSITION(00056:00063) TIME EXTERNAL
                          NULLIF(00055)=X'FF'
 , "DT_PAD            " POSITION(00065:00074) DATE EXTERNAL
                          NULLIF(00064)=X'FF'
 , "VL_TOT            " POSITION(00076:00082) DECIMAL
                          NULLIF(00075)=X'FF'
 , "CD_PRZ_PAG        " POSITION(00084:00087) CHAR(004)
                          NULLIF(00083)=X'FF'
 , "QT_TOT_PED        " POSITION(00089:00094) DECIMAL
                          NULLIF(00088)=X'FF'
 , "CD_SIT_PED        " POSITION(00096:00097) SMALLINT
                          NULLIF(00095)=X'FF'
 , "VL_FRT            " POSITION(00099:00105) DECIMAL
                          NULLIF(00098)=X'FF'
 , "CD_FOR            " POSITION(00107:00112) CHAR(006)
                          NULLIF(00106)=X'FF'
 , "CD_LOJ            " POSITION(00114:00116) DECIMAL
                          NULLIF(00113)=X'FF'
 , "CD_DEPTO_COM      " POSITION(00118:00119) DECIMAL
                          NULLIF(00117)=X'FF'
 , "CD_USR            " POSITION(00121:00128) CHAR(008)
                          NULLIF(00120)=X'FF'
 , "DT_ULT_ALT        " POSITION(00130:00139) DATE EXTERNAL
                          NULLIF(00129)=X'FF'
 , "HR_ULT_ALT        " POSITION(00141:00148) TIME EXTERNAL
                          NULLIF(00140)=X'FF'
 , "CD_USR_ULT_ALT    " POSITION(00150:00157) CHAR(008)
                          NULLIF(00149)=X'FF'
 , "DS_OBS            " POSITION(00159:00412) CHAR(254)
                          NULLIF(00158)=X'FF'
 )
