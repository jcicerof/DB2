LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG332T_NF_PRS     "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "NU_ATD_REC        " POSITION(00010:00012) DECIMAL
 , "CD_FOR            " POSITION(00013:00018) CHAR(006)
 , "NU_NF             " POSITION(00019:00025) DECIMAL
 , "NU_SRE_NF         " POSITION(00026:00027) CHAR(002)
 , "NI_PED            " POSITION(00028:00031) DECIMAL
 , "ST_NF             " POSITION(00032:00032) CHAR(001)
 , "NU_PGN            " POSITION(00033:00034) DECIMAL
 , "CD_SEQ_NF         " POSITION(00035:00039) CHAR(005)
 , "ST_SIT_DVG_QTD    " POSITION(00040:00040) CHAR(001)
 , "CD_PED_RECU       " POSITION(00041:00041) CHAR(001)
 , "SR_NF             " POSITION(00042:11543) VARCHAR
 , "IN_EXG_DAD        " POSITION(11544:11544) CHAR(001)
 )