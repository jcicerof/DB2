SELECT DBNAME, TSNAME, DSNUM, MAX(DSNAME), MAX(TIMESTAMP), 'DB2P'       00010000
     , JOBNAME                                                          00011000
  FROM SYSIBM.SYSCOPY                                                   00012000
 WHERE DSNAME LIKE '%X.DB2P%'                                           00013000
   AND ICTYPE = 'F'                                                     00014000
   AND DBNAME IN ('DBCW0P00'                                            00015002
                 ,'DBCW0P01'                                            00015102
                 ,'DCBR0P00'                                            00015202
                 ,'DCLI0P00'                                            00015302
                 ,'DEIS0P00'                                            00015402
                 ,'DFWS0P01'                                            00015502
                 ,'DIAP0P02'                                            00015602
                 ,'DIAP0P03')                                           00015702
   AND TSNAME IN ('SALN0P00'                                            00015802
                 ,'SATN0P00'                                            00015902
                 ,'SBKN0P00'                                            00016002
                 ,'SBLN0P00'                                            00016102
                 ,'SCAS0P00'                                            00016202
                 ,'SCDP0P00'                                            00016302
                 ,'SFTP0P00'                                            00016402
                 ,'SSAS0P00'                                            00016502
                 ,'SSDP0P00'                                            00016602
                 ,'SSSP0P00'                                            00016702
                 ,'SUKS0P00'                                            00016802
                 ,'SEEN0P00'                                            00016902
                 ,'SEZN0P00'                                            00017002
                 ,'SACN0P00'                                            00017102
                 ,'SASN0P00'                                            00017202
                 ,'SBON0P00'                                            00017302
                 ,'SBSN0P00'                                            00017402
                 ,'SBUN0P00'                                            00017502
                 ,'SCAN0P00'                                            00017602
                 ,'SCBN0P00'                                            00017702
                 ,'SCDN0P00'                                            00017802
                 ,'SCEF0P00'                                            00017902
                 ,'SCIN0P00'                                            00018002
                 ,'SCLN0P00'                                            00018102
                 ,'SCME0P00'                                            00018202
                 ,'SCNN0P00'                                            00018302
                 ,'SCPN0P00'                                            00018402
                 ,'SCQN0P00'                                            00018502
                 ,'SCSN0P00'                                            00018602
                 ,'SCUN0P00'                                            00018702
                 ,'SCYN0P00'                                            00018802
                 ,'SDCN0P00'                                            00018902
                 ,'SDMN0P00'                                            00019002
                 ,'SDRN0P00'                                            00019102
                 ,'SDSN0P00'                                            00019202
                 ,'SEAN0P00'                                            00019302
                 ,'SECN0P00'                                            00019402
                 ,'SEDN0P00'                                            00019502
                 ,'SEEN0P00'                                            00019602
                 ,'SEFN0P00'                                            00019702
                 ,'SELN0P00'                                            00019802
                 ,'SEPN0P00'                                            00019902
                 ,'SERN0P00'                                            00020002
                 ,'SETN0P00'                                            00020102
                 ,'SFAN0P00'                                            00020202
                 ,'SFFN0P00'                                            00020302
                 ,'SFIN0P00'                                            00020402
                 ,'SHLN0P00'                                            00020502
                 ,'SICN0P00'                                            00020602
                 ,'SILN0P00'                                            00020702
                 ,'SIMN0P00'                                            00020802
                 ,'SIPN0P00'                                            00020902
                 ,'SKMN0P00'                                            00021002
                 ,'SLCN0P00'                                            00021102
                 ,'SLMN0P00'                                            00021202
                 ,'SLPN0P00'                                            00021302
                 ,'SMDN0P00'                                            00021402
                 ,'SMLN0P00'                                            00021502
                 ,'SMMN0P00'                                            00021602
                 ,'SMSN0P00'                                            00021702
                 ,'SNMN0P00'                                            00021802
                 ,'SNTN0P00'                                            00021902
                 ,'SPFN0P00'                                            00022002
                 ,'SPLN0P00'                                            00022102
                 ,'SPRN0P00'                                            00022202
                 ,'SPTS0P00'                                            00022302
                 ,'SQAN0P00'                                            00022402
                 ,'SQCN0P00'                                            00022502
                 ,'SQDN0P00'                                            00022602
                 ,'SQEN0P00'                                            00022702
                 ,'SQLN0P00'                                            00022802
                 ,'SQMN0P00'                                            00022902
                 ,'SQPN0P00'                                            00023002
                 ,'SQSN0P00'                                            00023102
                 ,'SQUN0P00'                                            00023202
                 ,'SRAN0P00'                                            00023302
                 ,'SRLN0P00'                                            00023402
                 ,'SSDN0P00'                                            00023502
                 ,'SSIN0P00'                                            00023602
                 ,'SSUN0P00'                                            00023702
                 ,'STLN0P00'                                            00023802
                 ,'STRN0P00'                                            00023902
                 ,'SUPN0P00'                                            00024002
                 ,'SUWN0P00'                                            00024102
                 ,'SVCN0P00'                                            00024202
                 ,'SISN0P00'                                            00024302
                 ,'SMVN0P00'                                            00024402
                 ,'SMXN0P00'                                            00024502
                 ,'SNDN0P00'                                            00024602
                 ,'SNHN0P00'                                            00024702
                 ,'SNRN0P00')                                           00024802
 GROUP BY DBNAME, TSNAME, DSNUM, JOBNAME                                00024900
 ORDER BY 5 DESC                                                        00025003
;                                                                       00030000