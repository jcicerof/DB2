SELECT DISTINCT                                                         00000120
'DROP TABLESPACE '||STRIP(T.DBNAME)||'.'||STRIP(T.TSNAME)||             00000221
'; -- '||STRIP(T.CREATOR)||'.'||STRIP(T.NAME)                           00000320
  FROM SYSIBM.SYSTABLES T                                               00000420
 WHERE T.TYPE = 'T'                                                     00000520
   AND T.CREATOR IN ('DB2PRVT','DB2PRV2')                               00000620
   AND T.NAME IN (                                                      00000720
      'CLIENT_ADDRESS'                                                  00000820
     ,'CLIENT_ADDRESS_V'                                                00000920
     ,'CLIENT_BILLING'                                                  00001020
     ,'CLIENT_CLAIM'                                                    00001120
     ,'CLIENT_CROSS_REF'                                                00001220
     ,'CLIENT_HELP'                                                     00001320
     ,'CLIENT_KEYS'                                                     00001420
     ,'CLIENT_LICENSE'                                                  00001520
     ,'CLIENT_MENU'                                                     00001620
     ,'CLIENT_PHONE'                                                    00001720
     ,'CLIENT_POLICY'                                                   00001820
     ,'CLIENT_POLICY_V'                                                 00001920
     ,'CLIENT_SUMMARY'                                                  00002020
     ,'CLIENT_TAB'                                                      00002120
     ,'CLIENT_TAB_V'                                                    00002220
     ,'CLIENT_TAX'                                                      00002320
     ,'CLIENT_UCT'                                                      00002420
     ,'CLT_ADD_ADR_TEXT'                                                00002520
     ,'CLT_ADD_NAME_TEXT'                                               00002620
     ,'CLT_ADR_RELATION'                                                00002720
     ,'CLT_ADR_RELATION_V'                                              00002820
     ,'CLT_ADR_SEARCH'                                                  00002920
     ,'CLT_CLT_RELATION'                                                00003020
     ,'CLT_CLT_VLD_REL'                                                 00003120
     ,'CLT_CONTACT_INFO'                                                00003220
     ,'CLT_OBJ_RELATION'                                                00003320
     ,'CLT_OBJ_RELATION_V'                                              00003420
     ,'CLT_OTHER_OBJECTS'                                               00003520
     ,'CLT_OWNING_SYSTE_V'                                              00003620
     ,'CLT_OWNING_SYSTEM'                                               00003720
     ,'CLT_REF_RELATION'                                                00003820
     ,'CLT_TABLE_ID_GEN'                                                00003920
     ,'CLT_TEMPLATE'                                                    00004020
     ,'CDI_DB_DUNBRAD'                                                  00004120
     ,'CDI_PA_PARR'                                                     00004220
     ,'CDI_SN_DBSCRUB'                                                  00004320
     ,'CLT_TABLE_ID_GEN'                                                00004420
     ,'CLT_ADD_ADR_TEXT'                                                00004520
     ,'CLT_ADD_NAME_TEXT'                                               00004620
     ,'CLT_ADR_RELATION'                                                00004720
     ,'BUSINESS_CLIENT'                                                 00004820
     ,'CLIENT_ADDRESS'                                                  00004920
     ,'CLIENT_BILLING'                                                  00005020
     ,'CLT_CONTACT_INFO'                                                00005120
     ,'CLIENT_TAB'                                                      00005220
     ,'CLIENT_CLAIM'                                                    00005320
     ,'CLT_CLT_RELATION'                                                00005420
     ,'HOUSEHOLD_CLIENT'                                                00005520
     ,'INDIVIDUAL_CLIENT'                                               00005620
     ,'CLT_OTHER_OBJECTS'                                               00005720
     ,'CLT_OBJ_RELATION'                                                00005820
     ,'CLIENT_POLICY'                                                   00005920
     ,'CLT_ADR_SEARCH'                                                  00006020
     ,'CLFT_POLICY_TERM')                                               00006120
;                                                                       00006220
FIM;                                                                    00006320
SELECT DISTINCT 'FREE PACKAGE ('||STRIP(COLLID)||'.'||STRIP(NAME)||')'  00006413
  FROM SYSIBM.SYSPACKAGE                                                00006513
 WHERE OWNER = 'DB2PRVT'                                                00006616
   AND NAME IN (                                                        00006713
       'CDITADRN'                                                       00006813
      ,'CDITASEQ'                                                       00006913
      ,'CDITBPTI'                                                       00007013
      ,'CDITBPTU'                                                       00007113
      ,'CDITFFID'                                                       00007213
      ,'CDITGNAC'                                                       00007313
      ,'CDITGNCU'                                                       00007413
      ,'CDITLEGL'                                                       00007513
      ,'CDITNCHA'                                                       00007613
      ,'CDITNCHG'                                                       00007713
      ,'CDITNEOT'                                                       00007813
      ,'CDITNSRT'                                                       00007913
      ,'CDITPROD'                                                       00008013
      ,'CDITREAD'                                                       00008113
      ,'CDITREF'                                                        00008213
      ,'CDITREOD'                                                       00008313
      ,'CDITREOP'                                                       00008413
      ,'CDITRESP'                                                       00008513
      ,'CDITSABS'                                                       00008613
      ,'CDITSEOH'                                                       00008713
      ,'CDITSRCH'                                                       00008813
      ,'CDITUEOT'                                                       00008913
      ,'CDITUPDT'                                                       00009013
      ,'CDITSEOH'                                                       00009113
      ,'CDITADRN'                                                       00009213
      ,'CDITASEQ'                                                       00009313
      ,'CDITBPTI'                                                       00009413
      ,'CDITBPTU'                                                       00009513
      ,'CDITFFID'                                                       00009613
      ,'CDITGNAC'                                                       00009713
      ,'CDITGNCU'                                                       00009813
      ,'CDITLEGL'                                                       00009913
      ,'CDITNCHA'                                                       00010013
      ,'CDITNCHG'                                                       00010113
      ,'CDITNEOT'                                                       00010213
      ,'CDITNSRT'                                                       00010313
      ,'CDITPROD'                                                       00010413
      ,'CDITREAD'                                                       00010513
      ,'CDITREF'                                                        00010613
      ,'CDITREOD'                                                       00010713
      ,'CDITREOP'                                                       00010813
      ,'CDITRESP'                                                       00010913
      ,'CDITSABS'                                                       00011013
      ,'CDITSEOH'                                                       00011113
      ,'CDITSRCH'                                                       00011213
      ,'CDITUEOT'                                                       00011313
      ,'CDITUPDT')                                                      00011413
UNION ALL                                                               00011519
SELECT DISTINCT 'FREE PACKAGE ('||STRIP(COLLID)||'.'||STRIP(NAME)||')'  00011617
  FROM SYSIBM.SYSPACKAGE                                                00011717
 WHERE OWNER = 'DB2PRV2'                                                00011817
   AND NAME IN (                                                        00011917
       'CDITADRN'                                                       00012017
      ,'CDITASEQ'                                                       00012117
      ,'CDITBPTI'                                                       00012217
      ,'CDITBPTU'                                                       00012317
      ,'CDITFFID'                                                       00012417
      ,'CDITGNAC'                                                       00012517
      ,'CDITGNCU'                                                       00012617
      ,'CDITLEGL'                                                       00012717
      ,'CDITNCHA'                                                       00012817
      ,'CDITNCHG'                                                       00012917
      ,'CDITNEOT'                                                       00013017
      ,'CDITNSRT'                                                       00013117
      ,'CDITPOLI'                                                       00013217
      ,'CDITPROD'                                                       00013317
      ,'CDITREAD'                                                       00013417
      ,'CDITREF'                                                        00013517
      ,'CDITREOD'                                                       00013617
      ,'CDITREOP'                                                       00013717
      ,'CDITRESP'                                                       00013817
      ,'CDITSABS'                                                       00013917
      ,'CDITSDBS'                                                       00014017
      ,'CDITSEOH'                                                       00014117
      ,'CDITSRCH'                                                       00014217
      ,'CDITUEOT'                                                       00014317
      ,'CDITUPDT'                                                       00014417
      ,'CDITADRN'                                                       00014517
      ,'CDITASEQ'                                                       00014617
      ,'CDITBPTI'                                                       00014717
      ,'CDITBPTU'                                                       00014817
      ,'CDITFFID'                                                       00014917
      ,'CDITGNAC'                                                       00015017
      ,'CDITGNCU'                                                       00015117
      ,'CDITLEGL'                                                       00015217
      ,'CDITNCHA'                                                       00015317
      ,'CDITNCHG'                                                       00015417
      ,'CDITNSRT'                                                       00015517
      ,'CDITPROD'                                                       00015617
      ,'CDITREAD'                                                       00015717
      ,'CDITREF'                                                        00015817
      ,'CDITRESP'                                                       00015917
      ,'CDITSABS'                                                       00016017
      ,'CDITSRCH'                                                       00016117
      ,'CDITUPDT')                                                      00016217
;                                                                       00016317
FIM;                                                                    00016417
SELECT DISTINCT 'FREE PLAN ('||STRIP(NAME)||')'                         00016517
  FROM SYSIBM.SYSPLAN                                                   00016617
WHERE CREATOR = 'DB2PRVT'                                               00016717
  AND NAME IN (                                                         00016817
     'CD5BMARA'                                                         00016917
    ,'CD5BMARB'                                                         00017017
    ,'CD5BMARI'                                                         00017117
    ,'CDIBMARA'                                                         00017217
    ,'CDIBMARB'                                                         00017317
    ,'CDIBMARI')                                                        00017417
UNION ALL                                                               00017517
SELECT DISTINCT 'FREE PLAN ('||STRIP(NAME)||')'                         00017617
  FROM SYSIBM.SYSPLAN                                                   00017717
WHERE CREATOR = 'DB2PRV2'                                               00017817
  AND NAME IN (                                                         00017917
     'CD2BMARB'                                                         00018017
    ,'CD2BMARI'                                                         00018117
    ,'CD6BMARB'                                                         00018217
    ,'CD6BMARI')                                                        00018317
;                                                                       00018417
FIM;                                                                    00019017
--DB='DQST0B00', TS='SCCS0B00';                                         00023917
SELECT 'DB='||''''||                                                    00024017
       STRIP(T.DBNAME)||''''||', TS='||''''||                           00024117
       STRIP(T.TSNAME)||''''||';'                                       00024217
  FROM SYSIBM.SYSTABLES T,                                              00024317
       SYSIBM.SYSTABLESPACE S                                           00024417
 WHERE T.DBNAME = S.DBNAME                                              00024517
   AND T.TSNAME = S.NAME                                                00024617
   AND T.TYPE = 'T'                                                     00024717
   AND T.CREATOR IN ('DB2PRVT','DB2PRV2')                               00024817
   AND T.NAME IN (                                                      00024917
      'CLIENT_ADDRESS'                                                  00025017
     ,'CLIENT_ADDRESS_V'                                                00025117
     ,'CLIENT_BILLING'                                                  00025217
     ,'CLIENT_CLAIM'                                                    00025317
     ,'CLIENT_CROSS_REF'                                                00025417
     ,'CLIENT_HELP'                                                     00025517
     ,'CLIENT_KEYS'                                                     00025617
     ,'CLIENT_LICENSE'                                                  00025717
     ,'CLIENT_MENU'                                                     00025817
     ,'CLIENT_PHONE'                                                    00025917
     ,'CLIENT_POLICY'                                                   00026017
     ,'CLIENT_POLICY_V'                                                 00026117
     ,'CLIENT_SUMMARY'                                                  00026217
     ,'CLIENT_TAB'                                                      00026317
     ,'CLIENT_TAB_V'                                                    00026417
     ,'CLIENT_TAX'                                                      00026517
     ,'CLIENT_UCT'                                                      00026617
     ,'CLT_ADD_ADR_TEXT'                                                00026717
     ,'CLT_ADD_NAME_TEXT'                                               00026817
     ,'CLT_ADR_RELATION'                                                00026917
     ,'CLT_ADR_RELATION_V'                                              00027017
     ,'CLT_ADR_SEARCH'                                                  00027117
     ,'CLT_CLT_RELATION'                                                00027217
     ,'CLT_CLT_VLD_REL'                                                 00027317
     ,'CLT_CONTACT_INFO'                                                00027417
     ,'CLT_OBJ_RELATION'                                                00027517
     ,'CLT_OBJ_RELATION_V'                                              00027617
     ,'CLT_OTHER_OBJECTS'                                               00027717
     ,'CLT_OWNING_SYSTE_V'                                              00027817
     ,'CLT_OWNING_SYSTEM'                                               00027917
     ,'CLT_REF_RELATION'                                                00028017
     ,'CLT_TABLE_ID_GEN'                                                00028117
     ,'CLT_TEMPLATE'                                                    00028217
     ,'CDI_DB_DUNBRAD'                                                  00028317
     ,'CDI_PA_PARR'                                                     00028417
     ,'CDI_SN_DBSCRUB'                                                  00028517
     ,'CLT_TABLE_ID_GEN'                                                00028617
     ,'CLT_ADD_ADR_TEXT'                                                00028717
     ,'CLT_ADD_NAME_TEXT'                                               00028817
     ,'CLT_ADR_RELATION'                                                00028917
     ,'BUSINESS_CLIENT'                                                 00029017
     ,'CLIENT_ADDRESS'                                                  00029117
     ,'CLIENT_BILLING'                                                  00029217
     ,'CLT_CONTACT_INFO'                                                00029317
     ,'CLIENT_TAB'                                                      00029417
     ,'CLIENT_CLAIM'                                                    00029517
     ,'CLT_CLT_RELATION'                                                00029617
     ,'HOUSEHOLD_CLIENT'                                                00029717
     ,'INDIVIDUAL_CLIENT'                                               00029817
     ,'CLT_OTHER_OBJECTS'                                               00029917
     ,'CLT_OBJ_RELATION'                                                00030017
     ,'CLIENT_POLICY'                                                   00030117
     ,'CLT_ADR_SEARCH'                                                  00030217
     ,'CLFT_POLICY_TERM');                                              00030317
FIM;                                                                    00030417
SELECT DISTINCT 'INCLUDE TABLESPACE '||                                 00030517
       STRIP(T.DBNAME)||'.'||STRIP(T.TSNAME)||                          00030617
' -- '||STRIP(T.CREATOR)||'.'||STRIP(T.NAME),                           00030717
S.NTABLES                                                               00030817
  FROM SYSIBM.SYSTABLES T,                                              00030917
       SYSIBM.SYSTABLESPACE S                                           00031017
 WHERE T.DBNAME = S.DBNAME                                              00031117
   AND T.TSNAME = S.NAME                                                00031217
   AND T.TYPE = 'T'                                                     00031317
   AND T.CREATOR IN ('DB2PRVT','DB2PRV2')                               00031417
   AND T.NAME IN (                                                      00031517
      'CLIENT_ADDRESS'                                                  00031617
     ,'CLIENT_ADDRESS_V'                                                00031717
     ,'CLIENT_BILLING'                                                  00031817
     ,'CLIENT_CLAIM'                                                    00031917
     ,'CLIENT_CROSS_REF'                                                00032017
     ,'CLIENT_HELP'                                                     00032117
     ,'CLIENT_KEYS'                                                     00032217
     ,'CLIENT_LICENSE'                                                  00032317
     ,'CLIENT_MENU'                                                     00032417
     ,'CLIENT_PHONE'                                                    00032517
     ,'CLIENT_POLICY'                                                   00032617
     ,'CLIENT_POLICY_V'                                                 00032717
     ,'CLIENT_SUMMARY'                                                  00032817
     ,'CLIENT_TAB'                                                      00032917
     ,'CLIENT_TAB_V'                                                    00033017
     ,'CLIENT_TAX'                                                      00033117
     ,'CLIENT_UCT'                                                      00033217
     ,'CLT_ADD_ADR_TEXT'                                                00033317
     ,'CLT_ADD_NAME_TEXT'                                               00033417
     ,'CLT_ADR_RELATION'                                                00033517
     ,'CLT_ADR_RELATION_V'                                              00033617
     ,'CLT_ADR_SEARCH'                                                  00033717
     ,'CLT_CLT_RELATION'                                                00033817
     ,'CLT_CLT_VLD_REL'                                                 00033917
     ,'CLT_CONTACT_INFO'                                                00034017
     ,'CLT_OBJ_RELATION'                                                00034117
     ,'CLT_OBJ_RELATION_V'                                              00034217
     ,'CLT_OTHER_OBJECTS'                                               00034317
     ,'CLT_OWNING_SYSTE_V'                                              00034417
     ,'CLT_OWNING_SYSTEM'                                               00034517
     ,'CLT_REF_RELATION'                                                00034617
     ,'CLT_TABLE_ID_GEN'                                                00034717
     ,'CLT_TEMPLATE'                                                    00034817
     ,'CDI_DB_DUNBRAD'                                                  00034917
     ,'CDI_PA_PARR'                                                     00035017
     ,'CDI_SN_DBSCRUB'                                                  00035117
     ,'CLT_TABLE_ID_GEN'                                                00035217
     ,'CLT_ADD_ADR_TEXT'                                                00035317
     ,'CLT_ADD_NAME_TEXT'                                               00035417
     ,'CLT_ADR_RELATION'                                                00035517
     ,'BUSINESS_CLIENT'                                                 00035617
     ,'CLIENT_ADDRESS'                                                  00035717
     ,'CLIENT_BILLING'                                                  00035817
     ,'CLT_CONTACT_INFO'                                                00035917
     ,'CLIENT_TAB'                                                      00036017
     ,'CLIENT_CLAIM'                                                    00036117
     ,'CLT_CLT_RELATION'                                                00036217
     ,'HOUSEHOLD_CLIENT'                                                00036317
     ,'INDIVIDUAL_CLIENT'                                               00036417
     ,'CLT_OTHER_OBJECTS'                                               00036517
     ,'CLT_OBJ_RELATION'                                                00036617
     ,'CLIENT_POLICY'                                                   00036717
     ,'CLT_ADR_SEARCH'                                                  00036817
     ,'CLFT_POLICY_TERM')                                               00036917
;                                                                       00037017
FIM;                                                                    00040017
