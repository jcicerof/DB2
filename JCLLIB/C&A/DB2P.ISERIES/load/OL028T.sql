LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."OL028T_PED_INSP   "
 ( "NI_PED            " POSITION(00007:00010) DECIMAL
 , "TX_MTV_INSP       " POSITION(00012:00061) CHAR(050)
                          NULLIF(00011)=X'FF'
 )
