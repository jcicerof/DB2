SELECT NAME, DBNAME, HEX(DBID), HEX(PSID)                               00010006
 FROM SYSIBM.SYSTABLESPACE                                              00020006
 WHERE NAME ='CORRETOR'                                                 00030006
FOR FETCH ONLY WITH UR;                                                 00040003
