SELECT SUBSTR(CICL_LST_NM,1,4), COUNT(*)                                00010000
  FROM DB2CERT.CLIENT_TAB                                               00020000
 GROUP BY SUBSTR(CICL_LST_NM,1,4)                                       00030000
 ORDER BY 2 DESC                                                        00040000
