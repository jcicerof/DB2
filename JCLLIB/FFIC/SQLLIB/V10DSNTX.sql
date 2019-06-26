--*DSNTXTA                                                              00040000
SELECT DISTINCT                                                         00041000
  'DSNTXTA DB2J DB2PROD '||STRIP(CREATOR)                               00050002
  FROM SYSIBM.SYSTABLES                                                 00070000
 WHERE TYPE = 'T'                                                       00080000
   AND NAME = 'PLAN_TABLE'                                              00090000
;                                                                       00091001
--*DSNTXTB                                                              00092000
SELECT DISTINCT                                                         00100001
  'DSNTXTB DB2J DB2PROD '||STRIP(CREATOR)||' '||STRIP(DBNAME)||' +',    00110002
  DBNAME,CREATOR,1,CARDF                                                00111003
  FROM SYSIBM.SYSTABLES                                                 00120001
 WHERE TYPE = 'T'                                                       00130001
   AND NAME = 'PLAN_TABLE'                                              00140001
UNION ALL                                                               00141001
SELECT DISTINCT                                                         00150001
  ' SDBA0T4K SDBA0T8K SDBA0T16 SDBA0L8K SDBA0L32',                      00170004
  DBNAME,CREATOR,2, CARDF                                               00171003
  FROM SYSIBM.SYSTABLES                                                 00180001
 WHERE TYPE = 'T'                                                       00190001
   AND NAME = 'PLAN_TABLE'                                              00200001
ORDER BY 5 DESC, 2,3,4                                                  00210003
;                                                                       00220001
