LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."SA000T_TIP_FRM_AVL"
 ( "NI_TIP_FRM_AVL    " POSITION(00007:00008) SMALLINT
 , "NO_TIP_FRM_AVL_PTG" POSITION(00009:00108) CHAR(100)
 , "NO_TIP_FRM_AVL_SPH" POSITION(00109:00208) CHAR(100)
 , "NO_TIP_FRM_AVL_IGL" POSITION(00209:00308) CHAR(100)
 )
