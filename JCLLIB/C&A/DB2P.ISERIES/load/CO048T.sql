LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO048T_MSG_PDV    "
 ( "NI_MSG_PDV        " POSITION(00007:00008) SMALLINT
 , "TX_MSG_PDV_PTG    " POSITION(00009:00028) CHAR(020)
 , "TX_MSG_PDV_SPH    " POSITION(00029:00048) CHAR(020)
 , "TX_MSG_PDV_IGL    " POSITION(00049:00068) CHAR(020)
 )
