SELECT PQTY, SQTY,                                                      00010020
       PQTY*4, SQTY*4                                                   00010220
  FROM SYSIBM.SYSTABLEPART                                              00011018
 WHERE                                                                  00020018
       DBNAME = 'BMCCM62E'                                              00031019
   AND TSNAME = 'BMCCK'                                                 00031118
