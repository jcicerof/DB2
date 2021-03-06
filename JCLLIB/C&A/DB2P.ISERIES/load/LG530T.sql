LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG530T_CTR_CFC_PED"
 ( "NI_PED            " POSITION(00007:00010) DECIMAL
 , "NU_REC_PED        " POSITION(00011:00012) DECIMAL
 , "CD_FL             " POSITION(00013:00015) DECIMAL
 , "CD_TIP_CTR_CFC_PED" POSITION(00016:00017) SMALLINT
 , "CD_USR            " POSITION(00018:00025) CHAR(008)
 , "TS_INI_CFC_PED    " POSITION(00026:00051) TIMESTAMP EXTERNAL
 , "TS_FIM_CFC_PED    " POSITION(00053:00078) TIMESTAMP EXTERNAL
                          NULLIF(00052)=X'FF'
 , "IN_EXG_DAD        " POSITION(00079:00079) CHAR(001)
 )
