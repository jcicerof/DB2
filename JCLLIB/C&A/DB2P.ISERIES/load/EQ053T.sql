LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."EQ053T_SOL_CLT    "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "NU_SOL_CLT        " POSITION(00010:00013) INTEGER
 , "NU_ORD_LTR_CLT    " POSITION(00014:00015) SMALLINT
 , "NI_PED            " POSITION(00017:00021) DECIMAL
                          NULLIF(00016)=X'FF'
 , "NI_SKU            " POSITION(00023:00027) DECIMAL
                          NULLIF(00022)=X'FF'
 , "CD_PED_LGD        " POSITION(00029:00037) CHAR(009)
                          NULLIF(00028)=X'FF'
 , "CD_POS_TAM        " POSITION(00039:00039) DECIMAL
                          NULLIF(00038)=X'FF'
 , "CD_POS_COR        " POSITION(00041:00041) DECIMAL
                          NULLIF(00040)=X'FF'
 , "CD_MOV_ETQ        " POSITION(00043:00044) DECIMAL
                          NULLIF(00042)=X'FF'
 , "CD_SIT_SOL        " POSITION(00046:00047) DECIMAL
                          NULLIF(00045)=X'FF'
 , "DT_ATLZ_SOL_CLT   " POSITION(00049:00058) DATE EXTERNAL
                          NULLIF(00048)=X'FF'
 , "HR_ATLZ_SOL_CLT   " POSITION(00060:00067) TIME EXTERNAL
                          NULLIF(00059)=X'FF'
 , "QT_PCA_ATDT       " POSITION(00069:00072) INTEGER
                          NULLIF(00068)=X'FF'
 , "VL_PRC_UNI_CCR    " POSITION(00074:00080) DECIMAL
                          NULLIF(00073)=X'FF'
 , "CD_USR            " POSITION(00082:00089) CHAR(008)
                          NULLIF(00081)=X'FF'
 , "NI_SOL            " POSITION(00091:00096) DECIMAL
                          NULLIF(00090)=X'FF'
 , "NO_USR_CLT        " POSITION(00098:00139) VARCHAR
                          NULLIF(00097)=X'FF'
 , "CD_MOV_RIS        " POSITION(00141:00141) CHAR(001)
                          NULLIF(00140)=X'FF'
 , "CD_REF_PRC_PED    " POSITION(00143:00144) SMALLINT
                          NULLIF(00142)=X'FF'
 , "VL_REF_PRC_PED    " POSITION(00146:00154) DECIMAL
                          NULLIF(00145)=X'FF'
 , "NI_MDL            " POSITION(00156:00159) DECIMAL
                          NULLIF(00155)=X'FF'
 , "CD_SIS            " POSITION(00161:00163) CHAR(003)
                          NULLIF(00160)=X'FF'
 , "CD_MSG            " POSITION(00165:00166) DECIMAL
                          NULLIF(00164)=X'FF'
 , "NU_SER_CEL        " POSITION(00168:00187) CHAR(020)
                          NULLIF(00167)=X'FF'
 )
