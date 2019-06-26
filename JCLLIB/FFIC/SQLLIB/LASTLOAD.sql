SELECT DISTINCT JOBNAME                                                 00010002
  FROM SYSIBM.SYSCOPY A,                                                00020001
       SYSIBM.SYSTABLESPACE B                                           00021000
 WHERE A.DBNAME = B.DBNAME                                              00030000
   AND A.TSNAME = B.NAME                                                00040000
   AND B.CREATOR IN ('DB2ACP2','DB2CER2', 'DB2PRV2')                    00050006
   AND A.ICTYPE = 'S'                                                   00060002
