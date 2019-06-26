SELECT                                                                  00010002
'GRANT SELECT,INSERT,DELETE,UPDATE ON '||STRIP(CREATOR)||'.'||          00020002
STRIP(NAME),DBNAME,CREATOR,NAME,1                                       00030004
FROM SYSIBM.SYSTABLES                                                   00040002
WHERE TYPE = 'T'                                                        00050002
  AND DBNAME IN ('DCEI0P00')                                            00060002
UNION ALL                                                               00201002
SELECT                                                                  00202002
 ' TO CIE1SXR;',DBNAME,CREATOR,NAME,2                                   00203004
FROM SYSIBM.SYSTABLES                                                   00204002
WHERE TYPE = 'T'                                                        00205002
  AND DBNAME IN ('DCEI0P00')                                            00206002
ORDER BY 2,3,4,5                                                        00206106
;                                                                       00206205
                                                                        00206306
SELECT                                                                  00208002
'GRANT SELECT,INSERT,DELETE,UPDATE ON '||STRIP(CREATOR)||'.'||          00209002
STRIP(NAME),DBNAME,CREATOR,NAME,1                                       00210004
FROM SYSIBM.SYSTABLES                                                   00220002
WHERE TYPE = 'T'                                                        00230002
  AND DBNAME IN ('DPER0P00')                                            00240002
UNION ALL                                                               00250002
SELECT                                                                  00260002
 ' TO PER1MER;',DBNAME,CREATOR,NAME,2                                   00270004
FROM SYSIBM.SYSTABLES                                                   00280002
WHERE TYPE = 'T'                                                        00290002
  AND DBNAME IN ('DPER0P00')                                            00300002
ORDER BY 2,3,4,5                                                        00300106
;                                                                       00300206
                                                                        00300306
SELECT                                                                  00320002
'GRANT SELECT,INSERT,DELETE,UPDATE ON '||STRIP(CREATOR)||'.'||          00321002
STRIP(NAME),DBNAME,CREATOR,NAME,1                                       00322004
FROM SYSIBM.SYSTABLES                                                   00323002
WHERE TYPE = 'T'                                                        00324002
  AND DBNAME IN ('DCEI0P00',                                            00325002
                 'DCDI0P00',                                            00325102
                 'DROF0P00',                                            00325202
                 'DSIS0P00',                                            00325302
                 'DPAN0P00',                                            00325402
                 'DCIZ0P00')                                            00325502
UNION ALL                                                               00326002
SELECT                                                                  00327002
 ' TO REX1PMS;',DBNAME,CREATOR,NAME,2                                   00328004
FROM SYSIBM.SYSTABLES                                                   00329002
WHERE TYPE = 'T'                                                        00329102
  AND DBNAME IN ('DCEI0P00',                                            00329202
                 'DCDI0P00',                                            00329302
                 'DROF0P00',                                            00329402
                 'DSIS0P00',                                            00329502
                 'DPAN0P00',                                            00329602
                 'DCIZ0P00')                                            00329702
ORDER BY 2,3,4,5                                                        00329806
;                                                                       00329906
                                                                        00330006
SELECT                                                                  00330102
'GRANT SELECT,INSERT,DELETE,UPDATE ON '||STRIP(CREATOR)||'.'||          00330202
STRIP(NAME),DBNAME,CREATOR,NAME,1                                       00330304
FROM SYSIBM.SYSTABLES                                                   00330402
WHERE TYPE = 'T'                                                        00330502
  AND DBNAME IN ('DROS0P00',                                            00330602
                 'DUOLRDB0')                                            00330702
UNION ALL                                                               00331002
SELECT                                                                  00331102
 ' TO ROS1CSR;',DBNAME,CREATOR,NAME,2                                   00331204
FROM SYSIBM.SYSTABLES                                                   00331302
WHERE TYPE = 'T'                                                        00331402
  AND DBNAME IN ('DROS0P00',                                            00331502
                 'DUOLRDB0')                                            00331602
ORDER BY 2,3,4,5                                                        00331706
;                                                                       00331806
                                                                        00331906
SELECT                                                                  00332102
'GRANT SELECT,INSERT,DELETE,UPDATE ON '||STRIP(CREATOR)||'.'||          00332202
STRIP(NAME),DBNAME,CREATOR,NAME,1                                       00332304
FROM SYSIBM.SYSTABLES                                                   00332402
WHERE TYPE = 'T'                                                        00332502
  AND DBNAME IN ('DUBS0P00')                                            00332602
UNION ALL                                                               00332702
SELECT                                                                  00332802
 ' TO RVS2TJS;',DBNAME,CREATOR,NAME,2                                   00332904
FROM SYSIBM.SYSTABLES                                                   00333002
WHERE TYPE = 'T'                                                        00333102
  AND DBNAME IN ('DUBS0P00')                                            00333202
ORDER BY 2,3,4,5                                                        00333306
;                                                                       00333406
                                                                        00333506
SELECT                                                                  00333702
'GRANT SELECT,INSERT,DELETE,UPDATE ON '||STRIP(CREATOR)||'.'||          00333802
STRIP(NAME),DBNAME,CREATOR,NAME,1                                       00333904
FROM SYSIBM.SYSTABLES                                                   00334002
WHERE TYPE = 'T'                                                        00334102
  AND DBNAME IN ('DUDT2P00')                                            00334202
UNION ALL                                                               00334302
SELECT                                                                  00334402
 ' TO SEE2KTL;',DBNAME,CREATOR,NAME,2                                   00334504
FROM SYSIBM.SYSTABLES                                                   00334602
WHERE TYPE = 'T'                                                        00334702
  AND DBNAME IN ('DUDT2P00')                                            00334802
ORDER BY 2,3,4,5                                                        00334906
;                                                                       00335006
                                                                        00335106
SELECT                                                                  00335302
'GRANT SELECT,INSERT,DELETE,UPDATE ON '||STRIP(CREATOR)||'.'||          00335402
STRIP(NAME),DBNAME,CREATOR,NAME,1                                       00335504
FROM SYSIBM.SYSTABLES                                                   00335602
WHERE TYPE = 'T'                                                        00335702
  AND DBNAME IN ('DSRU0P00',                                            00335802
                 'DUDT2P00')                                            00335902
UNION ALL                                                               00336002
SELECT                                                                  00336102
 ' TO SEE2MKL;',DBNAME,CREATOR,NAME,2                                   00336204
FROM SYSIBM.SYSTABLES                                                   00336302
WHERE TYPE = 'T'                                                        00336402
  AND DBNAME IN ('DSRU0P00',                                            00336502
                 'DUDT2P00')                                            00336602
ORDER BY 2,3,4,5                                                        00336704
--                                                                      00337002
--                                                                      00340002
--                                                                      00350002
