  SELECT * FROM SYSIBM.SYSTABLESPACE                                    00010001
   WHERE DBNAME = 'DBEEOR'                                              00011011
     AND NAME = 'ORCISQCA'                                              00011111
-- WHERE PARTITIONS > 1                                                 00011211
-- WHERE BPOOL = 'BP0'                                                  00011311
--   AND CREATOR <> 'SYSIBM'                                            00012003
  WITH UR;                                                              00030000
  SELECT * FROM SYSIBM.SYSTABLES                                        00040012
   WHERE DBNAME = 'DBEEOR'                                              00041012
     AND TSNAME = 'ORCISQCA'                                            00042012
  WITH UR;                                                              00090012
