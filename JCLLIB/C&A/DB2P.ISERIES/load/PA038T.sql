LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA038T_PRD_PROCE  "
 ( "NI_PROCE          " POSITION(00007:00012) DECIMAL
 , "NU_SEQ_PRD        " POSITION(00013:00015) DECIMAL
 , "CD_CLS            " POSITION(00016:00017) DECIMAL
 , "CD_CLS_COD        " POSITION(00018:00019) DECIMAL
 , "NI_MDL            " POSITION(00020:00023) DECIMAL
 , "NI_SKU            " POSITION(00024:00028) DECIMAL
 , "ST_PCS            " POSITION(00029:00029) CHAR(001)
 , "CD_REF_PRC        " POSITION(00031:00033) DECIMAL
                          NULLIF(00030)=X'FF'
 )