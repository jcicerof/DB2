SELECT *                                                                00010000
  FROM SYSIBM.SYSDATABASE A,                                            00020000
       SYSIBM.SYSSTOGROUP B                                             00030000
 WHERE B.VCATNAME = 'EDIDA'                                             00040000
   AND A.STGROUP = B.NAME                                               00050000
