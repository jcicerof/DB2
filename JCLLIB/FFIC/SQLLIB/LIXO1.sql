--SELECT A.TCREATOR, A.TTNAME, B.DBNAME,                                00010028
--       A.GRANTEE,A.ALTERAUTH, A.DELETEAUTH,A.INDEXAUTH,               00010128
--       A.INSERTAUTH,A.SELECTAUTH,A.UPDATEAUTH,                        00010228
--       A.REFERENCESAUTH, A.TRIGGERAUTH                                00010328
SELECT DISTINCT                                                         00010528
       ' REVOKE SELECT ON TABLE '||                                     00010628
       STRIP(A.TCREATOR)||'.'||STRIP(A.TTNAME)||                        00010728
       ' FROM '||STRIP(GRANTEE)||' BY ALL;'                             00010828
  FROM SYSIBM.SYSTABAUTH A                                              00011016
     , SYSIBM.SYSTABLES B                                               00012016
 WHERE A.GRANTEE LIKE 'PUBLIC%'                                         00020127
   AND B.DBNAME = 'DUBS0P00'                                            00021016
   AND A.TCREATOR = B.CREATOR                                           00022016
   AND A.TTNAME   = B.NAME                                              00023016
   AND A.TTNAME IN ( 'UBST_HDR_DATA')                                   00027027
;                                                                       00040016
FIM;                                                                    00041018
SELECT DISTINCT                                                         00041127
       ' REVOKE ALTER ON TABLE '||                                      00041227
       STRIP(A.TCREATOR)||'.'||STRIP(A.TTNAME)||                        00041327
       ' FROM '||STRIP(GRANTEE)||' BY ALL;'                             00041427
  FROM SYSIBM.SYSTABAUTH A                                              00041527
     , SYSIBM.SYSTABLES B                                               00041627
 WHERE A.GRANTEE IN ('ZZUBSAP')                                         00041727
   AND B.DBNAME = 'DUBS0P00'                                            00041827
   AND A.TCREATOR = B.CREATOR                                           00041927
   AND A.TTNAME   = B.NAME                                              00042027
   AND A.ALTERAUTH = 'Y'                                                00042127
UNION ALL                                                               00042227
SELECT DISTINCT                                                         00042327
       ' REVOKE INDEX ON TABLE '||                                      00042427
       STRIP(A.TCREATOR)||'.'||STRIP(A.TTNAME)||                        00042527
       ' FROM '||STRIP(GRANTEE)||' BY ALL;'                             00042627
  FROM SYSIBM.SYSTABAUTH A                                              00042727
     , SYSIBM.SYSTABLES B                                               00042827
 WHERE A.GRANTEE IN ('ZZUBSAP')                                         00042927
   AND B.DBNAME = 'DUBS0P00'                                            00043027
   AND A.TCREATOR = B.CREATOR                                           00043127
   AND A.TTNAME   = B.NAME                                              00043227
   AND A.INDEXAUTH = 'Y'                                                00043327
UNION ALL                                                               00043427
SELECT DISTINCT                                                         00043527
       ' REVOKE REFERENCES ON TABLE '||                                 00043627
       STRIP(A.TCREATOR)||'.'||STRIP(A.TTNAME)||                        00043727
       ' FROM '||STRIP(GRANTEE)||' BY ALL;'                             00043827
  FROM SYSIBM.SYSTABAUTH A                                              00043927
     , SYSIBM.SYSTABLES B                                               00044027
 WHERE A.GRANTEE IN ('ZZUBSAP')                                         00044127
   AND B.DBNAME = 'DUBS0P00'                                            00044227
   AND A.TCREATOR = B.CREATOR                                           00044327
   AND A.TTNAME   = B.NAME                                              00044427
   AND A.REFERENCESAUTH = 'Y'                                           00044527
UNION ALL                                                               00044627
SELECT DISTINCT                                                         00044727
       ' REVOKE TRIGGER ON TABLE '||                                    00044827
       STRIP(A.TCREATOR)||'.'||STRIP(A.TTNAME)||                        00044927
       ' FROM '||STRIP(GRANTEE)||' BY ALL;'                             00045027
  FROM SYSIBM.SYSTABAUTH A                                              00045127
     , SYSIBM.SYSTABLES B                                               00045227
 WHERE A.GRANTEE IN ('ZZUBSAP')                                         00045327
   AND B.DBNAME = 'DUBS0P00'                                            00045427
   AND A.TCREATOR = B.CREATOR                                           00045527
   AND A.TTNAME   = B.NAME                                              00045627
   AND A.TRIGGERAUTH = 'Y'                                              00045727
;                                                                       00045827
FIM;                                                                    00045927
   AND A.TTNAME IN (                                                    00046027
                     'UBST_COMM_PROD_CD',                               00046127
                     'UBST_ARC_TRIGGER',                                00046227
                     'UBST_ARC_TRIGGER',                                00046327
                     'UBST_COMM_PROD_CD',                               00046427
                     'UBST_BILL_STATS',                                 00046527
                     'UBST_ST_SERV_CHG',                                00046627
                     'UBST_REIN_STATS',                                 00046727
                     'UBST_INV_SUMM',                                   00046827
                     'UBST_OS_DATA',                                    00046927
                     'UBST_CPI_INTR_DATA',                              00047027
                     'UBST_CPI_INTR_DATA',                              00047127
                     'UBST_OS_DATA',                                    00047227
                     'UBST_RLSMRY_TBL')                                 00047327
;                                                                       00047427
FIM;                                                                    00047527
SELECT DISTINCT                                                         00047627
       ' REVOKE ALL PRIVILEGES ON TABLE '||                             00047727
       STRIP(A.TCREATOR)||'.'||STRIP(A.TTNAME)||                        00047827
       ' FROM '||STRIP(GRANTEE)||' BY ALL;'                             00047927
  FROM SYSIBM.SYSTABAUTH A                                              00048027
     , SYSIBM.SYSTABLES B                                               00048127
 WHERE A.GRANTEE IN ('ZZCISBP','ZZCISDB','ZZUBSDT','ZZUBSUS')           00048227
   AND B.DBNAME = 'DUBS0P00'                                            00049022
   AND A.TCREATOR = B.CREATOR                                           00049122
   AND A.TTNAME   = B.NAME                                              00049222
   AND A.TTNAME IN (                                                    00049322
                     'UBST_COMM_PROD_CD',                               00049422
                     'UBST_ARC_TRIGGER',                                00049522
                     'UBST_ARC_TRIGGER',                                00049622
                     'UBST_COMM_PROD_CD',                               00049722
                     'UBST_BILL_STATS',                                 00049822
                     'UBST_ST_SERV_CHG',                                00049922
                     'UBST_REIN_STATS',                                 00050022
                     'UBST_INV_SUMM',                                   00050122
                     'UBST_OS_DATA',                                    00050222
                     'UBST_CPI_INTR_DATA',                              00050322
                     'UBST_CPI_INTR_DATA',                              00050422
                     'UBST_OS_DATA',                                    00050522
                     'UBST_RLSMRY_TBL')                                 00050622
;                                                                       00050722
FIM;                                                                    00050822
--SELECT A.TCREATOR, A.TTNAME, B.DBNAME,                                00051022
--       A.GRANTEE,A.ALTERAUTH, A.DELETEAUTH,A.INDEXAUTH,               00060018
--       A.INSERTAUTH,A.SELECTAUTH,A.UPDATEAUTH                         00070018
--                                                                      00080018
SELECT                                                                  00090018
' REVOKE SELECT ON '||STRIP(A.TCREATOR)||'.'||STRIP(A.TTNAME)||         00100018
' FROM '||STRIP(GRANTEE)||' BY ALL;'                                    00110018
  FROM SYSIBM.SYSTABAUTH A                                              00120018
     , SYSIBM.SYSTABLES B                                               00130018
 WHERE A.GRANTEE LIKE 'PUBLIC%'                                         00140018
   AND B.DBNAME = 'DUBS0P00'                                            00150018
   AND A.TCREATOR = B.CREATOR                                           00160018
   AND A.TTNAME   = B.NAME                                              00170018
   AND A.TTNAME IN (                                                    00180018
                     'UBST_SUSP_REASON',                                00190018
                     'UBST_SUMM_ACCT_LVL',                              00200018
                     'UBST_SUMM_ITEM_LVL',                              00210018
                     'UBST_RLSMRY_TBL',                                 00220018
                     'UBST_REALIGN_TRIGS',                              00230018
                     'UBST_EDBI_ACT_STMT',                              00240018
                     'UBST_EDBI_POL_STMT',                              00250018
                     'UBST_INV_ACCT_HDR',                               00260018
                     'UBST_INV_POL_HDR',                                00270018
                     'UBST_INV_SUMM',                                   00280018
                     'UBST_INV_TRIGGER',                                00290018
                     'UBST_FUTURE_INSTAL',                              00300018
                     'UBST_ARC_TRIGGER',                                00310018
                     'UBST_NAME_ADDRESS',                               00320018
                     'UBST_P1_PENDCRDT',                                00330018
                     'UBST_CANCINFO',                                   00340018
                     'UBST_CANCNAME',                                   00350018
                     'UBST_APPLY_PAYMENT',                              00360018
                     'UBST_PRE_BIOG',                                   00370018
                     'UBST_BILL_STATS',                                 00380018
                     'UBST_COMM_DETL',                                  00390018
                     'UBST_BILLABLE_DTL',                               00400018
                     'UBST_DETL_INV_CRCL',                              00410018
                     'UBST_DETL_INV_EVNT',                              00420018
                     'UBST_DETL_PYMT',                                  00430018
                     'UBST_EARNPREM',                                   00440018
                     'UBST_DED_FRS_INTFC')                              00450018
;                                                                       00460018
