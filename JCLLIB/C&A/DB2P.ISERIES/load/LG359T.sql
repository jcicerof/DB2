LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND
     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL
     ENFORCE NO
 EBCDIC CCSID(00037,00000,00000)
 INTO TABLE "PROD"."LG359T_CTR_TRS_ART"
 ( "NI_DOC_FIS        " POSITION(00007:00011) DECIMAL
 , "CD_FL             " POSITION(00012:00014) DECIMAL
 , "IN_TRS_LOJ        " POSITION(00015:00015) CHAR(001)
 , "IN_DTN_ETQ        " POSITION(00016:00016) CHAR(001)
 , "CD_FL_DTN         " POSITION(00017:00019) DECIMAL
 , "DT_MOV_TRS        " POSITION(00020:00029) DATE EXTERNAL
 , "IN_CGM_PRD        " POSITION(00030:00030) CHAR(001)
 )