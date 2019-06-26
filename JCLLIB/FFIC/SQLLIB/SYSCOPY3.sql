SELECT *                                                                00030000
FROM SYSIBM.SYSCOPY                                                     00060000
 WHERE DBNAME IN ('DBCW0P00'                                            00070000
                 ,'DBCW0P01'                                            00080000
                 ,'DBCW0P02'                                            00090000
                 ,'DBCW0P03'                                            00100000
                 ,'DBCW0P04'                                            00110000
                 ,'DCLI0P00'                                            00120000
                 ,'DCLI0P01'                                            00130000
                 ,'DPMX0P00'                                            00140000
                 ,'DPMX0P01'                                            00150000
                 ,'DPMX0P02'                                            00160000
                 ,'DPMX0P03'                                            00170000
                 ,'DPMX0P04'                                            00180000
                 ,'DPMX0P05'                                            00190000
                 ,'DPMX0P99')                                           00200000
   AND TIMESTAMP >= '2011-04-30-00.00.00.000000'                        00210000
   AND ICTYPE ='F'                                                      00220000
   AND ICBACKUP= ' '                                                    00220100
