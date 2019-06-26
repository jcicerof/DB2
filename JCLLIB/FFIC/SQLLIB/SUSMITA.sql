-- FROM                                                                 00010007
SELECT CHAR(STRIP(C.CREATOR)||'.'||STRIP(C.NAME),32) AS TABLE_NAME,     00010109
       CHAR(STRIP(A.DBNAME)||'.'||STRIP(A.NAME),24) AS SPACENAME,       00010208
       A.PARTITIONS,A.SEGSIZE,                                          00010311
       B.PARTITION,B.PQTY,B.SQTY,B.VCATNAME                             00011010
  FROM SYSIBM.SYSTABLESPACE A,                                          00020003
       SYSIBM.SYSTABLEPART B,                                           00021008
       SYSIBM.SYSTABLES C                                               00022008
 WHERE A.DBNAME = B.DBNAME                                              00030003
   AND A.NAME   = B.TSNAME                                              00030104
   AND C.DBNAME = A.DBNAME                                              00030208
   AND C.TSNAME = A.NAME                                                00030308
   AND C.TYPE   = 'T'                                                   00030408
   AND STRIP(A.DBNAME)||'.'||STRIP(A.NAME) IN (                         00031003
 'DMACAP01.SA1LAP01'                                                    00040000
,'DATM0P00.SCDP0P00'                                                    00050000
,'DMACAP01.SCDNAP01'                                                    00060000
,'DMACAP01.SCTNAP01'                                                    00070000
,'DMACAP01.SCVNAP01'                                                    00080000
,'DMACAP02.SS1LAP02'                                                    00090000
,'DMACAP02.SS2NAP02'                                                    00100000
,'DMACAP03.SS3PAP03'                                                    00110000
,'DMACAP03.SS4NAP03'                                                    00120000
,'DMACAP04.SS5NAP04'                                                    00130000
,'DMACAP04.SS6NAP04'                                                    00140000
,'DMACAP05.SS7NAP05'                                                    00150000
,'DMACAP05.SS8NAP05'                                                    00160000
,'DMACAP06.SS9NAP06'                                                    00170000
,'DMACAP06.SSANAP06'                                                    00180000
,'DMACAP07.SSBNAP07'                                                    00190000
,'DMACAP07.SSCNAP07'                                                    00200000
,'DMACAP08.SSDNAP08'                                                    00210000
,'DMACAP08.SSENAP08'                                                    00220000
,'DMACAP09.SSFNAP09'                                                    00230000
,'DMACAP09.SSGNAP09'                                                    00240000
,'DMACAP10.SSHNAP10'                                                    00250000
,'DMACAP10.SSINAP10'                                                    00260000
,'DMACAP11.SSJNAP11'                                                    00270000
,'DMACAP11.SSKNAP11'                                                    00280000
,'DMACAP12.SSLNAP12'                                                    00290000
,'DMACAP12.SSMNAP12'                                                    00300000
,'DMACAP13.SSNSAP13');                                                  00310007
                                                                        00311007
-- TO                                                                   00320007
SELECT CHAR(STRIP(C.CREATOR)||'.'||STRIP(C.NAME),32) AS TABLE_NAME,     00321009
       CHAR(STRIP(A.DBNAME)||'.'||STRIP(A.NAME),24) AS SPACENAME,       00322008
       A.PARTITIONS,A.SEGSIZE,                                          00322111
       B.PARTITION,B.PQTY,B.SQTY,B.VCATNAME                             00324110
  FROM SYSIBM.SYSTABLESPACE A,                                          00325008
       SYSIBM.SYSTABLEPART B,                                           00326008
       SYSIBM.SYSTABLES C                                               00327008
 WHERE A.DBNAME = B.DBNAME                                              00328008
   AND A.NAME   = B.TSNAME                                              00329008
   AND C.DBNAME = A.DBNAME                                              00329108
   AND C.TSNAME = A.NAME                                                00329208
   AND C.TYPE   = 'T'                                                   00329308
   AND STRIP(A.DBNAME)||'.'||STRIP(A.NAME) IN (                         00400007
 'DMAC1P01.SA1S1P01'                                                    00410007
,'DMAC1P01.SCDP1P01'                                                    00430007
,'DMAC1P01.SCTN1P01'                                                    00440007
,'DMAC1P01.SCVN1P01'                                                    00450007
,'DMAC1P02.SS1S1P02'                                                    00460007
,'DMAC1P02.SS2S1P02'                                                    00470007
,'DMAC1P03.SS3S1P03'                                                    00480007
,'DMAC1P03.SS4S1P03'                                                    00490007
,'DMAC1P04.SS5S1P04'                                                    00500007
,'DMAC1P04.SS6S1P04'                                                    00510007
,'DMAC1P05.SS7S1P05'                                                    00520007
,'DMAC1P05.SS8S1P05'                                                    00530007
,'DMAC1P06.SS9S1P06'                                                    00540007
,'DMAC1P06.SSAS1P06'                                                    00550007
,'DMAC1P07.SSBS1P07'                                                    00560007
,'DMAC1P07.SSCS1P07'                                                    00570007
,'DMAC1P08.SSDS1P08'                                                    00580007
,'DMAC1P08.SSES1P08'                                                    00590007
,'DMAC1P09.SSFS1P09'                                                    00600007
,'DMAC1P09.SSGS1P09'                                                    00610007
,'DMAC1P10.SSHS1P10'                                                    00620007
,'DMAC1P10.SSIS1P10'                                                    00630007
,'DMAC1P11.SSJS1P11'                                                    00640007
,'DMAC1P11.SSKS1P11'                                                    00650007
,'DMAC1P12.SSLS1P12'                                                    00660007
,'DMAC1P12.SSMS1P12'                                                    00670007
,'DMAC1P13.SSNS1P13')                                                   00680007
