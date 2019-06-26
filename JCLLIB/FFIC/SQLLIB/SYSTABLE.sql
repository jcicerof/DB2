--SELECT A.CREATOR, A.NAME, A.TSNAME, A.DBNAME, A.CARD, C.VCATNAME,     00010011
--       C.STORNAME, C.PQTY, C.SQTY, C.COMPRESS, C.FREEPAGE, C.PCTFREE, 00011011
--       C.PARTITION,                                                   00011111
--       B.PGSIZE                                                       00012011
SELECT *                                                                00013011
  FROM SYSIBM.SYSINDEXES A                                              00020011
     , SYSIBM.SYSINDEXPART  B                                           00021011
 WHERE B.IXCREATOR = A.CREATOR                                          00060011
   AND B.IXNAME = A.NAME                                                00070011
   AND B.VCATNAME = 'MAPDE'                                             00100011
;                                                                       00101011
FIM;                                                                    00102011
SELECT A.CREATOR, A.NAME, A.TSNAME, A.DBNAME, A.CARD, C.VCATNAME,       00110011
       C.STORNAME, C.PQTY, C.SQTY, C.COMPRESS, C.FREEPAGE, C.PCTFREE,   00120011
       C.PARTITION,                                                     00130011
       B.PGSIZE                                                         00140011
  FROM SYSIBM.SYSTABLES A                                               00150011
     , SYSIBM.SYSTABLESPACE B                                           00160011
     , SYSIBM.SYSTABLEPART C                                            00170011
-- WHERE (A.DBNAME LIKE 'DMAC%' OR                                      00180011
--       (A.CREATOR = 'ERSPROD' AND                                     00190011
--        SUBSTR(A.NAME,1,4) IN ('MACA', 'MACT')))                      00200011
 WHERE A.DBNAME = B.DBNAME                                              00210011
   AND A.TSNAME = B.NAME                                                00220011
   AND C.DBNAME = A.DBNAME                                              00230011
   AND C.TSNAME = A.TSNAME                                              00240011
   AND C.VCATNAME = 'MAPDE'                                             00250011
