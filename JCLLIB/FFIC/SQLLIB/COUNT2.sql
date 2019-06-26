SELECT COUNT(DISTINCT(TSNAME))                                          00001007
  FROM SYSIBM.SYSCOPY                                                   00001107
 WHERE SUBSTR(DSNAME,4,1) <> 'X'                                        00002005
   AND ICDATE > '110301'                                                00003006
   AND ICTYPE = 'F' ;                                                   00004006
                                                                        00005008
SELECT COUNT(*) FROM SYSIBM.SYSTABLESPACE;                              00020002
                                                                        00021008
SELECT CREATOR,COUNT(*)                                                 00030008
  FROM SYSIBM.SYSTABLESPACE                                             00040008
 GROUP BY CREATOR;                                                      00050008
SELECT COUNT(*) FROM SYSIBM.SYSTABLESPACE;                              00060008
