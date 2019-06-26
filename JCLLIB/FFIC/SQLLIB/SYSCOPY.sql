--                                                                      00000144
-- LISTA JOBS NA SYSCOPY                                                00000244
--                                                                      00000344
                                                                        00000444
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,      00000544
       JOBNAME,T.CREATOR,T.NAME                                         00000644
  FROM SYSIBM.SYSTABLES T,                                              00000744
       SYSIBM.SYSCOPY C                                                 00000844
 WHERE T.DBNAME = C.DBNAME                                              00000944
   AND T.TSNAME = C.TSNAME                                              00001044
   AND C.ICTYPE = 'F'                                                   00001144
   AND T.TYPE = 'T'                                                     00001244
   AND C.TIMESTAMP >= CURRENT TIMESTAMP - 45 DAYS                       00001344
   AND C.JOBNAME = 'DAPCPER0'                                           00001444
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) NOT IN (                    00001545
'PERPROD.POLT_COVERAGE',                                                00001645
'PERPROD.POLT_ENDORSEMENT',                                             00001745
'PERPROD.POLT_ENDT_DESC',                                               00001845
'PERPROD.POLT_FINANC_RESP',                                             00001945
'PERPROD.POLT_INT_PARTY',                                               00002045
'PERPROD.POLT_INT_PRTY_NAME',                                           00002145
'PERPROD.POLT_JOURNAL',                                                 00002245
'PERPROD.POLT_NOTES',                                                   00002345
'PERPROD.POLT_OOST_VIOL',                                               00002445
'PERPROD.POLT_OPERATOR',                                                00002545
'PERPROD.POLT_PARM',                                                    00002645
'PERPROD.POLT_POLICY',                                                  00002745
'PERPROD.POLT_PREMIUM',                                                 00002845
'PERPROD.POLT_PROD_TRANSFER',                                           00002945
'PERPROD.POLT_QUALCHEK',                                                00003045
'PERPROD.POLT_QUALCHEK_LOG',                                            00003145
'PERPROD.POLT_SECURITY',                                                00003245
'PERPROD.POLT_TRANSACTION',                                             00003345
'PERPROD.POLT_VEHICLE',                                                 00003445
'PERPROD.POLT_VIOLATION',                                               00003545
'PERPROD.PERT_ADDL_SRS_INFO',                                           00003645
'PERPROD.PERT_AUDIT_PARENT',                                            00003745
'PERPROD.PERT_AUDIT_TRAIL',                                             00003845
'PERPROD.PERT_CLAIM_ASSIGN',                                            00003945
'PERPROD.PERT_CLAIM_INFO',                                              00004045
'PERPROD.PERT_CLAIM_VALUE',                                             00004145
'PERPROD.PERT_CLIENT_XREF',                                             00004245
'PERPROD.PERT_CLUE_INFO',                                               00004345
'PERPROD.PERT_COVERAGE',                                                00004445
'PERPROD.PERT_DUMMY1',                                                  00004545
'PERPROD.PERT_ENDORSEMENT',                                             00004645
'PERPROD.PERT_FILLIN_FORMS',                                            00004745
'PERPROD.PERT_FORMS_DEF',                                               00004845
'PERPROD.PERT_INT_PARTY',                                               00004945
'PERPROD.PERT_INT_PRTY_ADDR',                                           00005045
'PERPROD.PERT_INT_PRTY_DEMO',                                           00005145
'PERPROD.PERT_INT_PRTY_NAME',                                           00005245
'PERPROD.PERT_NC_INFO',                                                 00005345
'PERPROD.PERT_NC_REASONS',                                              00005445
'PERPROD.PERT_NEW_CLIENT',                                              00005545
'PERPROD.PERT_NON_STD_VEH',                                             00005645
'PERPROD.PERT_NOTES',                                                   00005745
'PERPROD.PERT_OPERATOR',                                                00005845
'PERPROD.PERT_OPR_RPT_LINK',                                            00005945
'PERPROD.PERT_PREMIUM',                                                 00006045
'PERPROD.PERT_PRINT_IDCARDS',                                           00006145
'PERPROD.PERT_PRODUCER_XFER',                                           00006245
'PERPROD.PERT_RATE_TERR',                                               00006345
'PERPROD.PERT_RPT_INFO',                                                00006445
'PERPROD.PERT_SIGNED_FORMS',                                            00006545
'PERPROD.PERT_STATE_FORMS',                                             00006645
'PERPROD.PERT_STATE_REGION',                                            00006745
'PERPROD.PERT_TRANSACTION',                                             00006845
'PERPROD.PERT_TRANSACTION_TEMP',                                        00006945
'PERPROD.PERT_TRANSACTION_TEMPO',                                       00007045
'PERPROD.PERT_TRANS_MSG',                                               00007145
'PERPROD.PERT_USERID',                                                  00007245
'PERPROD.PERT_UW_QUESTION',                                             00007345
'PERPROD.PERT_VALUE_LOCK',                                              00007445
'PERPROD.PERT_VEHICLE',                                                 00007545
'PERPROD.PERT_VEH_POLICY',                                              00007645
'PERPROD.PERT_VIOLATION',                                               00007745
'QSTPROD.PERT_CLIENT_XREF',                                             00007845
'QSTPROD.PERT_NEW_CLIENT',                                              00007945
'QSTPROD.PERT_TRANSACTION')                                             00008045
;                                                                       00008145
;                                                                       00008244
                                                                        00008344
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,      00008444
       JOBNAME                                                          00008544
  FROM SYSIBM.SYSTABLES T,                                              00008644
       SYSIBM.SYSCOPY C                                                 00008744
 WHERE T.DBNAME = C.DBNAME                                              00008844
   AND T.TSNAME = C.TSNAME                                              00008944
   AND C.ICTYPE = 'F'                                                   00009044
   AND T.TYPE = 'T'                                                     00009144
   AND C.TIMESTAMP >= CURRENT TIMESTAMP - 45 DAYS                       00009244
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (                        00009344
'PERPROD.POLT_COVERAGE',                                                00009444
'PERPROD.POLT_ENDORSEMENT',                                             00009544
'PERPROD.POLT_ENDT_DESC',                                               00009644
'PERPROD.POLT_FINANC_RESP',                                             00009744
'PERPROD.POLT_INT_PARTY',                                               00009844
'PERPROD.POLT_INT_PRTY_NAME',                                           00009944
'PERPROD.POLT_JOURNAL',                                                 00010044
'PERPROD.POLT_NOTES',                                                   00010144
'PERPROD.POLT_OOST_VIOL',                                               00010244
'PERPROD.POLT_OPERATOR',                                                00010344
'PERPROD.POLT_PARM',                                                    00010444
'PERPROD.POLT_POLICY',                                                  00010544
'PERPROD.POLT_PREMIUM',                                                 00010644
'PERPROD.POLT_PROD_TRANSFER',                                           00010744
'PERPROD.POLT_QUALCHEK',                                                00010844
'PERPROD.POLT_QUALCHEK_LOG',                                            00010944
'PERPROD.POLT_SECURITY',                                                00011044
'PERPROD.POLT_TRANSACTION',                                             00011144
'PERPROD.POLT_VEHICLE',                                                 00011244
'PERPROD.POLT_VIOLATION',                                               00011344
'PERPROD.PERT_ADDL_SRS_INFO',                                           00011444
'PERPROD.PERT_AUDIT_PARENT',                                            00011544
'PERPROD.PERT_AUDIT_TRAIL',                                             00011644
'PERPROD.PERT_CLAIM_ASSIGN',                                            00011744
'PERPROD.PERT_CLAIM_INFO',                                              00011844
'PERPROD.PERT_CLAIM_VALUE',                                             00011944
'PERPROD.PERT_CLIENT_XREF',                                             00012044
'PERPROD.PERT_CLUE_INFO',                                               00012144
'PERPROD.PERT_COVERAGE',                                                00012244
'PERPROD.PERT_DUMMY1',                                                  00012344
'PERPROD.PERT_ENDORSEMENT',                                             00012444
'PERPROD.PERT_FILLIN_FORMS',                                            00012544
'PERPROD.PERT_FORMS_DEF',                                               00012644
'PERPROD.PERT_INT_PARTY',                                               00012744
'PERPROD.PERT_INT_PRTY_ADDR',                                           00012844
'PERPROD.PERT_INT_PRTY_DEMO',                                           00012944
'PERPROD.PERT_INT_PRTY_NAME',                                           00013044
'PERPROD.PERT_NC_INFO',                                                 00013144
'PERPROD.PERT_NC_REASONS',                                              00013244
'PERPROD.PERT_NEW_CLIENT',                                              00013344
'PERPROD.PERT_NON_STD_VEH',                                             00013444
'PERPROD.PERT_NOTES',                                                   00013544
'PERPROD.PERT_OPERATOR',                                                00013644
'PERPROD.PERT_OPR_RPT_LINK',                                            00013744
'PERPROD.PERT_PREMIUM',                                                 00013844
'PERPROD.PERT_PRINT_IDCARDS',                                           00013944
'PERPROD.PERT_PRODUCER_XFER',                                           00014044
'PERPROD.PERT_RATE_TERR',                                               00014144
'PERPROD.PERT_RPT_INFO',                                                00014244
'PERPROD.PERT_SIGNED_FORMS',                                            00014344
'PERPROD.PERT_STATE_FORMS',                                             00014444
'PERPROD.PERT_STATE_REGION',                                            00014544
'PERPROD.PERT_TRANSACTION',                                             00014644
'PERPROD.PERT_TRANSACTION_TEMP',                                        00014744
'PERPROD.PERT_TRANSACTION_TEMPO',                                       00014844
'PERPROD.PERT_TRANS_MSG',                                               00014944
'PERPROD.PERT_USERID',                                                  00015044
'PERPROD.PERT_UW_QUESTION',                                             00015144
'PERPROD.PERT_VALUE_LOCK',                                              00015244
'PERPROD.PERT_VEHICLE',                                                 00015344
'PERPROD.PERT_VEH_POLICY',                                              00015444
'PERPROD.PERT_VIOLATION',                                               00015544
'QSTPROD.PERT_CLIENT_XREF',                                             00015644
'QSTPROD.PERT_NEW_CLIENT',                                              00015744
'QSTPROD.PERT_TRANSACTION')                                             00015844
;                                                                       00015944
SELECT DISTINCT JOBNAME,                                                00016044
       DBNAME,TSNAME                                                    00016144
  FROM SYSIBM.SYSCOPY                                                   00016244
 WHERE ICTYPE = 'F'                                                     00016344
 AND SUBSTR(JOBNAME,1,4) <> 'IBM1'                                      00016444
 AND DBNAME IN ('DPER0P00')                                             00016544
;                                                                       00016644
FIM;                                                                    00016744
SELECT JOBNAME,TIMESTAMP,                                               00016844
       DBNAME,TSNAME,ICTYPE,DSNAME,SHRLEVEL,ICDATE,ICTIME,              00016944
       DSVOLSER                                                         00017044
  FROM SYSIBM.SYSCOPY                                                   00017144
 WHERE                                                                  00017244
   DSNAME LIKE 'PMXX.DB2P.DPMX0P05.SSJN0P00.P00000%'                    00017344
 ORDER BY TIMESTAMP DESC                                                00017444
;                                                                       00017544
FIM;                                                                    00017644
SELECT A.DBNAME,A.TSNAME,A.ICTYPE,DSNAME,SHRLEVEL,ICDATE,ICTIME,        00017744
       TIMESTAMP,DSVOLSER,JOBNAME                                       00017844
  FROM SYSIBM.SYSCOPY A                                                 00017944
     , SYSIBM.SYSTABLES B                                               00018044
WHERE B.TYPE = 'T'                                                      00018144
  AND B.DBNAME = A.DBNAME                                               00018244
  AND B.TSNAME = A.TSNAME                                               00018344
--AND B.CREATOR = 'PERPROD'                                             00018444
--AND B.NAME IN ('CLT_OTHER_OBJECTS'                                    00018544
--              ,'CLFT_POLICY_TERM'                                     00018644
--              ,'CLIENT_PHONE'                                         00018744
--              ,'CLIENT_POLICY'                                        00018844
--              ,'CLIENT_TAB'                                           00018944
--              ,'CLIENT_ADDRESS'                                       00019044
--              ,'INDIVIDUAL_CLIENT'                                    00019144
--              ,'CLT_CLT_RELATION'                                     00019244
--              ,'CLIENT_LICENSE'                                       00019344
--              ,'CLT_REF_RELATION'                                     00019444
--              ,'CLT_ADR_RELATION'                                     00019544
--              ,'CLT_OBJ_RELATION'                                     00019644
--              ,'CLT_ADR_SEARCH'                                       00019744
--              ,'CDI_PA_PARR')                                         00019844
;                                                                       00019944
FIM;                                                                    00020044
                                                                        00020144
                                                                        00020244
                                                                        00020344
                                                                        00020444
                                                                        00020544
SELECT * FROM SYSIBM.SYSCOPY                                            00020644
WHERE DBNAME = 'DCIA0B66'                                               00020744
  AND ICDATE = '110205'                                                 00020844
  AND TSNAME IN ('SCIS6B07'                                             00020944
            ,'SCIS6B21'                                                 00021044
            ,'SCIS6B22'                                                 00021144
            ,'SCIS6B23'                                                 00021244
            ,'SCIS6B24'                                                 00021344
            ,'SCIS6B26'                                                 00021444
            ,'SCIS6B27'                                                 00021544
            ,'SCIS6B28'                                                 00021644
            ,'SCIS6B41'                                                 00021744
            ,'SCIS6B42'                                                 00021844
            ,'SCIS6B43'                                                 00021944
            ,'SCIS6B44'                                                 00022044
            ,'SCIS6B45'                                                 00022144
            ,'SCIS6B52') ;                                              00022244
FIM;                                                                    00022344
--SELECT * FROM SYSIBM.SYSCOPY                                          00022444
--WHERE DSNAME LIKE 'DBA5.M0023983.IC%';                                00022544
--FIM;                                                                  00022644
--SELECT* FROM SYSIBM.SYSCOPY                                           00022744
 --WHERE  DBNAME = 'DCLI0R00' AND TSNAME='SCDN0R00'                     00022844
 --  AND DSNAME = 'PMXE.DB2J.DCLI0R00.SCDN0R00.D2010204'                00022944
-- WHERE  DBNAME = 'DCLI0R00' AND TSNAME='SCDN0R00'                     00023044
--  AND ICTYPE = 'F'                                                    00023144
-- ORDER BY TIMESTAMP DESC;                                             00023244
--FIM;                                                                  00023344
SELECT A.CREATOR, A.NAME, A.DBNAME, A.TSNAME, B.PARTITIONS              00023444
  FROM SYSIBM.SYSTABLES A,                                              00023504
       SYSIBM.SYSTABLESPACE B                                           00024004
 WHERE A.NAME IN ('CLIENT_TAB'        ,                                 00030004
                'CLT_REF_RELATION'  ,                                   00040000
                'CLT_CLT_RELATION'  ,                                   00050000
                'CLIENT_POLICY'     ,                                   00060000
                'CLT_OBJ_RELATION'  ,                                   00070000
                'CLIENT_POLICY'     ,                                   00080000
                'CLIENT_ADDRESS'    ,                                   00090000
                'CLT_ADR_REALATION' ,                                   00100000
                'INDIVIDUAL_CLIENT' ,                                   00110000
                'CLIENT_LICENSE')                                       00120000
   AND A.TYPE = 'T'                                                     00130004
   AND A.CREATOR = 'CERT'                                               00140005
   AND A.DBNAME = B.DBNAME                                              00141004
   AND A.TSNAME = B.NAME                                                00142004
;                                                                       00150003
FIM;                                                                    00151020
SELECT DBNAME,TSNAME,DSNAME                                             00160003
  FROM SYSIBM.SYSCOPY                                                   00170003
 WHERE JOBNAME = 'DAACPMX0'                                             00180003
   AND ICDATE = '100612'                                                00190003
   AND ((DBNAME ='DCLI0R00' AND TSNAME='SEEN0R00') OR                   00191003
        (DBNAME ='DCLI0R00' AND TSNAME='SEHN0R00') OR                   00200003
        (DBNAME ='DCLI0R00' AND TSNAME='SEKN0R00') OR                   00210003
        (DBNAME ='DCLI0R00' AND TSNAME='SEPN0R00') OR                   00220003
        (DBNAME ='DCLI0R00' AND TSNAME='SEWN0R00') OR                   00230003
        (DBNAME ='DCLI0R00' AND TSNAME='SEZN0R00') OR                   00240003
        (DBNAME ='DCLI0R01' AND TSNAME='SERN0R01') OR                   00250003
        (DBNAME ='DCLI0R01' AND TSNAME='SFAN0R01'))                     00260003
