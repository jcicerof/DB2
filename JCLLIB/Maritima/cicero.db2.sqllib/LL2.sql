--                                                                      00001015
-- SELECT HEX(START_RBA) FROM SYSIBM.SYSCOPY                            00010015
-- WHERE DBNAME = 'DBMA01'                                              00020015
--   AND ICTYPE = 'W'                                                   00030015
--   AND ICDATE = '081102'                                              00040015
--   AND TSNAME = 'SNITFIMG'                                            00041015
-- ORDER BY TIMESTAMP DESC                                              00050015
SELECT * FROM SYSIBM.SYSTABLES WHERE TSNAME = 'SNITFDSP' AND            00060015
DBNAME = 'DBMA01'                                                       00070015
