LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG008T_SOL_ETI_LGS"
 ( "NI_SOL_ETI        " POSITION(00007:00010) DECIMAL
 , "NI_PED            " POSITION(00011:00014) DECIMAL
 , "CD_PACK_PED       " POSITION(00015:00015) CHAR(001)
 , "VL_PRC            " POSITION(00016:00023) DECIMAL
 , "QT_ETI            " POSITION(00024:00026) DECIMAL
 , "CD_REF            " POSITION(00027:00029) DECIMAL
 , "CD_SKU            " POSITION(00030:00034) DECIMAL
 , "CD_FNE            " POSITION(00035:00036) DECIMAL
 , "CD_PAIS           " POSITION(00037:00038) CHAR(002)
 , "CD_RGI_PRC        " POSITION(00039:00041) DECIMAL
 , "IN_EXG_DAD        " POSITION(00042:00042) CHAR(001)
 )