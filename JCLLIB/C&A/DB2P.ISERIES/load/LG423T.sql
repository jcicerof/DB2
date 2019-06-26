LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG423T_PACKL      "
 ( "NU_PACKL          " POSITION(00007:00011) DECIMAL
 , "NI_PED            " POSITION(00012:00015) DECIMAL
 , "NU_REC_PED        " POSITION(00016:00017) DECIMAL
 , "NU_SEQ_ORD_PACKL  " POSITION(00018:00021) INTEGER
 , "DT_VGM            " POSITION(00023:00032) DATE EXTERNAL
                          NULLIF(00022)=X'FF'
 , "NU_VGM            " POSITION(00034:00037) INTEGER
                          NULLIF(00033)=X'FF'
 , "NU_CGM            " POSITION(00039:00040) DECIMAL
                          NULLIF(00038)=X'FF'
 , "CD_SIT_CGM        " POSITION(00041:00041) CHAR(001)
 , "NU_SCL_VGM        " POSITION(00043:00044) SMALLINT
                          NULLIF(00042)=X'FF'
 , "CD_EQP            " POSITION(00046:00049) INTEGER
                          NULLIF(00045)=X'FF'
 , "CD_PACK_REC       " POSITION(00051:00051) CHAR(001)
                          NULLIF(00050)=X'FF'
 , "NU_PACK_REC       " POSITION(00053:00055) DECIMAL
                          NULLIF(00052)=X'FF'
 , "QT_PCA_PACKL      " POSITION(00057:00061) DECIMAL
                          NULLIF(00056)=X'FF'
 , "QT_PESO_LIQ_PACKL " POSITION(00063:00067) DECIMAL
                          NULLIF(00062)=X'FF'
 , "QT_PESO_BRU_PACKL " POSITION(00069:00073) DECIMAL
                          NULLIF(00068)=X'FF'
 , "QT_CUB_PACKL      " POSITION(00075:00079) DECIMAL
                          NULLIF(00074)=X'FF'
 , "IN_DMB_PED        " POSITION(00080:00080) CHAR(001)
 , "IN_EBRQ_PED_PACKL " POSITION(00081:00081) CHAR(001)
 , "CD_FL_DTN_PACKL   " POSITION(00083:00085) DECIMAL
                          NULLIF(00082)=X'FF'
 , "NU_FAC            " POSITION(00087:00093) DECIMAL
                          NULLIF(00086)=X'FF'
 , "IN_EXG_DAD        " POSITION(00094:00094) CHAR(001)
 )