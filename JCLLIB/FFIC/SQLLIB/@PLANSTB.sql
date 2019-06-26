SELECT 'DB2Q', A.CREATOR, A.NAME, A.DBNAME, A.TSNAME,                   00010032
       A.CREATEDBY, A.CREATEDTS, B.NTABLES                              00011016
  FROM SYSIBM.SYSTABLES A,                                              00020016
       SYSIBM.SYSTABLESPACE B                                           00021017
 WHERE (A.DBNAME LIKE 'DSNDB%' OR A.DBNAME LIKE 'BMC%')                 00030024
   AND A.TYPE = 'T'                                                     00040016
   AND A.CREATOR <> 'SYSIBM'                                            00050016
   AND A.DBNAME = B.DBNAME                                              00060016
   AND A.TSNAME = B.NAME                                                00070016
   AND A.NAME IN ('DSN_STATEMNT_TABLE',                                 00080025
                  'COST_TABLE',                                         00090025
                  'STRUCTURE_TABLE',                                    00100025
                  'PREDICATE_TABLE',                                    00110025
                  'PLAN_TABLE')                                         00120025
