SELECT                                                                  00010002
'ALTER TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(TSNAME)||                00011002
' COMPRESS YES;'                                                        00012002
  FROM SYSIBM.SYSTABLEPART                                              00020000
 WHERE COMPRESS <> 'Y'                                                  00030001
   AND STRIP(DBNAME)||'.'||STRIP(TSNAME) IN (                           00031001
      'DMAC1P01.SA1S1P01'                                               00040000
     ,'DMAC1P02.SS1S1P02'                                               00050000
     ,'DMAC1P03.SS3S1P03'                                               00060000
     ,'DMAC1P01.SCDP1P01'                                               00070000
     ,'DMAC1P05.SS7S1P05'                                               00080000
     ,'DMAC1P05.SS8S1P05'                                               00090000
     ,'DMAC1P04.SS6S1P04'                                               00100000
     ,'DMAC1P09.SSFS1P09'                                               00110000
     ,'DMAC1P02.SS2S1P02'                                               00120000
     ,'DMAC1P08.SSDS1P08'                                               00130000
     ,'DMAC1P06.SSAS1P06'                                               00140000
     ,'DMAC1P01.SCVN1P01'                                               00150000
     ,'DMAC1P07.SSBS1P07'                                               00160000
     ,'DMAC1P06.SS9S1P06'                                               00170000
     ,'DMAC1P10.SSIS1P10'                                               00180000
     ,'DMAC1P08.SSES1P08'                                               00190000
     ,'DMAC1P11.SSJS1P11'                                               00200000
     ,'DMAC1P13.SSNS1P13'                                               00210000
     ,'DMAC1P04.SS5S1P04'                                               00220000
     ,'DMAC1P01.SCTN1P01'                                               00230000
     ,'DMAC1P10.SSHS1P10'                                               00240000
     ,'DMAC1P03.SS4S1P03'                                               00250000
     ,'DMAC1P07.SSCS1P07'                                               00260000
     ,'DMAC1P11.SSKS1P11'                                               00270000
     ,'DMAC1P12.SSMS1P12'                                               00280000
     ,'DMAC1P09.SSGS1P09'                                               00290000
     ,'DMAC1P12.SSLS1P12')                                              00300000
