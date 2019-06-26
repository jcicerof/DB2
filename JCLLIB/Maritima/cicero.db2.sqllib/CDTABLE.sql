--                                                                      00001006
-- CHANGE TABLE NAME AND CREATOR                                        00002006
--                                                                      00003006
                                                                        00003106
-- LISTA TABLESPACES                                                    00003206
  SELECT * FROM SYSIBM.SYSTABLESPACE A,                                 00003306
                SYSIBM.SYSTABLES     B                                  00003406
   WHERE B.NAME LIKE 'CD%'                                              00003506
     AND B.CREATOR  = 'DB2PDPRC'                                        00003606
     AND B.TYPE ='T'                                                    00003706
     AND A.NAME = B.TSNAME                                              00003806
     AND A.DBNAME  = B.DBNAME                                           00003906
  WITH UR;                                                              00004006
                                                                        00005006
-- LISTA PARTICOES DO TABLESPACE                                        00006006
  SELECT * FROM SYSIBM.SYSTABLEPART  A,                                 00007006
                SYSIBM.SYSTABLES     B                                  00008006
   WHERE B.NAME LIKE 'CD%'                                              00009006
     AND B.CREATOR  = 'DB2PDPRC'                                        00010006
     AND B.TYPE ='T'                                                    00020006
     AND A.TSNAME = B.TSNAME                                            00030006
     AND A.DBNAME  = B.DBNAME                                           00040006
  WITH UR;                                                              00040106
                                                                        00040206
-- LISTA TABELAS                                                        00040306
  SELECT * FROM SYSIBM.SYSTABLES                                        00040406
   WHERE NAME LIKE 'CD%'                                                00040506
     AND CREATOR  = 'DB2PDPRC'                                          00040606
     AND TYPE ='T'                                                      00040706
  WITH UR;                                                              00040806
                                                                        00040906
-- LISTA COLUNAS                                                        00041006
  SELECT * FROM SYSIBM.SYSCOLUMNS                                       00042006
   WHERE TBNAME LIKE 'CD%'                                              00043006
     AND TBCREATOR = 'DB2PDPRC'                                         00044006
   ORDER BY COLNO                                                       00045006
  WITH UR;                                                              00046006
                                                                        00047006
-- LISTA INDICES                                                        00048006
  SELECT * FROM SYSIBM.SYSINDEXES                                       00049006
   WHERE TBNAME LIKE 'CD%'                                              00050006
     AND TBCREATOR = 'DB2PDPRC'                                         00060006
  WITH UR;                                                              00070006
                                                                        00080006
-- LISTA INDEXPART                                                      00090006
  SELECT * FROM SYSIBM.SYSINDEXES A                                     00100006
              , SYSIBM.SYSINDEXPART B                                   00110006
   WHERE A.TBNAME LIKE 'CD%'                                            00120006
     AND A.TBCREATOR = 'DB2PDPRC'                                       00130006
     AND B.IXNAME = A.NAME                                              00140006
     AND B.IXCREATOR = A.CREATOR                                        00141006
  WITH UR;                                                              00142006
                                                                        00143006
-- LISTA PRIMARY KEYS                                                   00144006
  SELECT                                                                00145006
       A.IXNAME, B.UNIQUERULE,                                          00146006
       A.IXCREATOR, A.COLNAME, A.COLNO, A.COLSEQ, A.ORDERING,           00147006
       B.CLUSTERING, B.CLUSTERED, B.INDEXSPACE,                         00148006
       B.CLUSTERRATIO, B.STATSTIME                                      00149006
    FROM SYSIBM.SYSKEYS    A                                            00150006
       , SYSIBM.SYSINDEXES B                                            00151006
       , SYSIBM.SYSTABLES  C                                            00152006
   WHERE C.CREATOR = 'DB2PDPRC'                                         00153006
     AND C.NAME    LIKE 'CD%'                                           00154006
     AND C.TYPE    = 'T'                                                00155006
     AND B.TBNAME  = C.NAME                                             00156006
     AND B.TBCREATOR  = C.CREATOR                                       00157006
     AND A.IXNAME  = B.NAME                                             00158006
     AND A.IXCREATOR  = B.CREATOR                                       00159006
   ORDER BY A.IXNAME, A.COLSEQ                                          00160006
  WITH UR;                                                              00170006
                                                                        00180006
-- LISTA FOREIGN KEYS                                                   00190006
SELECT * FROM SYSIBM.SYSRELS                                            00200006
 WHERE RELNAME IN (SELECT RELNAME FROM SYSIBM.SYSFOREIGNKEYS            00210006
                    WHERE CREATOR = 'DB2PDPRC'                          00220006
                      AND TBNAME  LIKE 'CD%')                           00230006
  ORDER BY CREATOR,TBNAME,RELNAME                                       00240006
WITH UR;                                                                00250006
                                                                        00260006
-- LISTA COLUNAS FOREIGN KEYS                                           00270006
SELECT * FROM SYSIBM.SYSFOREIGNKEYS                                     00280006
 WHERE CREATOR = 'DB2PDPRC'                                             00290006
   AND TBNAME  LIKE 'CD%'                                               00300006
 ORDER BY CREATOR,TBNAME,RELNAME,COLSEQ                                 00310006
WITH UR;                                                                00320006
                                                                        00330006
-- LISTA CONSTRAINTS                                                    00340006
SELECT * FROM SYSIBM.SYSCHECKS                                          00350006
 WHERE TBOWNER = 'DB2PDPRC'                                             00360006
   AND TBNAME  LIKE 'CD%'                                               00370006
WITH UR;                                                                00380006
                                                                        00390006
SELECT * FROM SYSIBM.SYSCHECKDEP                                        00400006
 WHERE TBOWNER = 'DB2PDPRC'                                             00410006
   AND TBNAME  LIKE 'CD%'                                               00420006
WITH UR;                                                                00430006
                                                                        00440006
SELECT * FROM SYSIBM.SYSKEYCOLUSE                                       00450006
 WHERE TBCREATOR = 'DB2PDPRC'                                           00460006
   AND TBNAME  LIKE 'CD%'                                               00470006
WITH UR;                                                                00480006
                                                                        00490006
-- LISTA IDENTITY                                                       00500006
SELECT * FROM SYSIBM.SYSSEQUENCESDEP A,                                 00510006
              SYSIBM.SYSSEQUENCES B                                     00520006
 WHERE A.DCREATOR = 'DB2PDPRC'                                          00530006
   AND A.DNAME    LIKE 'CD%'                                            00540006
   AND B.SEQUENCEID = A.BSEQUENCEID                                     00550006
;                                                                       00560006
                                                                        00570006
-- LISTA TRIGGERS                                                       00580006
SELECT * FROM SYSIBM.SYSTRIGGERS                                        00590006
 WHERE TBOWNER    = 'DB2PDPRC'                                          00600006
   AND TBNAME     LIKE 'CD%'                                            00610006
;                                                                       00620006
