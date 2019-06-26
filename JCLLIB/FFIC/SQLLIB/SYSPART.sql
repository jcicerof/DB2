SELECT DISTINCT DBNAME,NAME,PARTITIONS,TYPE,DSSIZE,'DB2Q'               00010032
  FROM SYSIBM.SYSTABLESPACE                                             00020020
WHERE PARTITIONS > 0                                                    00030020
UNION ALL                                                               00041020
SELECT DISTINCT A.DBNAME,A.INDEXSPACE,MAX(B.PARTITION),'IX',            00050027
                A.PIECESIZE,'DB2Q'                                      00051032
  FROM SYSIBM.SYSINDEXES A,                                             00060020
       SYSIBM.SYSINDEXPART B                                            00060120
 WHERE B.PARTITION <> 0                                                 00061020
   AND A.NAME = B.IXNAME                                                00062020
   AND A.CREATOR = B.IXCREATOR                                          00063020
 GROUP BY A.DBNAME,A.INDEXSPACE,'IX',A.PIECESIZE,'DB2Q'                 00064032
