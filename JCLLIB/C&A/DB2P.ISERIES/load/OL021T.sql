LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."OL021T_GRU_SOL_RTD"
 ( "NI_GRU_SOL_RTD    " POSITION(00007:00010) INTEGER
 , "DT_GRU_SOL_RTD    " POSITION(00011:00020) DATE EXTERNAL
 , "HR_GRU_SOL_RTD    " POSITION(00021:00028) TIME EXTERNAL
 , "CD_SIT_GRU_SOL_RTD" POSITION(00029:00030) SMALLINT
 , "CD_OPD_LGS        " POSITION(00031:00033) DECIMAL
 , "CD_USR            " POSITION(00034:00041) CHAR(008)
 )