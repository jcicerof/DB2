LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS007T_ITEM_REC   "
 ( "NI_REC            " POSITION(00007:00010) INTEGER
 , "CD_PRD_FOR        " POSITION(00011:00032) VARCHAR
 , "QT_REC_FSI        " POSITION(00033:00038) DECIMAL
 , "NO_PRD_FOR        " POSITION(00040:00091) VARCHAR
                          NULLIF(00039)=X'FF'
 )
