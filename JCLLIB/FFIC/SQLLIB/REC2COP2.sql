SELECT '-- '||STRIP(B.CREATOR)||'.'||STRIP(B.NAME)                      00008000
    ,A.DBNAME,A.TSNAME,0                                                00008100
  FROM SYSIBM.SYSCOPY A,                                                00008200
       SYSIBM.SYSTABLES B                                               00008300
WHERE STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME) IN (                        00008404
     'DUBS0P00.SAAS0P00',                                               00008604
     'DUBS0P00.SAPS0P00',                                               00008704
     'DUBS0P00.SKCS0P00',                                               00008804
     'DUBS0P00.SKTS0P00',                                               00008904
     'DUBS0P00.SBAS0P00',                                               00009004
     'DUBS0P00.SDBS0P00',                                               00009104
     'DUBS0P00.SSLS0P00',                                               00010004
     'DUBS0P00.SBSS0P00',                                               00010104
     'DUBS0P00.SBRS0P00',                                               00010204
     'DUBS0P00.SCAS0P00',                                               00010304
     'DUBS0P00.SCCS0P00',                                               00010404
     'DUBS0P00.SCXS0P00',                                               00010504
     'DUBS0P00.SCMS0P00',                                               00010604
     'DUBS0P00.SPMS0P00',                                               00010704
     'DUBS0P00.SCPS0P00',                                               00010804
     'DUBS0P00.SBIS0P00',                                               00010904
     'DUBS0P00.SFIS0P00',                                               00011004
     'DUBS0P00.SDCS0P00',                                               00011104
     'DUBS0P00.SDIS0P00',                                               00011204
     'DUBS0P00.SDPS0P00',                                               00011304
     'DUBS0P00.SDSS0P00',                                               00011404
     'DUBS0P00.SIVS0P00',                                               00011504
     'DUBS0P00.SIAS0P00',                                               00011604
     'DUBS0P00.SICS0P00',                                               00011704
     'DUBS0P00.SIPS0P00',                                               00011804
     'DUBS0P00.SISS0P00',                                               00011904
     'DUBS0P00.SSDS0P00',                                               00012004
     'DUBS0P00.SITS0P00',                                               00012104
     'DUBS0P00.SNMS0P00',                                               00012204
     'DUBS0P00.SPRS0P00',                                               00012304
     'DUBS0P00.SBPS0P00',                                               00012404
     'DUBS0P00.SRCS0P00',                                               00012504
     'DUBS0P00.SRAS0P00',                                               00012604
     'DUBS0P00.SRTS0P00',                                               00012704
     'DUBS0P00.SRDS0P00',                                               00012804
     'DUBS0P00.SRES0P00',                                               00012904
     'DUBS0P00.SRSS0P00',                                               00013004
     'DUBS0P00.SSBS0P00',                                               00013104
     'DUBS0P00.SSHS0P00',                                               00013204
     'DUBS0P00.SSCS0P00',                                               00013304
     'DUBS0P00.SSAS0P00',                                               00013404
     'DUBS0P00.SSIS0P00',                                               00013504
     'DUBS0P00.STXS0P00',                                               00013604
     'DUBS0P00.STSS0P00')                                               00013704
  AND A.ICDATE = '151010'                                               00013801
  AND B.DBNAME = A.DBNAME                                               00013900
  AND B.TSNAME = A.TSNAME                                               00014000
  AND B.TYPE = 'T'                                                      00014100
  AND A.ICTYPE = 'F'                                                    00014203
  AND A.DSNAME LIKE 'UBSE%'                                             00014303
UNION                                                                   00014400
SELECT DISTINCT ' RECOVER TABLESPACE '||                                00014500
     STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME)                              00014600
    ,A.DBNAME,A.TSNAME,1                                                00014700
  FROM SYSIBM.SYSCOPY A,                                                00014800
       SYSIBM.SYSTABLES B                                               00014900
WHERE STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME) IN (                        00015004
     'DUBS0P00.SAAS0P00',                                               00015104
     'DUBS0P00.SAPS0P00',                                               00015204
     'DUBS0P00.SKCS0P00',                                               00015304
     'DUBS0P00.SKTS0P00',                                               00015404
     'DUBS0P00.SBAS0P00',                                               00015504
     'DUBS0P00.SDBS0P00',                                               00015604
     'DUBS0P00.SSLS0P00',                                               00015704
     'DUBS0P00.SBSS0P00',                                               00015804
     'DUBS0P00.SBRS0P00',                                               00015904
     'DUBS0P00.SCAS0P00',                                               00016004
     'DUBS0P00.SCCS0P00',                                               00016104
     'DUBS0P00.SCXS0P00',                                               00016204
     'DUBS0P00.SCMS0P00',                                               00016304
     'DUBS0P00.SPMS0P00',                                               00016404
     'DUBS0P00.SCPS0P00',                                               00016504
     'DUBS0P00.SBIS0P00',                                               00016604
     'DUBS0P00.SFIS0P00',                                               00016704
     'DUBS0P00.SDCS0P00',                                               00016804
     'DUBS0P00.SDIS0P00',                                               00016904
     'DUBS0P00.SDPS0P00',                                               00017004
     'DUBS0P00.SDSS0P00',                                               00017104
     'DUBS0P00.SIVS0P00',                                               00017204
     'DUBS0P00.SIAS0P00',                                               00017304
     'DUBS0P00.SICS0P00',                                               00017404
     'DUBS0P00.SIPS0P00',                                               00017504
     'DUBS0P00.SISS0P00',                                               00017604
     'DUBS0P00.SSDS0P00',                                               00017704
     'DUBS0P00.SITS0P00',                                               00017804
     'DUBS0P00.SNMS0P00',                                               00017904
     'DUBS0P00.SPRS0P00',                                               00018004
     'DUBS0P00.SBPS0P00',                                               00018104
     'DUBS0P00.SRCS0P00',                                               00018204
     'DUBS0P00.SRAS0P00',                                               00018304
     'DUBS0P00.SRTS0P00',                                               00018404
     'DUBS0P00.SRDS0P00',                                               00018504
     'DUBS0P00.SRES0P00',                                               00018604
     'DUBS0P00.SRSS0P00',                                               00018704
     'DUBS0P00.SSBS0P00',                                               00018804
     'DUBS0P00.SSHS0P00',                                               00018904
     'DUBS0P00.SSCS0P00',                                               00019004
     'DUBS0P00.SSAS0P00',                                               00019104
     'DUBS0P00.SSIS0P00',                                               00019204
     'DUBS0P00.STXS0P00',                                               00019304
     'DUBS0P00.STSS0P00')                                               00019404
  AND A.ICDATE = '151010'                                               00019601
  AND B.DBNAME = A.DBNAME                                               00019700
  AND B.TSNAME = A.TSNAME                                               00019800
  AND B.TYPE = 'T'                                                      00019900
  AND A.ICTYPE = 'F'                                                    00020003
  AND A.DSNAME LIKE 'UBSE%'                                             00020103
UNION                                                                   00020200
SELECT DISTINCT '   TOCOPY '||STRIP(A.DSNAME)                           00020300
    ,A.DBNAME,A.TSNAME,2                                                00020400
  FROM SYSIBM.SYSCOPY A,                                                00020500
       SYSIBM.SYSTABLES B                                               00020600
WHERE STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME) IN (                        00020704
     'DUBS0P00.SAAS0P00',                                               00020804
     'DUBS0P00.SAPS0P00',                                               00020904
     'DUBS0P00.SKCS0P00',                                               00021004
     'DUBS0P00.SKTS0P00',                                               00021104
     'DUBS0P00.SBAS0P00',                                               00021204
     'DUBS0P00.SDBS0P00',                                               00021304
     'DUBS0P00.SSLS0P00',                                               00021404
     'DUBS0P00.SBSS0P00',                                               00021504
     'DUBS0P00.SBRS0P00',                                               00021604
     'DUBS0P00.SCAS0P00',                                               00021704
     'DUBS0P00.SCCS0P00',                                               00021804
     'DUBS0P00.SCXS0P00',                                               00021904
     'DUBS0P00.SCMS0P00',                                               00022004
     'DUBS0P00.SPMS0P00',                                               00022104
     'DUBS0P00.SCPS0P00',                                               00022204
     'DUBS0P00.SBIS0P00',                                               00022304
     'DUBS0P00.SFIS0P00',                                               00022404
     'DUBS0P00.SDCS0P00',                                               00022504
     'DUBS0P00.SDIS0P00',                                               00022604
     'DUBS0P00.SDPS0P00',                                               00022704
     'DUBS0P00.SDSS0P00',                                               00022804
     'DUBS0P00.SIVS0P00',                                               00022904
     'DUBS0P00.SIAS0P00',                                               00023004
     'DUBS0P00.SICS0P00',                                               00023104
     'DUBS0P00.SIPS0P00',                                               00023204
     'DUBS0P00.SISS0P00',                                               00023304
     'DUBS0P00.SSDS0P00',                                               00023404
     'DUBS0P00.SITS0P00',                                               00023504
     'DUBS0P00.SNMS0P00',                                               00023604
     'DUBS0P00.SPRS0P00',                                               00023704
     'DUBS0P00.SBPS0P00',                                               00023804
     'DUBS0P00.SRCS0P00',                                               00023904
     'DUBS0P00.SRAS0P00',                                               00024004
     'DUBS0P00.SRTS0P00',                                               00024104
     'DUBS0P00.SRDS0P00',                                               00024204
     'DUBS0P00.SRES0P00',                                               00024304
     'DUBS0P00.SRSS0P00',                                               00024404
     'DUBS0P00.SSBS0P00',                                               00024504
     'DUBS0P00.SSHS0P00',                                               00024604
     'DUBS0P00.SSCS0P00',                                               00024704
     'DUBS0P00.SSAS0P00',                                               00024804
     'DUBS0P00.SSIS0P00',                                               00024904
     'DUBS0P00.STXS0P00',                                               00025004
     'DUBS0P00.STSS0P00')                                               00025104
  AND A.ICDATE = '151010'                                               00025301
  AND B.DBNAME = A.DBNAME                                               00025400
  AND B.TSNAME = A.TSNAME                                               00025500
  AND B.TYPE = 'T'                                                      00025600
  AND A.ICTYPE = 'F'                                                    00025703
  AND A.DSNAME LIKE 'UBSE%'                                             00025803
UNION                                                                   00025900
SELECT DISTINCT ' '                                                     00026000
    ,A.DBNAME,A.TSNAME,3                                                00026100
  FROM SYSIBM.SYSCOPY A,                                                00026200
       SYSIBM.SYSTABLES B                                               00026300
WHERE STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME) IN (                        00026404
     'DUBS0P00.SAAS0P00',                                               00026504
     'DUBS0P00.SAPS0P00',                                               00026604
     'DUBS0P00.SKCS0P00',                                               00026704
     'DUBS0P00.SKTS0P00',                                               00026804
     'DUBS0P00.SBAS0P00',                                               00026904
     'DUBS0P00.SDBS0P00',                                               00027004
     'DUBS0P00.SSLS0P00',                                               00027104
     'DUBS0P00.SBSS0P00',                                               00027204
     'DUBS0P00.SBRS0P00',                                               00027304
     'DUBS0P00.SCAS0P00',                                               00027404
     'DUBS0P00.SCCS0P00',                                               00027504
     'DUBS0P00.SCXS0P00',                                               00027604
     'DUBS0P00.SCMS0P00',                                               00027704
     'DUBS0P00.SPMS0P00',                                               00027804
     'DUBS0P00.SCPS0P00',                                               00027904
     'DUBS0P00.SBIS0P00',                                               00028004
     'DUBS0P00.SFIS0P00',                                               00028104
     'DUBS0P00.SDCS0P00',                                               00028204
     'DUBS0P00.SDIS0P00',                                               00028304
     'DUBS0P00.SDPS0P00',                                               00028404
     'DUBS0P00.SDSS0P00',                                               00028504
     'DUBS0P00.SIVS0P00',                                               00028604
     'DUBS0P00.SIAS0P00',                                               00028704
     'DUBS0P00.SICS0P00',                                               00028804
     'DUBS0P00.SIPS0P00',                                               00028904
     'DUBS0P00.SISS0P00',                                               00029004
     'DUBS0P00.SSDS0P00',                                               00029104
     'DUBS0P00.SITS0P00',                                               00029204
     'DUBS0P00.SNMS0P00',                                               00029304
     'DUBS0P00.SPRS0P00',                                               00029404
     'DUBS0P00.SBPS0P00',                                               00029504
     'DUBS0P00.SRCS0P00',                                               00029604
     'DUBS0P00.SRAS0P00',                                               00029704
     'DUBS0P00.SRTS0P00',                                               00029804
     'DUBS0P00.SRDS0P00',                                               00029904
     'DUBS0P00.SRES0P00',                                               00030004
     'DUBS0P00.SRSS0P00',                                               00030104
     'DUBS0P00.SSBS0P00',                                               00030204
     'DUBS0P00.SSHS0P00',                                               00030304
     'DUBS0P00.SSCS0P00',                                               00030404
     'DUBS0P00.SSAS0P00',                                               00030504
     'DUBS0P00.SSIS0P00',                                               00030604
     'DUBS0P00.STXS0P00',                                               00030704
     'DUBS0P00.STSS0P00')                                               00030804
  AND A.ICDATE = '151010'                                               00031001
  AND B.DBNAME = A.DBNAME                                               00031100
  AND B.TSNAME = A.TSNAME                                               00031200
  AND B.TYPE = 'T'                                                      00031300
  AND A.ICTYPE = 'F'                                                    00031403
  AND A.DSNAME LIKE 'UBSE%'                                             00031503
ORDER BY 2,3,4                                                          00031600
;                                                                       00031700
FIM;                                                                    00031801
SELECT '-- '||STRIP(B.CREATOR)||'.'||STRIP(B.NAME)                      00031901
    ,A.DBNAME,A.TSNAME,0                                                00032001
  FROM SYSIBM.SYSCOPY A,                                                00032101
       SYSIBM.SYSTABLES B                                               00032201
WHERE STRIP(B.CREATOR)||'.'||STRIP(B.NAME) IN (                         00032301
 'PERPROD.POLT_COVERAGE',                                               00032401
 'PERPROD.POLT_ENDORSEMENT',                                            00032501
 'PERPROD.POLT_ENDT_DESC',                                              00032601
 'PERPROD.POLT_FINANC_RESP',                                            00032701
 'PERPROD.POLT_INT_PARTY',                                              00032801
 'PERPROD.POLT_INT_PRTY_NAME',                                          00032901
 'PERPROD.POLT_JOURNAL',                                                00033001
 'PERPROD.POLT_NOTES',                                                  00033101
 'PERPROD.POLT_OOST_VIOL',                                              00033201
 'PERPROD.POLT_OPERATOR',                                               00033301
 'PERPROD.POLT_PARM',                                                   00033401
 'PERPROD.POLT_POLICY',                                                 00033501
 'PERPROD.POLT_PREMIUM',                                                00033601
 'PERPROD.POLT_PROD_TRANSFER',                                          00033701
 'PERPROD.POLT_QUALCHEK',                                               00033801
 'PERPROD.POLT_QUALCHEK_LOG',                                           00033901
 'PERPROD.POLT_SECURITY',                                               00034001
 'PERPROD.POLT_TRANSACTION',                                            00034101
 'PERPROD.POLT_VEHICLE',                                                00034201
 'PERPROD.POLT_VIOLATION'                                               00034301
      )                                                                 00034401
  AND A.ICDATE = '151010'                                               00034501
  AND B.DBNAME = A.DBNAME                                               00034601
  AND B.TSNAME = A.TSNAME                                               00034701
  AND B.TYPE = 'T'                                                      00034801
UNION                                                                   00034901
SELECT DISTINCT ' RECOVER TABLESPACE '||                                00035001
     STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME)                              00035101
    ,A.DBNAME,A.TSNAME,1                                                00035201
  FROM SYSIBM.SYSCOPY A,                                                00035301
       SYSIBM.SYSTABLES B                                               00035401
WHERE STRIP(B.CREATOR)||'.'||STRIP(B.NAME) IN (                         00035501
 'PERPROD.POLT_COVERAGE',                                               00035601
 'PERPROD.POLT_ENDORSEMENT',                                            00035701
 'PERPROD.POLT_ENDT_DESC',                                              00035801
 'PERPROD.POLT_FINANC_RESP',                                            00035901
 'PERPROD.POLT_INT_PARTY',                                              00036001
 'PERPROD.POLT_INT_PRTY_NAME',                                          00036101
 'PERPROD.POLT_JOURNAL',                                                00036201
 'PERPROD.POLT_NOTES',                                                  00036301
 'PERPROD.POLT_OOST_VIOL',                                              00036401
 'PERPROD.POLT_OPERATOR',                                               00036501
 'PERPROD.POLT_PARM',                                                   00036601
 'PERPROD.POLT_POLICY',                                                 00036701
 'PERPROD.POLT_PREMIUM',                                                00036801
 'PERPROD.POLT_PROD_TRANSFER',                                          00036901
 'PERPROD.POLT_QUALCHEK',                                               00037001
 'PERPROD.POLT_QUALCHEK_LOG',                                           00037101
 'PERPROD.POLT_SECURITY',                                               00037201
 'PERPROD.POLT_TRANSACTION',                                            00037301
 'PERPROD.POLT_VEHICLE',                                                00037401
 'PERPROD.POLT_VIOLATION'                                               00037501
      )                                                                 00037601
  AND A.ICDATE = '151010'                                               00037701
  AND B.DBNAME = A.DBNAME                                               00037801
  AND B.TSNAME = A.TSNAME                                               00037901
  AND B.TYPE = 'T'                                                      00038001
UNION                                                                   00038101
SELECT DISTINCT '   TOCOPY '||STRIP(A.DSNAME)                           00038201
    ,A.DBNAME,A.TSNAME,2                                                00038301
  FROM SYSIBM.SYSCOPY A,                                                00038401
       SYSIBM.SYSTABLES B                                               00038501
WHERE STRIP(B.CREATOR)||'.'||STRIP(B.NAME) IN (                         00038601
 'PERPROD.POLT_COVERAGE',                                               00038701
 'PERPROD.POLT_ENDORSEMENT',                                            00038801
 'PERPROD.POLT_ENDT_DESC',                                              00038901
 'PERPROD.POLT_FINANC_RESP',                                            00039001
 'PERPROD.POLT_INT_PARTY',                                              00039101
 'PERPROD.POLT_INT_PRTY_NAME',                                          00039201
 'PERPROD.POLT_JOURNAL',                                                00039301
 'PERPROD.POLT_NOTES',                                                  00039401
 'PERPROD.POLT_OOST_VIOL',                                              00039501
 'PERPROD.POLT_OPERATOR',                                               00039601
 'PERPROD.POLT_PARM',                                                   00039701
 'PERPROD.POLT_POLICY',                                                 00039801
 'PERPROD.POLT_PREMIUM',                                                00039901
 'PERPROD.POLT_PROD_TRANSFER',                                          00040001
 'PERPROD.POLT_QUALCHEK',                                               00040101
 'PERPROD.POLT_QUALCHEK_LOG',                                           00040201
 'PERPROD.POLT_SECURITY',                                               00040301
 'PERPROD.POLT_TRANSACTION',                                            00040401
 'PERPROD.POLT_VEHICLE',                                                00040501
 'PERPROD.POLT_VIOLATION'                                               00040601
      )                                                                 00040701
  AND A.ICDATE = '151010'                                               00040801
  AND B.DBNAME = A.DBNAME                                               00040901
  AND B.TSNAME = A.TSNAME                                               00041001
  AND B.TYPE = 'T'                                                      00041101
UNION                                                                   00041201
SELECT DISTINCT ' '                                                     00041301
    ,A.DBNAME,A.TSNAME,3                                                00041401
  FROM SYSIBM.SYSCOPY A,                                                00041501
       SYSIBM.SYSTABLES B                                               00041601
WHERE STRIP(B.CREATOR)||'.'||STRIP(B.NAME) IN (                         00041701
 'PERPROD.POLT_COVERAGE',                                               00041801
 'PERPROD.POLT_ENDORSEMENT',                                            00041901
 'PERPROD.POLT_ENDT_DESC',                                              00042001
 'PERPROD.POLT_FINANC_RESP',                                            00042101
 'PERPROD.POLT_INT_PARTY',                                              00042201
 'PERPROD.POLT_INT_PRTY_NAME',                                          00042301
 'PERPROD.POLT_JOURNAL',                                                00042401
 'PERPROD.POLT_NOTES',                                                  00042501
 'PERPROD.POLT_OOST_VIOL',                                              00042601
 'PERPROD.POLT_OPERATOR',                                               00042701
 'PERPROD.POLT_PARM',                                                   00042801
 'PERPROD.POLT_POLICY',                                                 00042901
 'PERPROD.POLT_PREMIUM',                                                00043001
 'PERPROD.POLT_PROD_TRANSFER',                                          00043101
 'PERPROD.POLT_QUALCHEK',                                               00043201
 'PERPROD.POLT_QUALCHEK_LOG',                                           00043301
 'PERPROD.POLT_SECURITY',                                               00043401
 'PERPROD.POLT_TRANSACTION',                                            00043501
 'PERPROD.POLT_VEHICLE',                                                00043601
 'PERPROD.POLT_VIOLATION'                                               00043701
      )                                                                 00043801
  AND A.ICDATE = '151010'                                               00043901
  AND B.DBNAME = A.DBNAME                                               00044001
  AND B.TSNAME = A.TSNAME                                               00044101
  AND B.TYPE = 'T'                                                      00044201
ORDER BY 2,3,4                                                          00044301
;                                                                       00044401
SELECT DISTINCT ' INCLUDE TABLESPACE '||                                00044501
     STRIP(DBNAME)||'.'||STRIP(TSNAME)                                  00044601
  FROM SYSIBM.SYSCOPY                                                   00044701
WHERE DSNAME LIKE 'DBA5.C027028.IC0%'                                   00044801
;                                                                       00044901
SELECT DISTINCT ' INCLUDE TABLESPACE '||                                00045001
     STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME)||                            00045101
     CASE WHEN B.PARTITIONS > 0 THEN ' PARTLEVEL '                      00045201
          ELSE ''                                                       00045301
     END                                                                00045401
  FROM SYSIBM.SYSTABLES A,                                              00045501
       SYSIBM.SYSTABLESPACE B                                           00045601
 WHERE A.TYPE = 'T'                                                     00046000
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
