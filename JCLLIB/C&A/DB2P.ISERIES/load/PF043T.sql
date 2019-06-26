LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PF043T_FCH_RTY_PED"
 ( "CD_MRC            " POSITION(00007:00008) DECIMAL
 , "NU_CTO_RTY        " POSITION(00009:00012) DECIMAL
 , "CD_RTY            " POSITION(00013:00016) DECIMAL
 , "NI_PED            " POSITION(00017:00020) DECIMAL
 , "QT_PCA_GRD_BOA_PED" POSITION(00021:00024) INTEGER
 , "VL_PRC_COM_GRD_BOA" POSITION(00025:00033) DECIMAL
 , "NI_MDL            " POSITION(00034:00037) DECIMAL
 , "CD_FNE            " POSITION(00038:00039) DECIMAL
 , "CD_CLS            " POSITION(00040:00041) DECIMAL
 , "CD_CLS_COD        " POSITION(00042:00043) DECIMAL
 , "DT_ENT_PCST_PED   " POSITION(00044:00053) DATE EXTERNAL
 , "IN_DVL_GRD_BOA_PED" POSITION(00054:00054) CHAR(001)
 , "VL_PAG_RTY_PED    " POSITION(00055:00063) DECIMAL
 , "VL_RAT_DVG_FCH_RTY" POSITION(00065:00073) DECIMAL
                          NULLIF(00064)=X'FF'
 , "NI_DOC_FIS        " POSITION(00075:00079) DECIMAL
                          NULLIF(00074)=X'FF'
 , "VL_ICMS_PED       " POSITION(00081:00089) DECIMAL
                          NULLIF(00080)=X'FF'
 , "VL_IPI_PED        " POSITION(00091:00099) DECIMAL
                          NULLIF(00090)=X'FF'
 , "VL_IVA_PED        " POSITION(00101:00109) DECIMAL
                          NULLIF(00100)=X'FF'
 , "VL_BRU_COM_PED    " POSITION(00111:00119) DECIMAL
                          NULLIF(00110)=X'FF'
 , "VL_PIS_PED        " POSITION(00121:00129) DECIMAL
                          NULLIF(00120)=X'FF'
 , "VL_COFINS_PED     " POSITION(00131:00139) DECIMAL
                          NULLIF(00130)=X'FF'
 , "VL_TOT_LIQ_PED    " POSITION(00141:00149) DECIMAL
                          NULLIF(00140)=X'FF'
 , "VL_IR_RTY_PED     " POSITION(00151:00159) DECIMAL
                          NULLIF(00150)=X'FF'
 , "VL_CMF_PED        " POSITION(00161:00169) DECIMAL
                          NULLIF(00160)=X'FF'
 , "DT_ENT_MOV_PED    " POSITION(00171:00180) DATE EXTERNAL
                          NULLIF(00170)=X'FF'
 )
