LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG531T_FLX_PDR    "
 ( "CD_FLX            " POSITION(00007:00008) DECIMAL
 , "DS_FLX_PRG        " POSITION(00009:00048) CHAR(040)
 , "DS_FLX_SPH        " POSITION(00049:00088) CHAR(040)
 , "DS_FLX_IGL        " POSITION(00089:00128) CHAR(040)
 , "IN_FLX_PDR_REC    " POSITION(00129:00129) CHAR(001)
 , "IN_FLX_PDR_QLD    " POSITION(00130:00130) CHAR(001)
 , "IN_FLX_PDR_PCST   " POSITION(00131:00131) CHAR(001)
 , "IN_FLX_PDR_DIS    " POSITION(00132:00132) CHAR(001)
 , "IN_FLX_PDR_EXP    " POSITION(00133:00133) CHAR(001)
 , "QT_MTA_REC_FLX    " POSITION(00135:00137) DECIMAL
                          NULLIF(00134)=X'FF'
 )
