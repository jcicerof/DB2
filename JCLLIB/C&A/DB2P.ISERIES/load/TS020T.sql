LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."TS020T_ITEM_SNTD  "
 ( "DT_VGM            " POSITION(00007:00016) DATE EXTERNAL
 , "NU_VGM            " POSITION(00017:00020) INTEGER
 , "NI_DOC_FIS        " POSITION(00021:00029) DECIMAL
 , "NU_ORD_ITEM_FIS   " POSITION(00030:00031) DECIMAL
 , "QT_PCA_SNTD       " POSITION(00033:00036) INTEGER
                          NULLIF(00032)=X'FF'
 , "IN_EXG_DAD        " POSITION(00037:00037) CHAR(001)
 )
