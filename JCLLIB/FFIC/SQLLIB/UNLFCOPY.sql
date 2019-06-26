--UNLOAD TABLESPACE DCLI0M00.SCEN0M00 PUNCHDDN SPUN UNLDDN SREC         00010000
 -- FROMCOPY DBA5.C026654A.IC.DCLI0M00.SCEN0M00.D2010331                00020000
SELECT                                                                  00030006
CHAR('--'||STRIP(B.CREATOR)||'.'||STRIP(B.NAME)||' '||                  00030106
     CHAR(TIMESTAMP),80),                                               00030206
A.DBNAME, A.TSNAME, 0                                                   00030307
FROM SYSIBM.SYSCOPY A,                                                  00030406
     SYSIBM.SYSTABLES B                                                 00030506
 WHERE DSNAME LIKE 'DBA5.C063083%'                                      00030606
   AND B.DBNAME = A.DBNAME                                              00030806
   AND B.TSNAME = A.TSNAME                                              00030906
   AND B.TYPE = 'T'                                                     00031006
   AND A.ICTYPE = 'F'                                                   00031106
UNION ALL                                                               00031306
SELECT                                                                  00032000
'UNLOAD TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(TSNAME)||               00040001
' PUNCHDDN SPUN UNLDDN SREC', DBNAME, TSNAME, 1                         00050000
FROM SYSIBM.SYSCOPY                                                     00060000
 WHERE DSNAME LIKE 'DBA5.C063083%'                                      00070006
UNION ALL                                                               00210002
SELECT                                                                  00220002
'  FROMCOPY '||STRIP(DSNAME)                                            00230005
, DBNAME, TSNAME, 2                                                     00240002
FROM SYSIBM.SYSCOPY                                                     00250002
 WHERE DSNAME LIKE 'DBA5.C063083%'                                      00251006
ORDER BY 2,3,4                                                          00400002
