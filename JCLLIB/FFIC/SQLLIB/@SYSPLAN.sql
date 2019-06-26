SELECT COLLID, NAME, OWNER, CREATOR, QUALIFIER,TIMESTAMP,               00004104
       BINDTIME,VALID, OPERATIVE,VALIDATE,ISOLATION,PDSNAME             00004204
  FROM SYSIBM.SYSPACKAGE                                                00004304
 WHERE NAME = 'CDITUCLU'                                                00004404
;                                                                       00004504
FIM;                                                                    00005002
SELECT DISTINCT C.COLLID, C.NAME, C.OWNER, C.CREATOR, C.QUALIFIER       00010000
  FROM SYSIBM.SYSPACKDEP A,                                             00020000
       SYSIBM.SYSTABLES  B,                                             00021000
       SYSIBM.SYSPACKAGE C                                              00022000
 WHERE A.BTYPE ='T'                                                     00030000
   AND A.BQUALIFIER = B.CREATOR                                         00040000
   AND A.BNAME      = B.NAME                                            00050000
   AND B.TYPE       = 'T'                                               00060000
   AND B.DBNAME     = 'DIRB0AAS'                                        00070000
   AND C.COLLID     = A.DCOLLID                                         00080000
   AND C.NAME       = A.DNAME                                           00090000
