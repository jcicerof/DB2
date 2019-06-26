SELECT                                                                  00120005
'ALTER INDEX '||STRIP(C.CREATOR)||'.'||STRIP(C.NAME)||                  00120105
' PRIQTY 50000 SECQTY 128000;'                                          00120205
  FROM SYSIBM.SYSTABLES A,                                              00150000
       SYSIBM.SYSINDEXPART B,                                           00160000
       SYSIBM.SYSINDEXES    C                                           00170000
 WHERE A.CREATOR= C.TBCREATOR                                           00180000
   AND A.NAME   = C.TBNAME                                              00190000
   AND C.CREATOR = B.IXCREATOR                                          00200000
   AND C.NAME = B.IXNAME                                                00210000
   AND A.TYPE = 'T'                                                     00220000
   AND STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME) IN (                       00220201
 'DMAC1P01.SA1S1P01'                                                    00230304
,'DMAC1P02.SS1S1P02'                                                    00230404
,'DMAC1P03.SS3S1P03'                                                    00230504
,'DMAC1P01.SCDP1P01'                                                    00230604
,'DMAC1P05.SS7S1P05'                                                    00230704
,'DMAC1P05.SS8S1P05'                                                    00230804
,'DATM0P00.SCDP0P00'                                                    00230901
,'DMAC1P04.SS6S1P04'                                                    00231004
,'DMAC1P09.SSFS1P09'                                                    00232004
,'DMAC1P02.SS2S1P02'                                                    00233004
,'DMAC1P08.SSDS1P08'                                                    00234004
,'DMAC1P06.SSAS1P06'                                                    00235004
,'DMAC1P01.SCVN1P01'                                                    00236004
,'DMAC1P07.SSBS1P07'                                                    00237004
,'DMAC1P06.SS9S1P06'                                                    00238004
,'DMAC1P10.SSIS1P10'                                                    00239004
,'DMAC1P08.SSES1P08'                                                    00240004
,'DMAC1P11.SSJS1P11'                                                    00250004
,'DMAC1P13.SSNS1P13'                                                    00260004
,'DMAC1P04.SS5S1P04'                                                    00270004
,'DMAC1P01.SCTN1P01'                                                    00280004
,'DMAC1P10.SSHS1P10'                                                    00290004
,'DMAC1P03.SS4S1P03'                                                    00300004
,'DMAC1P07.SSCS1P07'                                                    00310004
,'DMAC1P11.SSKS1P11'                                                    00320004
,'DMAC1P12.SSMS1P12'                                                    00330004
,'DMAC1P09.SSGS1P09'                                                    00340004
,'DMAC1P12.SSLS1P12')                                                   00350004
ORDER BY B.PQTY DESC                                                    00360003
