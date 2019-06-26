-- SELECT MAX(TIMESTAMP) FROM DB2TEST.PLAN_TABLE                        00010002
                                                                        00020002
SELECT 'SELECT '||''''||                                                00030023
       STRIP(CREATOR)||'.'||STRIP(NAME)||''''||                         00031020
       ',MAX(TIMESTAMP) FROM '||                                        00040022
       STRIP(CREATOR)||'.'||STRIP(NAME)||';'                            00041015
  FROM SYSIBM.SYSTABLES                                                 00050002
 WHERE NAME = 'PLAN_TABLE'                                              00060002
   AND TYPE = 'T'                                                       00070002
