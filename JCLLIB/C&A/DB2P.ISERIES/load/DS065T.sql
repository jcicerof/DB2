LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."DS065T_CMS_RCG    "
 ( "CD_FL             " POSITION(00007:00009) DECIMAL
 , "CD_FOR            " POSITION(00010:00015) CHAR(006)
 , "NI_OPD_CEL        " POSITION(00016:00017) SMALLINT
 , "DT_VEN_RCG        " POSITION(00018:00027) DATE EXTERNAL
 , "DT_PAG_FOR_RCG    " POSITION(00028:00037) DATE EXTERNAL
 , "NO_ARQ_CONC       " POSITION(00038:00047) CHAR(010)
 , "VL_BRU_VEN_RCG    " POSITION(00049:00057) DECIMAL
                          NULLIF(00048)=X'FF'
 , "VL_CMS_VEN_RCG    " POSITION(00059:00067) DECIMAL
                          NULLIF(00058)=X'FF'
 , "DT_PCST_VEN_RCG   " POSITION(00069:00078) DATE EXTERNAL
                          NULLIF(00068)=X'FF'
 , "IN_GER_NF_RCG     " POSITION(00079:00079) CHAR(001)
 )
