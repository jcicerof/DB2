LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG342T_ITEM_MENU  "
 ( "CD_ITEM_MENU      " POSITION(00007:00008) SMALLINT
 , "NO_ITEM_MENU_PTG  " POSITION(00009:00023) CHAR(015)
 , "NO_ITEM_MENU_ESP  " POSITION(00024:00038) CHAR(015)
 , "NO_ITEM_MENU_ING  " POSITION(00039:00053) CHAR(015)
 , "CD_ITEM_MENU_SBD  " POSITION(00055:00056) SMALLINT
                          NULLIF(00054)=X'FF'
 , "CD_TRN_LGS        " POSITION(00058:00061) CHAR(004)
                          NULLIF(00057)=X'FF'
 , "NU_ORD_ITEM_MENU  " POSITION(00063:00064) SMALLINT
                          NULLIF(00062)=X'FF'
 )