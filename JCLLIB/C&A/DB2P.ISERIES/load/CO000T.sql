LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CO000T_FILIAL     "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "NO_FL             " POSITION(00010:00049) CHAR(040)
 , "MN_FL             " POSITION(00050:00052) CHAR(003)
 , "TP_FL             " POSITION(00053:00053) DECIMAL
 , "CD_IDENT_SPC      " POSITION(00055:00064) CHAR(010)
                          NULLIF(00054)=X'FF'
 , "CD_IDENT_EMBRATEL " POSITION(00066:00069) CHAR(004)
                          NULLIF(00065)=X'FF'
 , "DT_ING            " POSITION(00071:00080) DATE EXTERNAL
                          NULLIF(00070)=X'FF'
 , "DT_FCH            " POSITION(00082:00091) DATE EXTERNAL
                          NULLIF(00081)=X'FF'
 , "CD_CNPJ           " POSITION(00093:00100) DECIMAL
                          NULLIF(00092)=X'FF'
 , "DT_CNPJ           " POSITION(00102:00111) DATE EXTERNAL
                          NULLIF(00101)=X'FF'
 , "CD_INSC_EST       " POSITION(00113:00130) CHAR(018)
                          NULLIF(00112)=X'FF'
 , "CD_PAIS           " POSITION(00131:00132) CHAR(002)
 , "CD_INSC_MUN       " POSITION(00134:00151) CHAR(018)
                          NULLIF(00133)=X'FF'
 , "DT_INSC_MUN       " POSITION(00153:00162) DATE EXTERNAL
                          NULLIF(00152)=X'FF'
 , "CD_INSC_JRD       " POSITION(00164:00181) CHAR(018)
                          NULLIF(00163)=X'FF'
 , "DT_INSC_JRD       " POSITION(00183:00192) DATE EXTERNAL
                          NULLIF(00182)=X'FF'
 , "CD_TBT_IVA        " POSITION(00194:00195) CHAR(002)
                          NULLIF(00193)=X'FF'
 , "CD_CUIT           " POSITION(00197:00204) DECIMAL
                          NULLIF(00196)=X'FF'
 , "CD_SIT_FL         " POSITION(00205:00205) DECIMAL
 , "DT_INSC_EST       " POSITION(00207:00216) DATE EXTERNAL
                          NULLIF(00206)=X'FF'
 , "CD_FNE            " POSITION(00217:00218) DECIMAL
 , "CD_PVC            " POSITION(00220:00221) DECIMAL
                          NULLIF(00219)=X'FF'
 , "CD_UF             " POSITION(00223:00224) CHAR(002)
                          NULLIF(00222)=X'FF'
 , "DS_END            " POSITION(00226:00260) CHAR(035)
                          NULLIF(00225)=X'FF'
 , "DS_BAI            " POSITION(00262:00296) CHAR(035)
                          NULLIF(00261)=X'FF'
 , "NO_CID            " POSITION(00298:00332) CHAR(035)
                          NULLIF(00297)=X'FF'
 , "CD_CEP            " POSITION(00334:00341) CHAR(008)
                          NULLIF(00333)=X'FF'
 , "CD_JUN_COML       " POSITION(00343:00356) CHAR(014)
                          NULLIF(00342)=X'FF'
 , "DT_REG_JUN_COML   " POSITION(00358:00367) DATE EXTERNAL
                          NULLIF(00357)=X'FF'
 , "MN_JUN_COML       " POSITION(00369:00378) CHAR(010)
                          NULLIF(00368)=X'FF'
 , "NU_ULT_FOL_INV    " POSITION(00380:00383) DECIMAL
                          NULLIF(00379)=X'FF'
 , "NU_ORD_LIV_INV    " POSITION(00385:00386) DECIMAL
                          NULLIF(00384)=X'FF'
 , "CD_REGN_LOJ       " POSITION(00388:00389) DECIMAL
                          NULLIF(00387)=X'FF'
 , "CD_GRU_LOJ        " POSITION(00391:00392) DECIMAL
                          NULLIF(00390)=X'FF'
 , "CD_AG             " POSITION(00394:00396) DECIMAL
                          NULLIF(00393)=X'FF'
 , "NU_CTA_CRNT       " POSITION(00398:00403) DECIMAL
                          NULLIF(00397)=X'FF'
 , "CD_GRU_LOJ_CNL    " POSITION(00405:00406) DECIMAL
                          NULLIF(00404)=X'FF'
 , "CD_BCO            " POSITION(00408:00409) DECIMAL
                          NULLIF(00407)=X'FF'
 , "CD_GRU_LOJ_FRT    " POSITION(00411:00412) DECIMAL
                          NULLIF(00410)=X'FF'
 , "CD_EMP            " POSITION(00414:00415) SMALLINT
                          NULLIF(00413)=X'FF'
 , "NO_EMAIL_GNT_FL   " POSITION(00417:00518) VARCHAR
                          NULLIF(00416)=X'FF'
 , "NU_ORD_APR_GRU_LOJ" POSITION(00520:00521) SMALLINT
                          NULLIF(00519)=X'FF'
 , "IN_CTR_SER_CEL    " POSITION(00522:00522) CHAR(001)
 , "IN_PTC_TMP_GRU_LOJ" POSITION(00523:00523) CHAR(001)
 )
