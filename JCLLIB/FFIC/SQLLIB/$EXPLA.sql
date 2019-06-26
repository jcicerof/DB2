SELECT CIPO_TCH_OBJ_KEY, COUNT(*)                                       00010000
  FROM DB2ACPT.CLIENT_POLICY                                            00030000
 GROUP BY CIPO_TCH_OBJ_KEY                                              00040000
 ORDER BY 2 DESC                                                        00050001
 FETCH FIRST 10 ROWS ONLY;                                              00060001
