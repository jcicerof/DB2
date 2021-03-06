LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG303T_FAC        "
 ( "NI_DOC_FIS        " POSITION(00007:00011) DECIMAL
 , "NU_FAC            " POSITION(00012:00018) DECIMAL
 , "VL_SOMA_ITEM_FAC  " POSITION(00019:00026) DECIMAL
 , "VL_IMPO_FAC       " POSITION(00027:00034) DECIMAL
 , "VL_STOT_FAC       " POSITION(00035:00042) DECIMAL
 , "PC_IVA_INSC_FAC   " POSITION(00043:00045) DECIMAL
 , "VL_IVA_INSC_FAC   " POSITION(00046:00053) DECIMAL
 , "PC_IVA_NOINSC_FAC " POSITION(00054:00056) DECIMAL
 , "VL_IVA_NOINSC_FAC " POSITION(00057:00064) DECIMAL
 , "VL_TOT_FAC        " POSITION(00065:00072) DECIMAL
 , "NU_RMT            " POSITION(00074:00080) DECIMAL
                          NULLIF(00073)=X'FF'
 , "VL_CUS_GDO        " POSITION(00082:00089) DECIMAL
                          NULLIF(00081)=X'FF'
 , "VL_CUS_TOT        " POSITION(00091:00098) DECIMAL
                          NULLIF(00090)=X'FF'
 , "VL_IVA_PCBD       " POSITION(00100:00107) DECIMAL
                          NULLIF(00099)=X'FF'
 , "VL_IIBB_PCBD      " POSITION(00109:00116) DECIMAL
                          NULLIF(00108)=X'FF'
 , "VL_SELO           " POSITION(00118:00125) DECIMAL
                          NULLIF(00117)=X'FF'
 , "IN_EXG_DAD        " POSITION(00126:00126) CHAR(001)
 )
