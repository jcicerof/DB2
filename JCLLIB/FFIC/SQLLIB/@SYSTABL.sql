SELECT TBCREATOR,TBNAME,NAME,COLNO,COLTYPE,LENGTH,SCALE,NULLS           00000103
  FROM SYSIBM.SYSCOLUMNS                                                00000203
 WHERE --TBCREATOR IN ('DB2TEST','DB2ACPT')                             00000303
       TBCREATOR IN ('PERPROD','DB2TEST','DB2ACPT')                     00000403
   AND TBNAME IN ('SRUT_CSU_PROD_HIST')                                 00000503
ORDER BY TBCREATOR,TBNAME,COLNO                                         00000603
;                                                                       00000703
SELECT B.TBCREATOR, B.TBNAME,B.CREATOR,B.NAME,B.UNIQUERULE,             00000800
       C.COLNAME,C.COLSEQ,C.ORDERING                                    00000900
  FROM SYSIBM.SYSTABLES A,                                              00001000
       SYSIBM.SYSINDEXES B,                                             00001100
       SYSIBM.SYSKEYS C                                                 00001200
 WHERE A.TYPE = 'T'                                                     00001300
   AND A.CREATOR = B.TBCREATOR                                          00001400
   AND A.NAME    = B.TBNAME                                             00001500
   AND B.CREATOR = C.IXCREATOR                                          00001600
   AND B.NAME    = C.IXNAME                                             00002000
   AND A.CREATOR IN ('PERPROD','DB2TEST','DB2ACPT')                     00003003
   AND A.NAME IN ('SRUT_CSU_PROD_HIST')                                 00004002
ORDER BY B.TBCREATOR, B.TBNAME,B.CREATOR,B.NAME,C.COLSEQ                01070001
;                                                                       01080003
