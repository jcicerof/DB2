LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."PF022T_TIP_PED    "
 ( "CD_TIP_PED        " POSITION(00007:00008) DECIMAL
 , "DS_TIP_PED_PRG    " POSITION(00009:00068) CHAR(060)
 , "DS_TIP_PED_SPH    " POSITION(00069:00128) CHAR(060)
 , "DS_TIP_PED_IGL    " POSITION(00129:00188) CHAR(060)
 )
