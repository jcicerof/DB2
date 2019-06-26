SELECT TBCREATOR,TBNAME,NAME,COLNO,COLTYPE,LENGTH,SCALE,NULLS           00001000
  FROM SYSIBM.SYSCOLUMNS                                                00002000
 WHERE --TBCREATOR IN ('DB2TEST','DB2ACPT')                             00011003
       TBNAME IN ('SRUT_CSU_PROD_HIST')                                 00012003
ORDER BY TBCREATOR,TBNAME,COLNO                                         01120004
