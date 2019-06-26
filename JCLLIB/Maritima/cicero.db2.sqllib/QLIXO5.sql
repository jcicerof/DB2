SELECT                                                                  00001017
'SELECT '||''''||STRIP(NAME)||''''||                                    00001117
', COUNT(*) FROM '||STRIP(CREATOR)||'.'||STRIP(NAME)||' WITH UR;'       00001218
  FROM SYSIBM.SYSTABLES                                                 00002115
 WHERE TYPE = 'T'                                                       00002215
   AND CREATOR = 'DB2PDPRC'                                             00002316
FOR FETCH ONLY WITH UR;                                                 00002809
