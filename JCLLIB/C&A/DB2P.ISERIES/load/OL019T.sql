LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."OL019T_ROM_EBRQ   "
 ( "NI_ROM_EBRQ_OPD   " POSITION(00007:00010) INTEGER
 , "CD_OPD_LGS        " POSITION(00011:00013) DECIMAL
 , "DT_GER_ROM_EBRQ   " POSITION(00014:00023) DATE EXTERNAL
 , "HR_GER_ROM_EBRQ   " POSITION(00024:00031) TIME EXTERNAL
 , "CD_USR_GER_ROM_OPD" POSITION(00032:00039) CHAR(008)
 , "CD_SIT_ROM_EBRQ   " POSITION(00040:00041) SMALLINT
 , "DT_SAI_CGM        " POSITION(00042:00051) DATE EXTERNAL
 , "HR_SAI_CGM        " POSITION(00052:00059) TIME EXTERNAL
 , "NU_PLA_CMN        " POSITION(00060:00066) CHAR(007)
 , "NU_LAC_CMN        " POSITION(00067:00070) INTEGER
 , "NO_MTR_CMN        " POSITION(00071:00110) CHAR(040)
 )
