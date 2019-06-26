--SELECT DISTINCT VCATNAME                                              00010002
--  FROM SYSIBM.SYSSTOGROUP                                             00020002
--;                                                                     00030002
SELECT 'TS', A.VCATNAME,A.DBNAME,A.TSNAME,A.PARTITION,                  00040007
       B.CREATOR, B.NAME, B.CREATOR, B.NAME                             00041007
  FROM SYSIBM.SYSTABLEPART A,                                           00050007
       SYSIBM.SYSTABLES B                                               00051007
 WHERE SUBSTR(A.DBNAME,1,4) IN ('DMAA', 'DMAC', 'DMAP')                 00060009
   AND B.TYPE      = 'T'                                                00061007
   AND A.DBNAME = B.DBNAME                                              00062007
   AND A.TSNAME = B.TSNAME                                              00063007
UNION ALL                                                               00070005
SELECT 'IX', C.VCATNAME,A.DBNAME,B.INDEXSPACE,C.PARTITION,              00080008
       B.CREATOR, B.NAME, A.CREATOR, A.NAME                             00081007
  FROM SYSIBM.SYSTABLES A,                                              00090004
       SYSIBM.SYSINDEXES B,                                             00091004
       SYSIBM.SYSINDEXPART C                                            00092004
 WHERE SUBSTR(A.DBNAME,1,4) IN ('DMAA', 'DMAC', 'DMAP')                 00100004
   AND B.TBCREATOR = A.CREATOR                                          00101004
   AND B.TBNAME    = A.NAME                                             00102004
   AND A.TYPE      = 'T'                                                00103004
   AND B.CREATOR   = C.IXCREATOR                                        00104004
   AND B.NAME      = C.IXNAME                                           00105004
;                                                                       00110004
