LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS067T_HIS_INV_CEL"
 ( "NI_SER_CEL        " POSITION(00007:00010) INTEGER
 , "NU_SER_CEL        " POSITION(00011:00030) CHAR(020)
 , "NI_MDL            " POSITION(00031:00034) DECIMAL
 , "NI_SKU            " POSITION(00035:00039) DECIMAL
 , "CD_FL             " POSITION(00040:00042) DECIMAL
 , "NI_PED            " POSITION(00044:00047) DECIMAL
                          NULLIF(00043)=X'FF'
 , "NI_SIT_CEL        " POSITION(00048:00049) SMALLINT
 , "DT_VEN_CEL        " POSITION(00051:00060) DATE EXTERNAL
                          NULLIF(00050)=X'FF'
 , "VL_VEN_CEL        " POSITION(00062:00068) DECIMAL
                          NULLIF(00061)=X'FF'
 , "HR_VEN_CEL        " POSITION(00070:00077) TIME EXTERNAL
                          NULLIF(00069)=X'FF'
 , "CD_PDV_VEN_CEL    " POSITION(00079:00080) SMALLINT
                          NULLIF(00078)=X'FF'
 , "CD_TIP_CEL        " POSITION(00082:00083) SMALLINT
                          NULLIF(00081)=X'FF'
 , "NU_LIN_CEL        " POSITION(00085:00096) CHAR(012)
                          NULLIF(00084)=X'FF'
 , "IN_TCL_PTO        " POSITION(00098:00099) SMALLINT
                          NULLIF(00097)=X'FF'
 , "NU_TKT_VEN        " POSITION(00101:00104) INTEGER
                          NULLIF(00100)=X'FF'
 , "DT_ULT_INV        " POSITION(00106:00115) DATE EXTERNAL
                          NULLIF(00105)=X'FF'
 , "DT_REC_INF        " POSITION(00117:00126) DATE EXTERNAL
                          NULLIF(00116)=X'FF'
 , "NI_PLN_CTA        " POSITION(00128:00129) SMALLINT
                          NULLIF(00127)=X'FF'
 , "VL_RED_VEN        " POSITION(00131:00139) DECIMAL
                          NULLIF(00130)=X'FF'
 , "VL_AMT_VEN        " POSITION(00141:00149) DECIMAL
                          NULLIF(00140)=X'FF'
 , "PC_ICMS_VEN       " POSITION(00151:00152) DECIMAL
                          NULLIF(00150)=X'FF'
 , "VL_CUS_SER        " POSITION(00154:00160) DECIMAL
                          NULLIF(00153)=X'FF'
 , "NU_INV_MOV_SER    " POSITION(00162:00165) INTEGER
                          NULLIF(00161)=X'FF'
 , "DT_INV_MOV_SER    " POSITION(00167:00176) DATE EXTERNAL
                          NULLIF(00166)=X'FF'
 , "CD_FL_INV         " POSITION(00178:00180) DECIMAL
                          NULLIF(00177)=X'FF'
 , "DS_MOT_MOV_SER    " POSITION(00182:00231) CHAR(050)
                          NULLIF(00181)=X'FF'
 , "IN_TRT_LIB_VEN    " POSITION(00232:00232) CHAR(001)
 )
