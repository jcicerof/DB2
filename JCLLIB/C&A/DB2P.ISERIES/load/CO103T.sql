LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO103T_TIP_BLQ    "
 ( "CD_TIP_BLQ        " POSITION(00007:00008) SMALLINT
 , "TX_TIP_BLQ        " POSITION(00009:00048) CHAR(040)
 , "CD_RPO_BLQ        " POSITION(00050:00051) SMALLINT
                          NULLIF(00049)=X'FF'
 , "CD_OPR_BLQ        " POSITION(00053:00054) SMALLINT
                          NULLIF(00052)=X'FF'
 )
