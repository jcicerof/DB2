LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CS022T_INF_PED_ARG"
 ( "NI_PED            " POSITION(00007:00010) DECIMAL
 , "NI_DOC_FIS        " POSITION(00011:00015) DECIMAL
 , "DT_CTR_MOV        " POSITION(00016:00025) DATE EXTERNAL
 , "VL_UNI_ITEM_DOC   " POSITION(00026:00031) DECIMAL
 , "QT_PCA_ITEM_DOC   " POSITION(00032:00035) INTEGER
 , "VL_STOT_FAC       " POSITION(00036:00041) DECIMAL
 , "VL_DCT_ITEM_FAC   " POSITION(00042:00047) DECIMAL
 , "VL_CUS_GDO        " POSITION(00048:00053) DECIMAL
 , "VL_IVA_INSC_FAC   " POSITION(00054:00059) DECIMAL
 , "VL_IVA_PCP_FAC    " POSITION(00060:00068) DECIMAL
 , "VL_IIBB_PCP_FAC   " POSITION(00069:00077) DECIMAL
 , "VL_IMPO_FAC       " POSITION(00078:00083) DECIMAL
 , "VL_SELO           " POSITION(00084:00089) DECIMAL
 , "VL_TOT_DOC_FIS    " POSITION(00090:00095) DECIMAL
 , "VL_CTB_IMPT       " POSITION(00096:00101) DECIMAL
 , "VL_CST_CTB_CLCD   " POSITION(00102:00107) DECIMAL
 , "QT_PCA_INSP_DOC   " POSITION(00108:00111) INTEGER
 , "VL_STT_INSP_FAC   " POSITION(00112:00117) DECIMAL
 , "VL_DCT_INSP_FAC   " POSITION(00118:00123) DECIMAL
 , "VL_CST_GDO_INSP   " POSITION(00124:00129) DECIMAL
 , "VL_IVA_INSP_FAC   " POSITION(00130:00135) DECIMAL
 , "VL_IVA_PCP_INSP   " POSITION(00136:00141) DECIMAL
 , "VL_IIBB_PCP_INSP  " POSITION(00142:00147) DECIMAL
 , "VL_IPT_INTR_INSP  " POSITION(00148:00153) DECIMAL
 , "VL_SELO_INSP_FAC  " POSITION(00154:00159) DECIMAL
 , "VL_TOT_INSP_DOC   " POSITION(00160:00165) DECIMAL
 , "VL_UNI_REC_DOC_FIS" POSITION(00166:00171) DECIMAL
 , "VL_STT_REC_FAC    " POSITION(00172:00177) DECIMAL
 , "VL_DCT_REC_FAC    " POSITION(00178:00183) DECIMAL
 , "VL_CST_GDO_REC_FAC" POSITION(00184:00189) DECIMAL
 , "VL_IVA_REC_FAC    " POSITION(00190:00195) DECIMAL
 , "VL_IVA_PCP_REC_FAC" POSITION(00196:00201) DECIMAL
 , "VL_IIBB_PCP_REC   " POSITION(00202:00207) DECIMAL
 , "VL_IPT_INTR_REC   " POSITION(00208:00213) DECIMAL
 , "VL_SELO_REC_FAC   " POSITION(00214:00219) DECIMAL
 , "VL_TOT_REC_DOC_FIS" POSITION(00220:00225) DECIMAL
 , "VL_CST_CPL_REC_DOC" POSITION(00226:00231) DECIMAL
 , "VL_CST_CTB_REC_DOC" POSITION(00232:00237) DECIMAL
 , "VL_DEB_DVG_DOC_FIS" POSITION(00238:00243) DECIMAL
 , "VL_CRE_DVG_DOC_FIS" POSITION(00244:00249) DECIMAL
 , "QT_PCA_DVG_DOC_FIS" POSITION(00250:00253) INTEGER
 , "VL_CST_CTB_DVG_DOC" POSITION(00254:00259) DECIMAL
 , "CD_IDTF_COND_DVG  " POSITION(00260:00261) SMALLINT
 , "VL_CST_ETT_REC    " POSITION(00262:00266) DECIMAL
 )