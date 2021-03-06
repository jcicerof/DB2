LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."AT024T_CTR_GER_ARQ"
 ( "CD_ARQ            " POSITION(00007:00008) SMALLINT
 , "NO_ARQ            " POSITION(00009:00016) CHAR(008)
 , "TX_DS_ARQ         " POSITION(00017:00036) CHAR(020)
 , "NU_SEQ_ARQ        " POSITION(00038:00041) INTEGER
                          NULLIF(00037)=X'FF'
 , "DT_GER_ARQ        " POSITION(00042:00051) DATE EXTERNAL
 , "HR_GER_ARQ        " POSITION(00052:00059) TIME EXTERNAL
 )
