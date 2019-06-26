SELECT                                                                  00010000
A.CREATOR,A.NAME,A.DBNAME,A.TYPE,A.TSNAME,B.NTABLES,B.PARTITIONS,       00020008
'DROP TABLESPACE '||STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME)||';'          00021004
  FROM SYSIBM.SYSTABLES A,                                              00030000
       SYSIBM.SYSTABLESPACE B                                           00040000
 WHERE B.DBNAME = A.DBNAME                                              00050000
   AND B.NAME   = A.TSNAME                                              00060000
   AND A.TYPE IN ('T','V')                                              00070006
   AND A.NAME IN ('PC_COMMON_MSC_RT'                                    00080001
                 ,'PC_COMMON_MSC_RT_V'                                  00090001
                 ,'PC_COMMON_RT'                                        00100001
                 ,'PC_COMMON_RT_V'                                      00110001
                 ,'WARP_ALGORITHM_MST'                                  00120001
                 ,'WARP_ALGORITHM_M_V'                                  00130003
                 ,'WARP_ALGO_SEQ'                                       00140001
                 ,'WARP_ALGO_SEQ_V'                                     00150001
                 ,'POL_RATE_DATE'                                       00160001
                 ,'POL_RATE_DATE_V')                                    00170001
   AND A.CREATOR IN ('QSTTEST', 'QSTACPT','QSTPROD')                    00180006
