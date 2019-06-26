LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG225T_DET_MOV_ETQ"
 ( "NI_PED            " POSITION(00007:00010) DECIMAL
 , "NU_REC_PED        " POSITION(00011:00012) DECIMAL
 , "TS_DET_MOV_ETQ    " POSITION(00013:00038) TIMESTAMP EXTERNAL
 , "CD_PACK_REC       " POSITION(00039:00039) CHAR(001)
 , "NU_PACK_REC       " POSITION(00040:00042) DECIMAL
 , "NI_PL_ORI         " POSITION(00044:00048) DECIMAL
                          NULLIF(00043)=X'FF'
 , "NU_ORD_VOL_PL_ORI " POSITION(00050:00052) DECIMAL
                          NULLIF(00049)=X'FF'
 , "NI_PL_DTN         " POSITION(00054:00058) DECIMAL
                          NULLIF(00053)=X'FF'
 , "NU_ORD_VOL_PL_DTN " POSITION(00060:00062) DECIMAL
                          NULLIF(00059)=X'FF'
 , "CD_USR            " POSITION(00063:00070) CHAR(008)
 , "CD_FL_ORI         " POSITION(00071:00073) DECIMAL
 , "CD_TIP_ETQ_ORI    " POSITION(00074:00075) DECIMAL
 , "CD_FL_AMZG_ORI    " POSITION(00076:00078) DECIMAL
 , "CD_FL_DTN         " POSITION(00079:00081) DECIMAL
 , "CD_TIP_ETQ_DTN    " POSITION(00082:00083) DECIMAL
 , "CD_FL_AMZG_DTN    " POSITION(00084:00086) DECIMAL
 , "QT_PCA_MOV_ETQ    " POSITION(00087:00090) INTEGER
 , "IN_EXG_DAD        " POSITION(00091:00091) CHAR(001)
 )
