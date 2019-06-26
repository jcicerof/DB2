SELECT A.DATA,                                                          00015403
   A.DSNAME,A.HI_A_RBA,A.HI_U_RBA,A.DBNAME,A.SPACENAM,A.EXTENTS,        00015503
   B.CREATOR, B.NAME                                                    00015603
  FROM DBA1ADM.HSTVSAM A,                                               00015703
       SYSIBM.SYSTABLES B                                               00015803
   WHERE A.DBNAME LIKE 'DSN%'                                           00015904
     AND A.DATA = (SELECT MAX(A.DATA) FROM DBA1ADM.HSTVSAM A)           00016004
     AND A.DBNAME = B.DBNAME                                            00016103
     AND A.SPACENAM = B.TSNAME                                          00016203
     AND B.TYPE = 'T'                                                   00016303
;                                                                       00017000
