SELECT COUNT(*)                                                         00010006
  FROM SYSIBM.SYSTABLES                                                 00020006
 WHERE CREATOR = 'DB2TEST'                                              00030012
   AND TYPE ='T'                                                        00040006
;                                                                       00071004
SELECT GRANTEE,COUNT(*)                                                 00080004
  FROM SYSIBM.SYSTABAUTH                                                00090004
 WHERE TCREATOR = 'DB2TEST'                                             00100012
   AND GRANTEE LIKE 'ZZ%AP'                                             00120011
 GROUP BY GRANTEE                                                       00140004
 ORDER BY 2 DESC                                                        00150010
