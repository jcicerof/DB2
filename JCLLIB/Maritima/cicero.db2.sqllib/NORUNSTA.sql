-- LISTA PARTICOES DO TABLESPACE                                        00010002
  SELECT DISTINCT                                                       00020008
  'INCLUDE TABLESPACE '||STRIP(B.DBNAME)||'.'||STRIP(B.TSNAME)          00020108
           FROM SYSIBM.SYSTABLEPART  A,                                 00021005
                SYSIBM.SYSTABLES     B                                  00030002
   WHERE B.TYPE ='T'                                                    00060003
     AND A.TSNAME = B.TSNAME                                            00070002
     AND A.DBNAME  = B.DBNAME                                           00080002
     AND A.CARDF = -1                                                   00090002
     AND B.DBNAME LIKE 'DB%'                                            00090107
--   AND B.NAME = 'IBMSNAP_UOW'                                         00091003
--   AND B.CREATOR  = 'ASN'                                             00092003
UNION                                                                   00100006
-- LISTA INDEXPART                                                      00120002
  SELECT DISTINCT                                                       00130008
  'INCLUDE TABLESPACE '||STRIP(C.DBNAME)||'.'||STRIP(C.TSNAME)          00130108
           FROM SYSIBM.SYSINDEXES A                                     00131005
              , SYSIBM.SYSINDEXPART B                                   00140002
              , SYSIBM.SYSTABLES    C                                   00141002
   WHERE B.IXNAME = A.NAME                                              00170003
     AND B.IXCREATOR = A.CREATOR                                        00180002
     AND C.CREATOR = A.TBCREATOR                                        00181002
     AND C.NAME    = A.NAME                                             00182002
     AND B.CARDF = -1                                                   00183002
     AND C.DBNAME LIKE 'DB%'                                            00183107
--   AND A.TBNAME = 'IBMSNAP_UOW'                                       00183203
--   AND A.TBCREATOR = 'ASN'                                            00183303
  FOR READ ONLY WITH UR;                                                00184003
                                                                        00200002
