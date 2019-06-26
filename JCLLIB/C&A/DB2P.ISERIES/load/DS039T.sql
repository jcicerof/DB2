LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS039T_HIS_INF_CEL"
 ( "NU_SER_CEL        " POSITION(00007:00026) CHAR(020)
 , "NI_MDL            " POSITION(00027:00030) DECIMAL
 , "NI_SKU            " POSITION(00031:00035) DECIMAL
 , "CD_FL             " POSITION(00036:00038) DECIMAL
 , "CD_EAN            " POSITION(00040:00046) DECIMAL
                          NULLIF(00039)=X'FF'
 , "NI_PED            " POSITION(00048:00051) DECIMAL
                          NULLIF(00047)=X'FF'
 , "NI_SIT_CEL        " POSITION(00052:00053) SMALLINT
 , "DT_VEN_CEL        " POSITION(00054:00063) DATE EXTERNAL
 , "VL_VEN_CEL        " POSITION(00065:00071) DECIMAL
                          NULLIF(00064)=X'FF'
 , "HR_VEN_CEL        " POSITION(00073:00080) TIME EXTERNAL
                          NULLIF(00072)=X'FF'
 , "CD_PDV_VEN_CEL    " POSITION(00082:00083) SMALLINT
                          NULLIF(00081)=X'FF'
 , "CD_TIP_CEL        " POSITION(00085:00086) SMALLINT
                          NULLIF(00084)=X'FF'
 , "NU_LIN_CEL        " POSITION(00088:00099) CHAR(012)
                          NULLIF(00087)=X'FF'
 , "IN_TCL_PTO        " POSITION(00101:00102) SMALLINT
                          NULLIF(00100)=X'FF'
 , "VL_PTE_PRC_VEN    " POSITION(00104:00110) DECIMAL
                          NULLIF(00103)=X'FF'
 , "VL_PAR_VEN        " POSITION(00112:00118) DECIMAL
                          NULLIF(00111)=X'FF'
 , "VL_CMS_VEN        " POSITION(00120:00126) DECIMAL
                          NULLIF(00119)=X'FF'
 , "VL_VRB_PPG_COO    " POSITION(00128:00134) DECIMAL
                          NULLIF(00127)=X'FF'
 , "VL_CPA_VEN        " POSITION(00136:00142) DECIMAL
                          NULLIF(00135)=X'FF'
 , "VL_BNFC_VEN       " POSITION(00144:00150) DECIMAL
                          NULLIF(00143)=X'FF'
 , "NU_TKT_VEN        " POSITION(00152:00155) INTEGER
                          NULLIF(00151)=X'FF'
 , "DT_ULT_INV        " POSITION(00157:00166) DATE EXTERNAL
                          NULLIF(00156)=X'FF'
 , "DT_REC_INF        " POSITION(00168:00177) DATE EXTERNAL
                          NULLIF(00167)=X'FF'
 , "NI_PLN_CTA        " POSITION(00179:00180) SMALLINT
                          NULLIF(00178)=X'FF'
 , "VL_RED_VEN        " POSITION(00182:00190) DECIMAL
                          NULLIF(00181)=X'FF'
 , "VL_AMT_VEN        " POSITION(00192:00200) DECIMAL
                          NULLIF(00191)=X'FF'
 , "PC_ICMS_VEN       " POSITION(00202:00204) DECIMAL
                          NULLIF(00201)=X'FF'
 , "VL_CUS_SER        " POSITION(00206:00212) DECIMAL
                          NULLIF(00205)=X'FF'
 , "IN_TRT_LIB_VEN    " POSITION(00213:00213) CHAR(001)
 , "CD_CTR_OPR_CEL    " POSITION(00215:00216) SMALLINT
                          NULLIF(00214)=X'FF'
 , "NI_OPD_CEL        " POSITION(00218:00219) SMALLINT
                          NULLIF(00217)=X'FF'
 )
