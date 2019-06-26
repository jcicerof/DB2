LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."CS004T_AJUSTE     "
 ( "NI_AJU            " POSITION(00007:00010) DECIMAL
 , "VL_AJU_CUS_CTB    " POSITION(00012:00019) DECIMAL
                          NULLIF(00011)=X'FF'
 , "VL_AJU_CUS_ETT    " POSITION(00021:00028) DECIMAL
                          NULLIF(00020)=X'FF'
 , "VL_AJU_BCP_CTB    " POSITION(00030:00037) DECIMAL
                          NULLIF(00029)=X'FF'
 , "VL_AJU_BCP_ETT    " POSITION(00039:00046) DECIMAL
                          NULLIF(00038)=X'FF'
 , "QT_PCA_RAT        " POSITION(00048:00050) DECIMAL
                          NULLIF(00047)=X'FF'
 , "DT_INI_PRD_RAT    " POSITION(00052:00061) DATE EXTERNAL
                          NULLIF(00051)=X'FF'
 , "DT_FIM_PRD_RAT    " POSITION(00063:00072) DATE EXTERNAL
                          NULLIF(00062)=X'FF'
 , "DS_OBS            " POSITION(00073:00326) CHAR(254)
 , "CD_MOV_ETQ        " POSITION(00327:00328) DECIMAL
 , "CD_MDLD_RAT       " POSITION(00329:00330) DECIMAL
 , "CD_USR            " POSITION(00332:00339) CHAR(008)
                          NULLIF(00331)=X'FF'
 , "CD_TIP_AJU        " POSITION(00340:00340) DECIMAL
 , "CD_TIP_OPR        " POSITION(00341:00341) DECIMAL
 , "DT_REF            " POSITION(00343:00352) DATE EXTERNAL
                          NULLIF(00342)=X'FF'
 , "DT_AJU            " POSITION(00353:00362) DATE EXTERNAL
 , "HR_AJU            " POSITION(00363:00370) TIME EXTERNAL
 , "TP_PROCE_REG      " POSITION(00371:00371) DECIMAL
 , "NI_PED            " POSITION(00372:00375) DECIMAL
 , "NI_SKU            " POSITION(00376:00380) DECIMAL
 , "CD_FL_DEST        " POSITION(00382:00384) DECIMAL
                          NULLIF(00381)=X'FF'
 , "CD_TIP_ETQ_DEST   " POSITION(00386:00387) DECIMAL
                          NULLIF(00385)=X'FF'
 , "CD_FL_ARM_DEST    " POSITION(00389:00391) DECIMAL
                          NULLIF(00388)=X'FF'
 , "CD_ORI_TRN        " POSITION(00393:00395) CHAR(003)
                          NULLIF(00392)=X'FF'
 , "CD_SIT_ETQ_DTN    " POSITION(00396:00397) DECIMAL
 , "CD_PAIS           " POSITION(00398:00399) CHAR(002)
 )