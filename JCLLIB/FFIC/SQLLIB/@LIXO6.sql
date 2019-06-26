SELECT '-DIS DB('||STRIP(DBNAME)||') SP('||STRIP(TSNAME)||              00002000
       ') RESTRICT LIMIT(*)'                                            00003000
  FROM SYSIBM.SYSTABLES                                                 00004000
 WHERE CREATOR = 'DB2ACPT'                                              00005000
   AND TYPE = 'T'                                                       00006000
   AND NAME IN ( 'MACA_S1_COMM_EMPL'                                    00010000
               , 'MACA_S2_OCEAN'                                        00020000
               , 'MACA_S3_COMM_LIAB'                                    00030000
               , 'MACA_S4_GLASS'                                        00040000
               , 'MACA_S5_BOIL_MACH'                                    00050000
               , 'MACA_S6_BUS_ASSET'                                    00060000
               , 'MACA_S7_PERS_AUTO'                                    00070000
               , 'MACA_S8_COMM_AUTO'                                    00080000
               , 'MACA_S9_RES_EMPLOY'                                   00090000
               , 'MACA_SA_WEST_GENRL'                                   00100000
               , 'MACA_SB_ENTERTAIN'                                    00110000
               , 'MACA_SC_UNSPEC_SAR'                                   00120000
               , 'MACA_SD_OBLIGATION'                                   00130000
               , 'MACA_SE_COMM_FARM'                                    00140000
               , 'MACA_SF_RES_RISK'                                     00150000
               , 'MACA_SG_RES_BUS'                                      00160000
               , 'MACA_SH_WATERCRAFT'                                   00170000
               , 'MACA_SI_SCHED_PERS'                                   00180000
               , 'MACA_SJ_COMP_SAR'                                     00190000
               , 'MACA_SK_PERS_BUS'                                     00200000
               , 'MACA_SL_ANIMAL_RSK'                                   00210000
               , 'MACA_SM_EVENT'                                        00220000
               , 'MACA_SN_COV_PERSON')                                  00230000
