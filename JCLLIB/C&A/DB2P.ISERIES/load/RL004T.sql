LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."RL004T_HIS_OPD_PDV"
 ( "TS_OPR            " POSITION(00007:00032) TIMESTAMP EXTERNAL
 , "CD_FL             " POSITION(00034:00036) DECIMAL
                          NULLIF(00033)=X'FF'
 , "NU_RE             " POSITION(00038:00041) INTEGER
                          NULLIF(00037)=X'FF'
 , "CD_SEQ_OPD        " POSITION(00043:00044) SMALLINT
                          NULLIF(00042)=X'FF'
 , "CD_SEN_OPD        " POSITION(00046:00049) INTEGER
                          NULLIF(00045)=X'FF'
 , "NU_PFL_ACS        " POSITION(00051:00052) SMALLINT
                          NULLIF(00050)=X'FF'
 , "CD_OPR            " POSITION(00054:00054) CHAR(001)
                          NULLIF(00053)=X'FF'
 , "CD_USR_GST        " POSITION(00056:00063) CHAR(008)
                          NULLIF(00055)=X'FF'
 , "NO_OPD_PDV        " POSITION(00065:00104) CHAR(040)
                          NULLIF(00064)=X'FF'
 )
