SELECT DISTINCT STRIP(A.VCATNAME)||'.DSNDB*',COUNT(*)                   00041106
  FROM SYSIBM.SYSTABLEPART A,                                           00042002
       SYSIBM.SYSTABLES B                                               00043002
 WHERE (SUBSTR(A.DBNAME,1,4) ='DMAP'                                    00044002
        OR A.DBNAME IN ('DFCA1MAT'                                      00044104
                     ,'DFDB2DPB'                                        00044203
                     ,'DMAD0P00'                                        00044303
                     ,'DRPT1MAT'                                        00044403
                     ,'DSEP1SCC'                                        00044503
                     ,'DSEP1VLB'                                        00044603
                     ,'DATM0P00'                                        00044803
                     ,'DCBR0P00'                                        00044903
                     ,'DCDI0P19'                                        00045003
                     ,'DERS0P00'                                        00045103
                     ,'DJHC0P00'                                        00045203
                     ,'DJHP0P00'                                        00045303
                     ,'DMAAAP01'                                        00045403
                     ,'DPRO0P00'))                                      00045703
   AND B.TYPE      = 'T'                                                00045802
   AND A.DBNAME = B.DBNAME                                              00046002
   AND A.TSNAME = B.TSNAME                                              00047002
GROUP BY STRIP(A.VCATNAME)||'.DSNDB*';                                  00048007
SELECT DISTINCT STRIP(C.VCATNAME)||'.DSNDB*',COUNT(*)                   00181007
  FROM SYSIBM.SYSTABLES A,                                              00190007
       SYSIBM.SYSINDEXES B,                                             00200007
       SYSIBM.SYSINDEXPART C                                            00210007
 WHERE (SUBSTR(A.DBNAME,1,4) ='DMAP'                                    00211007
        OR A.DBNAME IN ('DFCA1MAT'                                      00212007
                     ,'DFDB2DPB'                                        00213007
                     ,'DMAD0P00'                                        00214007
                     ,'DRPT1MAT'                                        00215007
                     ,'DSEP1SCC'                                        00216007
                     ,'DSEP1VLB'                                        00217007
                     ,'DATM0P00'                                        00218007
                     ,'DCBR0P00'                                        00219007
                     ,'DCDI0P19'                                        00219107
                     ,'DERS0P00'                                        00219207
                     ,'DJHC0P00'                                        00219307
                     ,'DJHP0P00'                                        00219407
                     ,'DMAAAP01'                                        00219507
                     ,'DPRO0P00'))                                      00219607
   AND B.TBCREATOR = A.CREATOR                                          00230007
   AND B.TBNAME    = A.NAME                                             00240007
   AND A.TYPE      = 'T'                                                00250007
   AND B.CREATOR   = C.IXCREATOR                                        00260007
   AND B.NAME      = C.IXNAME                                           00270007
GROUP BY STRIP(C.VCATNAME)||'.DSNDB*'                                   00271007
;                                                                       00280007
