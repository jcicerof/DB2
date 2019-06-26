--CREATOR.NAME                                                          00018103
--UNLOAD TABLESPACE DCLI0M00.SCEN0M00 PUNCHDDN SPUN UNLDDN SREC         00019000
-- FROMCOPY DBA5.C026654A.IC.DCLI0M00.SCEN0M00.D2010331                 00020003
SELECT                                                                  00030000
CHAR('--'||STRIP(B.CREATOR)||'.'||STRIP(B.NAME)||' '||                  00040006
     CHAR(TIMESTAMP),80),                                               00041006
A.DBNAME, A.TSNAME, 0, A.NPAGESF                                        00050012
FROM SYSIBM.SYSCOPY A,                                                  00060001
     SYSIBM.SYSTABLES B                                                 00070001
WHERE STRIP(B.CREATOR)||'.'||STRIP(B.NAME) IN (                         00070107
   'PERPROD.POLT_COVERAGE'                                              00070216
  ,'PERPROD.POLT_ENDORSEMENT'                                           00070316
  ,'PERPROD.POLT_ENDT_DESC'                                             00070416
  ,'PERPROD.POLT_FINANC_RESP'                                           00070516
  ,'PERPROD.POLT_INT_PARTY'                                             00070616
  ,'PERPROD.POLT_INT_PRTY_NAME'                                         00070716
  ,'PERPROD.POLT_JOURNAL'                                               00070816
  ,'PERPROD.POLT_NOTES'                                                 00070916
  ,'PERPROD.POLT_OOST_VIOL'                                             00071016
  ,'PERPROD.POLT_OPERATOR'                                              00072016
  ,'PERPROD.POLT_PARM'                                                  00072116
  ,'PERPROD.POLT_POLICY'                                                00072216
  ,'PERPROD.POLT_PREMIUM'                                               00072316
  ,'PERPROD.POLT_PROD_TRANSFER'                                         00072416
  ,'PERPROD.POLT_SECURITY'                                              00072516
  ,'PERPROD.POLT_TRANSACTION'                                           00072616
  ,'PERPROD.POLT_VEHICLE'                                               00072716
  ,'PERPROD.POLT_VIOLATION'                                             00072816
      )                                                                 00072907
  AND A.ICDATE = '150718'                                               00073017
  AND B.DBNAME = A.DBNAME                                               00073107
  AND B.TSNAME = A.TSNAME                                               00073207
  AND B.TYPE = 'T'                                                      00073307
  AND A.ICTYPE = 'F'                                                    00073412
  AND SUBSTR(A.DSNAME,4,1) <> 'X'                                       00074013
UNION ALL                                                               00223000
SELECT                                                                  00224003
CHAR('UNLOAD TABLESPACE '||STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME)||      00225003
' PUNCHDDN SPUN UNLDDN SREC',80), A.DBNAME, A.TSNAME, 1, A.NPAGESF      00226003
FROM SYSIBM.SYSCOPY A,                                                  00227003
     SYSIBM.SYSTABLES B                                                 00228003
WHERE STRIP(B.CREATOR)||'.'||STRIP(B.NAME) IN (                         00228107
   'PERPROD.POLT_COVERAGE'                                              00228216
  ,'PERPROD.POLT_ENDORSEMENT'                                           00228316
  ,'PERPROD.POLT_ENDT_DESC'                                             00228416
  ,'PERPROD.POLT_FINANC_RESP'                                           00228516
  ,'PERPROD.POLT_INT_PARTY'                                             00228616
  ,'PERPROD.POLT_INT_PRTY_NAME'                                         00228716
  ,'PERPROD.POLT_JOURNAL'                                               00228816
  ,'PERPROD.POLT_NOTES'                                                 00228916
  ,'PERPROD.POLT_OOST_VIOL'                                             00229016
  ,'PERPROD.POLT_OPERATOR'                                              00229116
  ,'PERPROD.POLT_PARM'                                                  00229216
  ,'PERPROD.POLT_POLICY'                                                00229316
  ,'PERPROD.POLT_PREMIUM'                                               00229416
  ,'PERPROD.POLT_PROD_TRANSFER'                                         00229516
  ,'PERPROD.POLT_SECURITY'                                              00229616
  ,'PERPROD.POLT_TRANSACTION'                                           00229716
  ,'PERPROD.POLT_VEHICLE'                                               00229816
  ,'PERPROD.POLT_VIOLATION'                                             00229916
      )                                                                 00232107
  AND A.ICDATE = '150718'                                               00232217
  AND B.DBNAME = A.DBNAME                                               00232307
  AND B.TSNAME = A.TSNAME                                               00232407
  AND B.TYPE = 'T'                                                      00232507
  AND A.ICTYPE = 'F'                                                    00232608
  AND SUBSTR(A.DSNAME,4,1) <> 'X'                                       00233013
UNION ALL                                                               00240103
SELECT                                                                  00241003
CHAR(' FROMCOPY '||STRIP(A.DSNAME),80),A.DBNAME,A.TSNAME,2,A.NPAGESF    00250001
FROM SYSIBM.SYSCOPY A,                                                  00260001
     SYSIBM.SYSTABLES B                                                 00261001
WHERE STRIP(B.CREATOR)||'.'||STRIP(B.NAME) IN (                         00262007
   'PERPROD.POLT_COVERAGE'                                              00262116
  ,'PERPROD.POLT_ENDORSEMENT'                                           00262216
  ,'PERPROD.POLT_ENDT_DESC'                                             00262316
  ,'PERPROD.POLT_FINANC_RESP'                                           00262416
  ,'PERPROD.POLT_INT_PARTY'                                             00262516
  ,'PERPROD.POLT_INT_PRTY_NAME'                                         00262616
  ,'PERPROD.POLT_JOURNAL'                                               00262716
  ,'PERPROD.POLT_NOTES'                                                 00262816
  ,'PERPROD.POLT_OOST_VIOL'                                             00262916
  ,'PERPROD.POLT_OPERATOR'                                              00263016
  ,'PERPROD.POLT_PARM'                                                  00263116
  ,'PERPROD.POLT_POLICY'                                                00263216
  ,'PERPROD.POLT_PREMIUM'                                               00263316
  ,'PERPROD.POLT_PROD_TRANSFER'                                         00263416
  ,'PERPROD.POLT_SECURITY'                                              00263516
  ,'PERPROD.POLT_TRANSACTION'                                           00263616
  ,'PERPROD.POLT_VEHICLE'                                               00263716
  ,'PERPROD.POLT_VIOLATION'                                             00263816
      )                                                                 00270807
  AND A.ICDATE = '150718'                                               00270917
  AND B.DBNAME = A.DBNAME                                               00271107
  AND B.TSNAME = A.TSNAME                                               00271207
  AND B.TYPE = 'T'                                                      00271307
  AND A.ICTYPE = 'F'                                                    00271408
  AND SUBSTR(A.DSNAME,4,1) <> 'X'                                       00272013
ORDER BY 5 DESC,2,3,4                                                   00420000
