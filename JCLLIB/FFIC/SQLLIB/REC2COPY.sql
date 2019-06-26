SELECT '-- '||STRIP(B.CREATOR)||'.'||STRIP(B.NAME)                      00008010
    ,A.DBNAME,A.TSNAME,0                                                00008110
  FROM SYSIBM.SYSCOPY A,                                                00008210
       SYSIBM.SYSTABLES B                                               00008310
WHERE STRIP(B.CREATOR)||'.'||STRIP(B.NAME) IN (                         00008411
 'PERPROD.POLT_COVERAGE',                                               00008511
 'PERPROD.POLT_ENDORSEMENT',                                            00008611
 'PERPROD.POLT_ENDT_DESC',                                              00008711
 'PERPROD.POLT_FINANC_RESP',                                            00008811
 'PERPROD.POLT_INT_PARTY',                                              00008911
 'PERPROD.POLT_INT_PRTY_NAME',                                          00009011
 'PERPROD.POLT_JOURNAL',                                                00009111
 'PERPROD.POLT_NOTES',                                                  00009211
 'PERPROD.POLT_OOST_VIOL',                                              00009311
 'PERPROD.POLT_OPERATOR',                                               00009411
 'PERPROD.POLT_PARM',                                                   00009511
 'PERPROD.POLT_POLICY',                                                 00009611
 'PERPROD.POLT_PREMIUM',                                                00009711
 'PERPROD.POLT_PROD_TRANSFER',                                          00009811
 'PERPROD.POLT_QUALCHEK',                                               00009911
 'PERPROD.POLT_QUALCHEK_LOG',                                           00010011
 'PERPROD.POLT_SECURITY',                                               00010111
 'PERPROD.POLT_TRANSACTION',                                            00010211
 'PERPROD.POLT_VEHICLE',                                                00010311
 'PERPROD.POLT_VIOLATION'                                               00010411
      )                                                                 00010511
  AND A.ICDATE = '150308'                                               00010611
  AND B.DBNAME = A.DBNAME                                               00010710
  AND B.TSNAME = A.TSNAME                                               00010810
  AND B.TYPE = 'T'                                                      00010910
UNION                                                                   00011110
SELECT DISTINCT ' RECOVER TABLESPACE '||                                00011210
     STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME)                              00011310
    ,A.DBNAME,A.TSNAME,1                                                00011410
  FROM SYSIBM.SYSCOPY A,                                                00011510
       SYSIBM.SYSTABLES B                                               00011610
WHERE STRIP(B.CREATOR)||'.'||STRIP(B.NAME) IN (                         00011711
 'PERPROD.POLT_COVERAGE',                                               00011811
 'PERPROD.POLT_ENDORSEMENT',                                            00011911
 'PERPROD.POLT_ENDT_DESC',                                              00012011
 'PERPROD.POLT_FINANC_RESP',                                            00012111
 'PERPROD.POLT_INT_PARTY',                                              00012211
 'PERPROD.POLT_INT_PRTY_NAME',                                          00012311
 'PERPROD.POLT_JOURNAL',                                                00012411
 'PERPROD.POLT_NOTES',                                                  00012511
 'PERPROD.POLT_OOST_VIOL',                                              00012611
 'PERPROD.POLT_OPERATOR',                                               00012711
 'PERPROD.POLT_PARM',                                                   00012811
 'PERPROD.POLT_POLICY',                                                 00012911
 'PERPROD.POLT_PREMIUM',                                                00013011
 'PERPROD.POLT_PROD_TRANSFER',                                          00013111
 'PERPROD.POLT_QUALCHEK',                                               00013211
 'PERPROD.POLT_QUALCHEK_LOG',                                           00013311
 'PERPROD.POLT_SECURITY',                                               00013411
 'PERPROD.POLT_TRANSACTION',                                            00013511
 'PERPROD.POLT_VEHICLE',                                                00013611
 'PERPROD.POLT_VIOLATION'                                               00013711
      )                                                                 00013811
  AND A.ICDATE = '150308'                                               00013911
  AND B.DBNAME = A.DBNAME                                               00014110
  AND B.TSNAME = A.TSNAME                                               00014210
  AND B.TYPE = 'T'                                                      00014310
UNION                                                                   00014410
SELECT DISTINCT '   TOCOPY '||STRIP(A.DSNAME)                           00014510
    ,A.DBNAME,A.TSNAME,2                                                00014610
  FROM SYSIBM.SYSCOPY A,                                                00014710
       SYSIBM.SYSTABLES B                                               00014810
WHERE STRIP(B.CREATOR)||'.'||STRIP(B.NAME) IN (                         00014911
 'PERPROD.POLT_COVERAGE',                                               00015011
 'PERPROD.POLT_ENDORSEMENT',                                            00015111
 'PERPROD.POLT_ENDT_DESC',                                              00015211
 'PERPROD.POLT_FINANC_RESP',                                            00015311
 'PERPROD.POLT_INT_PARTY',                                              00015411
 'PERPROD.POLT_INT_PRTY_NAME',                                          00015511
 'PERPROD.POLT_JOURNAL',                                                00015611
 'PERPROD.POLT_NOTES',                                                  00015711
 'PERPROD.POLT_OOST_VIOL',                                              00015811
 'PERPROD.POLT_OPERATOR',                                               00015911
 'PERPROD.POLT_PARM',                                                   00016011
 'PERPROD.POLT_POLICY',                                                 00016111
 'PERPROD.POLT_PREMIUM',                                                00016211
 'PERPROD.POLT_PROD_TRANSFER',                                          00016311
 'PERPROD.POLT_QUALCHEK',                                               00016411
 'PERPROD.POLT_QUALCHEK_LOG',                                           00016511
 'PERPROD.POLT_SECURITY',                                               00016611
 'PERPROD.POLT_TRANSACTION',                                            00016711
 'PERPROD.POLT_VEHICLE',                                                00016811
 'PERPROD.POLT_VIOLATION'                                               00016911
      )                                                                 00017011
  AND A.ICDATE = '150308'                                               00017111
  AND B.DBNAME = A.DBNAME                                               00017310
  AND B.TSNAME = A.TSNAME                                               00017410
  AND B.TYPE = 'T'                                                      00017510
UNION                                                                   00017610
SELECT DISTINCT ' '                                                     00017710
    ,A.DBNAME,A.TSNAME,3                                                00017810
  FROM SYSIBM.SYSCOPY A,                                                00017910
       SYSIBM.SYSTABLES B                                               00018010
WHERE STRIP(B.CREATOR)||'.'||STRIP(B.NAME) IN (                         00018111
 'PERPROD.POLT_COVERAGE',                                               00018211
 'PERPROD.POLT_ENDORSEMENT',                                            00018311
 'PERPROD.POLT_ENDT_DESC',                                              00018411
 'PERPROD.POLT_FINANC_RESP',                                            00018511
 'PERPROD.POLT_INT_PARTY',                                              00018611
 'PERPROD.POLT_INT_PRTY_NAME',                                          00018711
 'PERPROD.POLT_JOURNAL',                                                00018811
 'PERPROD.POLT_NOTES',                                                  00018911
 'PERPROD.POLT_OOST_VIOL',                                              00019011
 'PERPROD.POLT_OPERATOR',                                               00019111
 'PERPROD.POLT_PARM',                                                   00019211
 'PERPROD.POLT_POLICY',                                                 00019311
 'PERPROD.POLT_PREMIUM',                                                00019411
 'PERPROD.POLT_PROD_TRANSFER',                                          00019511
 'PERPROD.POLT_QUALCHEK',                                               00019611
 'PERPROD.POLT_QUALCHEK_LOG',                                           00019711
 'PERPROD.POLT_SECURITY',                                               00019811
 'PERPROD.POLT_TRANSACTION',                                            00019911
 'PERPROD.POLT_VEHICLE',                                                00020011
 'PERPROD.POLT_VIOLATION'                                               00020111
      )                                                                 00020211
  AND A.ICDATE = '150308'                                               00020311
  AND B.DBNAME = A.DBNAME                                               00020510
  AND B.TSNAME = A.TSNAME                                               00020610
  AND B.TYPE = 'T'                                                      00020710
ORDER BY 2,3,4                                                          00020810
;                                                                       00020910
SELECT DISTINCT ' INCLUDE TABLESPACE '||                                00021110
     STRIP(DBNAME)||'.'||STRIP(TSNAME)                                  00021210
  FROM SYSIBM.SYSCOPY                                                   00021310
WHERE DSNAME LIKE 'DBA5.C027028.IC0%'                                   00021410
;                                                                       00021510
SELECT DISTINCT ' INCLUDE TABLESPACE '||                                00021610
     STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME)||                            00021710
     CASE WHEN B.PARTITIONS > 0 THEN ' PARTLEVEL '                      00021810
          ELSE ''                                                       00021910
     END                                                                00022010
  FROM SYSIBM.SYSTABLES A,                                              00023000
       SYSIBM.SYSTABLESPACE B                                           00030000
 WHERE A.TYPE = 'T'                                                     00040000
   AND A.DBNAME = B.DBNAME                                              00050000
   AND A.TSNAME = B.NAME                                                00060000
   AND A.CREATOR = 'DB2ACP4'                                            00070000
-- AND A.DBNAME  = 'DCDI0P07'                                           00080000
   AND A.NAME   IN ('CLT_OTHER_OBJECTS'                                 00100000
                   ,'CLFT_POLICY_TERM'                                  00110000
                   ,'CLIENT_PHONE'                                      00120000
                   ,'CLIENT_POLICY'                                     00130000
                   ,'CLIENT_TAB'                                        00140000
                   ,'CLIENT_ADDRESS'                                    00150000
                   ,'INDIVIDUAL_CLIENT'                                 00160000
                   ,'CLT_CLT_RELATION'                                  00170000
                   ,'CLIENT_LICENSE'                                    00180000
                   ,'CLT_REF_RELATION'                                  00190000
                   ,'CLT_ADR_RELATION'                                  00200000
                   ,'CLT_OBJ_RELATION'                                  00210000
                   ,'CLT_ADR_SEARCH'                                    00220000
                   ,'CDI_PA_PARR')                                      00230000
;                                                                       00231000
--                                                                      00240000
-- AND A.NAME IN ('CLT_ADR_RELATION',                                   00250000
--              'CLIENT_ADDRESS',                                       00260000
--              'CLIENT_TAB',                                           00270000
--              'CLT_CLT_RELATION',                                     00280000
--              'INDIVIDUAL_CLIENT' ,                                   00290000
--              'CLIENT_LICENSE'    ,                                   00300000
--              'CLT_OTHER_OBJECTS' ,                                   00310000
--              'CLT_OBJ_RELATION'  ,                                   00320000
--              'CLIENT_PHONE'      ,                                   00330000
--              'CLIENT_POLICY'     ,                                   00340000
--              'CLFT_POLICY_TERM'  ,                                   00350000
--              'CLT_REF_RELATION')                                     00360000
