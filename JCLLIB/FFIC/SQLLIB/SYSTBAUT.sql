SELECT DISTINCT 'DB2Q',                                                 00010028
       A.GRANTEE, B.DBNAME, A.TCREATOR, A.TTNAME,                       00010123
       A.DELETEAUTH,A.INSERTAUTH,A.UPDATEAUTH                           00011022
  FROM SYSIBM.SYSTABAUTH A,                                             00020018
       SYSIBM.SYSTABLES  B                                              00030018
 WHERE A.TCREATOR = B.CREATOR                                           00030229
   AND A.TTNAME   = B.NAME                                              00030318
   AND B.TYPE ='T'                                                      00030419
   AND A.GRANTEETYPE = ' '                                              00030518
   AND (A.DELETEAUTH = 'Y' OR                                           00030726
        A.INSERTAUTH = 'Y' OR                                           00030818
        A.UPDATEAUTH = 'Y')                                             00030918
;                                                                       00060002
