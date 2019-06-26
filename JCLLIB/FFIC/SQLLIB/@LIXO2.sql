SELECT DISTINCT                                                         00010000
 A.GRANTEE,B.DBNAME,A.TCREATOR,A.TTNAME,                                00020000
 A.INSERTAUTH,A.UPDATEAUTH,A.DELETEAUTH,                                00021000
 A.SELECTAUTH                                                           00030000
FROM SYSIBM.SYSTABAUTH A,                                               00040000
     SYSIBM.SYSTABLES B                                                 00041000
WHERE                                                                   00050000
     ((A.GRANTEE='SEE2MKL' AND B.DBNAME='DSRU0P00')                     00063011
   OR (A.GRANTEE='SEE2MKL' AND B.DBNAME='DUDT2P00')                     00064011
   OR (A.GRANTEE='SEE2KTL' AND B.DBNAME='DUDT2P00')                     00065011
   OR (A.GRANTEE='CIE1SXR' AND B.DBNAME='DCEI0P00')                     00066011
   OR (A.GRANTEE='PER1MER' AND B.DBNAME='DPER0P00')                     00067011
   OR (A.GRANTEE='ROS1CSR' AND B.DBNAME='DROS0P00')                     00068011
   OR (A.GRANTEE='ROS1CSR' AND B.DBNAME='DUOLRDB0')                     00069011
   OR (A.GRANTEE='RVS2TJS' AND B.DBNAME='DUBS0P00')                     00070011
   OR (A.GRANTEE='REX1PMS' AND B.DBNAME='DCEI0P00')                     00080011
   OR (A.GRANTEE='REX1PMS' AND B.DBNAME='DCDI0P00')                     00090011
   OR (A.GRANTEE='REX1PMS' AND B.DBNAME='DROF0P00')                     00100011
   OR (A.GRANTEE='REX1PMS' AND B.DBNAME='DSIS0P00')                     00110011
   OR (A.GRANTEE='REX1PMS' AND B.DBNAME='DPAN0P00')                     00120011
   OR (A.GRANTEE='REX1PMS' AND B.DBNAME='DCIZ0P00'))                    00130011
   AND A.TCREATOR = B.CREATOR                                           00200000
   AND A.TTNAME   = B.NAME                                              00210000
   AND B.TYPE     = 'T'                                                 00220000
;                                                                       00375306
SELECT DISTINCT                                                         00375408
 A.GRANTEE,B.DBNAME,A.TCREATOR,A.TTNAME,                                00375508
 A.INSERTAUTH,A.UPDATEAUTH,A.DELETEAUTH,                                00375608
 A.SELECTAUTH                                                           00375708
FROM SYSIBM.SYSTABAUTH A,                                               00375808
     SYSIBM.SYSTABLES B                                                 00375908
WHERE                                                                   00376008
   (A.GRANTEE='SEE2MKL' AND B.DBNAME='DSRU0P00')                        00376108
   AND A.TCREATOR = B.CREATOR                                           00376208
   AND A.TTNAME   = B.NAME                                              00376308
   AND B.TYPE     = 'T'                                                 00376408
   AND B.DBNAME IN ('DSRU0P00'                                          00376508
                   ,'DUDT2P00'                                          00376608
                   ,'DUDT2P00'                                          00376708
                   ,'DCEI0P00'                                          00376808
                   ,'DPER0P00'                                          00376908
                   ,'DROS0P00'                                          00377008
                   ,'DUOLRDB0'                                          00377108
                   ,'DUBS0P00'                                          00377208
                   ,'DCEI0P00'                                          00377308
                   ,'DCDI0P00'                                          00377408
                   ,'DROF0P00'                                          00377508
                   ,'DSIS0P00'                                          00377608
                   ,'DPAN0P00'                                          00377708
                   ,'DCIZ0P00')                                         00377808
;                                                                       00377908
FIM;                                                                    00378008
      (A.GRANTEE='SEE2MKL' AND B.DBNAME='DSRU0P00')                     00378108
   OR (A.GRANTEE='SEE2MKL' AND B.DBNAME='DUDT2P00')                     00379008
   OR (A.GRANTEE='SEE2KTL' AND B.DBNAME='DUDT2P00')                     00380001
   OR (A.GRANTEE='CIE1SXR' AND B.DBNAME='DCEI0P00')                     00390001
   OR (A.GRANTEE='PER1MER' AND B.DBNAME='DPER0P00')                     00400001
   OR (A.GRANTEE='ROS1CSR' AND B.DBNAME='DROS0P00')                     00410001
   OR (A.GRANTEE='ROS1CSR' AND B.DBNAME='DUOLRDB0')                     00420001
   OR (A.GRANTEE='RVS2TJS' AND B.DBNAME='DUBS0P00')                     00430001
   OR (A.GRANTEE='REX1PMS' AND B.DBNAME='DCEI0P00')                     00440001
   OR (A.GRANTEE='REX1PMS' AND B.DBNAME='DCDI0P00')                     00450001
   OR (A.GRANTEE='REX1PMS' AND B.DBNAME='DROF0P00')                     00460001
   OR (A.GRANTEE='REX1PMS' AND B.DBNAME='DSIS0P00')                     00470001
   OR (A.GRANTEE='REX1PMS' AND B.DBNAME='DPAN0P00')                     00480001
   OR (A.GRANTEE='REX1PMS' AND B.DBNAME='DCIZ0P00'))                    00490001
