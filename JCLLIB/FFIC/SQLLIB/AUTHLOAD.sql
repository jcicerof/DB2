SELECT A.CREATOR, A.NAME, A.DBNAME, A.TSNAME,                           00010002
       B.GRANTEE,B.GRANTEDTS                                            00011002
  FROM SYSIBM.SYSTABLES A,                                              00020000
       SYSIBM.SYSDBAUTH B                                               00030000
 WHERE A.NAME = 'CLT_ADR_SEARCH'                                        00040000
   AND A.TYPE ='T'                                                      00050000
   AND A.DBNAME = B.NAME                                                00060000
-- AND A.CREATOR = B.                                                   00070000
   AND B.LOADAUTH ='Y'                                                  00080000
   AND B.GRANTEE LIKE 'ZZ%'                                             00081001
                                                                        00090000
