LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG135T_MDD_AMSTG  "
 ( "NI_ANL_MDD        " POSITION(00007:00010) DECIMAL
 , "NU_SEQ_MDD        " POSITION(00011:00012) DECIMAL
 , "QT_CM_MDD         " POSITION(00013:00014) DECIMAL
 , "ST_MDD_PDR        " POSITION(00015:00015) CHAR(001)
 , "CD_FNE            " POSITION(00016:00017) DECIMAL
 , "CD_CLS            " POSITION(00018:00019) DECIMAL
 , "CD_TIP_MDD_ANL    " POSITION(00020:00021) DECIMAL
 , "NI_SKU            " POSITION(00022:00026) DECIMAL
 , "NI_PED            " POSITION(00027:00030) DECIMAL
 , "NU_SEQ_INSP_PED   " POSITION(00031:00032) DECIMAL
 )
