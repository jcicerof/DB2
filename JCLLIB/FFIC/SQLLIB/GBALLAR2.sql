SELECT DISTINCT 'DB2Q;' ||                                              00010003
       A.GRANTEE || ';' || B.DBNAME || ';' ||                           00030000
       A.TCREATOR || ';' || A.TTNAME || ';' ||                          00050000
       A.DELETEAUTH || ';' || A.INSERTAUTH || ';' ||                    00070000
       A.UPDATEAUTH  || ';'                                             00090000
  FROM SYSIBM.SYSTABAUTH A,                                             00110000
       SYSIBM.SYSTABLES  B                                              00130000
 WHERE A.TCREATOR = B.CREATOR                                           00150000
   AND A.TTNAME   = B.NAME                                              00170000
   AND B.TYPE ='T'                                                      00190000
   AND A.GRANTEETYPE = ' '                                              00210000
   AND (A.DELETEAUTH = 'Y' OR                                           00230000
        A.INSERTAUTH = 'Y' OR                                           00250000
        A.UPDATEAUTH = 'Y')                                             00260000
;                                                                       00280000
