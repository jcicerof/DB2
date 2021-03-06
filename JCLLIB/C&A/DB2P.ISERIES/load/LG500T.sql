LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG500T_AJT_SLD_GNL"
 ( "NI_PED            " POSITION(00007:00010) DECIMAL
 , "NU_REC_PED        " POSITION(00011:00012) DECIMAL
 , "NI_PL             " POSITION(00013:00017) DECIMAL
 , "CD_PCS_ORI        " POSITION(00018:00019) DECIMAL
 , "CD_ATVD_ORI       " POSITION(00020:00021) DECIMAL
 , "NU_OCO_AJT_SLD_GNL" POSITION(00022:00023) SMALLINT
 , "TS_AJT_SLD_GNL    " POSITION(00024:00049) TIMESTAMP EXTERNAL
 , "QT_PCA_AJT_SLD_GNL" POSITION(00050:00053) INTEGER
 , "CD_FL             " POSITION(00054:00056) DECIMAL
 , "NI_TUR_TRA        " POSITION(00057:00058) DECIMAL
 , "CD_MDLD_ACDM_REC  " POSITION(00059:00059) CHAR(001)
 , "CD_MDLD_ACDM_DIS  " POSITION(00060:00060) CHAR(001)
 , "CD_USR            " POSITION(00061:00068) CHAR(008)
 , "CD_PCS_DTN        " POSITION(00070:00071) DECIMAL
                          NULLIF(00069)=X'FF'
 , "CD_ATVD_DTN       " POSITION(00073:00074) DECIMAL
                          NULLIF(00072)=X'FF'
 , "DT_ATLZ_SLD_GNL   " POSITION(00076:00085) DATE EXTERNAL
                          NULLIF(00075)=X'FF'
 , "QT_PCA_AJT_PCS_DTN" POSITION(00087:00092) DECIMAL
                          NULLIF(00086)=X'FF'
 , "IN_EXG_DAD        " POSITION(00093:00093) CHAR(001)
 )
