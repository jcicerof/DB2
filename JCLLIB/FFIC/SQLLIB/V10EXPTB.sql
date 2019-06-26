SELECT DISTINCT DBNAME,CREATOR                                          00010001
  FROM SYSIBM.SYSTABLES                                                 00020000
 WHERE NAME = 'PLAN_TABLE'                                              00030000
   AND TYPE = 'T'                                                       00040000
