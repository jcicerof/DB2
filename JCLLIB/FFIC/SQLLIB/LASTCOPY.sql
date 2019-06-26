SELECT DBNAME, TSNAME, CREATOR, NAME                                    00010008
  FROM SYSIBM.SYSTABLES                                                 00020008
 WHERE DBNAME = 'DUBS0P00'                                              00030000
   AND TYPE = 'T'                                                       00040008
 ORDER BY CREATOR, NAME;                                                00040108
                                                                        00041008
-- ORDER BY DBNAME, TSNAME, TIMESTAMP DESC                              00050007
--SELECT DBNAME, TSNAME, DSNAME, ICDATE, ICTIME, TIMESTAMP              00060008
  FROM SYSIBM.SYSCOPY                                                   00070008
 WHERE DBNAME = 'DUBS0P00'                                              00080008
   AND ICTYPE = 'F'                                                     00090008
   AND ICDATE = '151010'                                                00100008
   AND DSNAME LIKE 'UBSE%'                                              00110008
-- ORDER BY DBNAME, TSNAME, TIMESTAMP DESC                              00120008
