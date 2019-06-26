--*DSNTXTA                                                              00040000
SELECT DISTINCT                                                         00041000
  'DSNTXTA DB2A DBA1ADM '||STRIP(CREATOR)                               00050000
  FROM SYSIBM.SYSTABLES                                                 00070000
 WHERE TYPE = 'T'                                                       00080000
   AND NAME = 'PLAN_TABLE'                                              00090000
                                                                        00091000
--*DSNTXTB                                                              00092000
--                                                                      00093000
--SELECT DISTINCT                                                       00100000
--  'DSNTXTB DB2A DB2PROD '||STRIP(CREATOR)||' '||STRIP(DBNAME)||' +',  00110000
--  DBNAME,CREATOR,1                                                    00111000
--  FROM SYSIBM.SYSTABLES                                               00120000
-- WHERE TYPE = 'T'                                                     00130000
--   AND NAME = 'PLAN_TABLE'                                            00140000
--UNION ALL                                                             00141000
--SELECT DISTINCT                                                       00150000
--  ' SDBA0T4K SDBA0T8K SDBA0T16 SDBA0T8K SDBA0T32',                    00170000
--  DBNAME,CREATOR,2                                                    00171000
--  FROM SYSIBM.SYSTABLES                                               00180000
-- WHERE TYPE = 'T'                                                     00190000
--   AND NAME = 'PLAN_TABLE'                                            00200000
--ORDER BY 2,3,4                                                        00210000
