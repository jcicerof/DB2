LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PA027T_ITV_PROM   "
 ( "NI_PROM           " POSITION(00007:00010) DECIMAL
 , "DT_INI_PROM       " POSITION(00011:00020) DATE EXTERNAL
 , "HR_INI_PROM       " POSITION(00021:00028) TIME EXTERNAL
 , "HR_FIM_PROM       " POSITION(00029:00036) TIME EXTERNAL
 )