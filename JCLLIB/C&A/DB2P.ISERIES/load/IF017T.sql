LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."IF017T_FCA_SAP    "
 ( "CD_FCA_SAP        " POSITION(00007:00008) SMALLINT
 , "NO_FCA_SAP        " POSITION(00010:00029) CHAR(020)
                          NULLIF(00009)=X'FF'
 )