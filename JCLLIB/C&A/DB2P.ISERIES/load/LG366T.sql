LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG366T_PRM_IMP_LSR"
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "NU_TIP_IMP        " POSITION(00010:00011) SMALLINT
 , "QT_ITEM_IMP       " POSITION(00013:00014) SMALLINT
                          NULLIF(00012)=X'FF'
 )