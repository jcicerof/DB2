LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG547T_DVG_RECU   "
 ( "NI_PED            " POSITION(00007:00010) DECIMAL
 , "CD_TIP_DVG_REC    " POSITION(00011:00012) DECIMAL
 , "DT_RECU_PED       " POSITION(00013:00022) DATE EXTERNAL
 , "HR_RECU_PED       " POSITION(00023:00030) TIME EXTERNAL
 , "DS_CPL_DVG_REC_PED" POSITION(00032:00287) VARCHAR
                          NULLIF(00031)=X'FF'
 , "IN_EXG_DAD        " POSITION(00288:00288) CHAR(001)
 )
