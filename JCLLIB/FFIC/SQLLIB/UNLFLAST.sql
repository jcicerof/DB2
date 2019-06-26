--UNLOAD TABLESPACE DCLI0M00.SCEN0M00 PUNCHDDN SPUN UNLDDN SREC         00010000
 -- FROMCOPY DBA5.C026654A.IC.DCLI0M00.SCEN0M00.D2010331                00020000
SELECT                                                                  00030000
CHAR('UNLOAD TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(TSNAME)||          00040000
' PUNCHDDN SPUN UNLDDN SREC',80), DBNAME, TSNAME, 1, NPAGESF            00050000
FROM SYSIBM.SYSCOPY                                                     00060000
 WHERE DBNAME IN ('DBCW0P00'                                            00080000
                 ,'DBCW0P01'                                            00090000
                 ,'DBCW0P02'                                            00100000
                 ,'DBCW0P03'                                            00110000
                 ,'DBCW0P04'                                            00120000
                 ,'DCLI0P00'                                            00130000
                 ,'DCLI0P01'                                            00140000
                 ,'DPMX0P00'                                            00150000
                 ,'DPMX0P01'                                            00160000
                 ,'DPMX0P02'                                            00170000
                 ,'DPMX0P03'                                            00180000
                 ,'DPMX0P04'                                            00190000
                 ,'DPMX0P05'                                            00200000
                 ,'DPMX0P99')                                           00210000
   AND TIMESTAMP >= '2011-04-30-00.00.00.000000'                        00220000
   AND ICTYPE ='F'                                                      00220100
   AND ICBACKUP= ' '                                                    00220200
UNION ALL                                                               00221000
SELECT                                                                  00230000
CHAR(' FROMCOPY '||STRIP(DSNAME),80), DBNAME, TSNAME, 2, NPAGESF        00250000
FROM SYSIBM.SYSCOPY                                                     00260000
 WHERE DBNAME IN ('DBCW0P00'                                            00270000
                 ,'DBCW0P01'                                            00280000
                 ,'DBCW0P02'                                            00290000
                 ,'DBCW0P03'                                            00300000
                 ,'DBCW0P04'                                            00310000
                 ,'DCLI0P00'                                            00320000
                 ,'DCLI0P01'                                            00330000
                 ,'DPMX0P00'                                            00340000
                 ,'DPMX0P01'                                            00350000
                 ,'DPMX0P02'                                            00360000
                 ,'DPMX0P03'                                            00370000
                 ,'DPMX0P04'                                            00380000
                 ,'DPMX0P05'                                            00390000
                 ,'DPMX0P99')                                           00400000
   AND TIMESTAMP >= '2011-04-30-00.00.00.000000'                        00410000
   AND ICTYPE ='F'                                                      00411000
   AND ICBACKUP= ' '                                                    00411100
ORDER BY 5 DESC,2,3,4                                                   00420000
