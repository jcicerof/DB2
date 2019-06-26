--                                                                      00001699
-- CHANGE TABLE NAME AND CREATOR                                        00002018
--                                                                      00003018
                                                                        00003170
-- LISTA TABLESPACES                                                    00004070
  SELECT * FROM SYSIBM.SYSTABLESPACE A,                                 00010099
                SYSIBM.SYSTABLES     B                                  00010199
   WHERE B.NAME = 'BEMVEICULOSSP'                                       00011099
     AND B.CREATOR  = 'TECINFOR'                                        00011199
     AND B.TYPE ='T'                                                    00012099
     AND A.NAME = B.TSNAME                                              00013015
     AND A.DBNAME  = B.DBNAME                                           00015017
  WITH UR;                                                              00030012
                                                                        00040012
-- LISTA PARTICOES DO TABLESPACE                                        00040170
  SELECT * FROM SYSIBM.SYSTABLEPART A,                                  00040299
                SYSIBM.SYSTABLES     B                                  00040399
   WHERE B.NAME = 'BEMVEICULOSSP'                                       00040499
     AND B.CREATOR  = 'TECINFOR'                                        00040599
     AND B.TYPE ='T'                                                    00040618
     AND A.TSNAME = B.TSNAME                                            00040719
     AND A.DBNAME  = B.DBNAME                                           00040818
  WITH UR;                                                              00040918
                                                                        00041018
-- LISTA TABELAS                                                        00041170
  SELECT * FROM SYSIBM.SYSTABLES                                        00041299
   WHERE NAME = 'BEMVEICULOSSP'                                         00042099
     AND CREATOR  = 'TECINFOR'                                          00043099
     AND TYPE ='T'                                                      00044015
  WITH UR;                                                              00045015
                                                                        00046015
-- LISTA COLUNAS                                                        00047070
  SELECT * FROM SYSIBM.SYSCOLUMNS                                       00050099
   WHERE TBNAME = 'BEMVEICULOSSP'                                       00060099
     AND TBCREATOR = 'TECINFOR'                                         00070099
   ORDER BY COLNO                                                       00071014
  WITH UR;                                                              00080012
                                                                        00090012
-- LISTA INDICES                                                        00100070
  SELECT * FROM SYSIBM.SYSINDEXES                                       00141099
   WHERE TBNAME = 'BEMVEICULOSSP'                                       00142099
     AND TBCREATOR = 'TECINFOR'                                         00143099
  WITH UR;                                                              00144020
                                                                        00145020
-- LISTA INDEXPART                                                      00145170
  SELECT * FROM SYSIBM.SYSINDEXES A                                     00146099
              , SYSIBM.SYSINDEXPART B                                   00147099
   WHERE A.TBNAME = 'BEMVEICULOSSP'                                     00148099
     AND A.TBCREATOR = 'TECINFOR'                                       00149099
     AND B.IXNAME = A.NAME                                              00149153
     AND B.IXCREATOR = A.CREATOR                                        00149253
  WITH UR;                                                              00149320
                                                                        00149420
-- LISTA PRIMARY KEYS                                                   00149570
  SELECT                                                                00150005
       A.IXNAME, B.UNIQUERULE,                                          00150105
       A.IXCREATOR, A.COLNAME, A.COLNO, A.COLSEQ, A.ORDERING,           00150209
       B.CLUSTERING, B.CLUSTERED, B.INDEXSPACE,                         00150311
       B.CLUSTERRATIO, B.STATSTIME                                      00150411
    FROM SYSIBM.SYSKEYS    A                                            00151099
       , SYSIBM.SYSINDEXES B                                            00152099
       , SYSIBM.SYSTABLES C                                             00153099
   WHERE C.CREATOR = 'TECINFOR'                                         00160099
     AND C.NAME    = 'BEMVEICULOSSP'                                    00170099
     AND C.TYPE    = 'T'                                                00170108
     AND B.TBNAME  = C.NAME                                             00171005
     AND B.TBCREATOR  = C.CREATOR                                       00172005
     AND A.IXNAME  = B.NAME                                             00173006
     AND A.IXCREATOR  = B.CREATOR                                       00174006
   ORDER BY A.IXNAME, A.COLSEQ                                          00175007
  WITH UR;                                                              00180004
                                                                        00190070
-- LISTA FOREIGN KEYS                                                   00200070
SELECT * FROM SYSIBM.SYSRELS                                            00240099
 WHERE RELNAME IN (SELECT RELNAME FROM SYSIBM.SYSFOREIGNKEYS            00250099
                    WHERE CREATOR = 'TECINFOR'                          00260099
                      AND TBNAME  = 'BEMVEICULOSSP')                    00270099
  ORDER BY CREATOR,TBNAME,RELNAME                                       00280071
WITH UR;                                                                00290070
                                                                        00291070
-- LISTA COLUNAS FOREIGN KEYS                                           00292070
SELECT * FROM SYSIBM.SYSFOREIGNKEYS                                     00300099
 WHERE CREATOR = 'TECINFOR'                                             00310099
   AND TBNAME  = 'BEMVEICULOSSP'                                        00320099
 ORDER BY CREATOR,TBNAME,RELNAME,COLSEQ                                 00330070
WITH UR;                                                                00340070
                                                                        00350088
-- LISTA CONSTRAINTS                                                    00360088
SELECT * FROM SYSIBM.SYSCHECKS                                          00370099
 WHERE TBOWNER = 'TECINFOR'                                             00380099
   AND TBNAME  = 'BEMVEICULOSSP'                                        00390099
WITH UR;                                                                00410088
                                                                        00411088
SELECT * FROM SYSIBM.SYSCHECKDEP                                        00420099
 WHERE TBOWNER = 'TECINFOR'                                             00430099
   AND TBNAME  = 'BEMVEICULOSSP'                                        00440099
WITH UR;                                                                00460088
                                                                        00470090
SELECT * FROM SYSIBM.SYSKEYCOLUSE                                       00480099
 WHERE TBCREATOR = 'TECINFOR'                                           00490099
   AND TBNAME  = 'BEMVEICULOSSP'                                        00500099
WITH UR;                                                                00510090
                                                                        00520099
-- LISTA IDENTITY                                                       00530099
SELECT * FROM SYSIBM.SYSSEQUENCESDEP A,                                 00540099
              SYSIBM.SYSSEQUENCES B                                     00550099
 WHERE A.DCREATOR = 'TECINFOR'                                          00560099
   AND A.DNAME    = 'BEMVEICULOSSP'                                     00570099
   AND B.SEQUENCEID = A.BSEQUENCEID                                     00580099
;                                                                       00590099
                                                                        00600099
-- LISTA TRIGGERS                                                       00610099
SELECT * FROM SYSIBM.SYSTRIGGERS                                        00620099
 WHERE TBOWNER    = 'TECINFOR'                                          00630099
   AND TBNAME     = 'BEMVEICULOSSP'                                     00640099
;                                                                       00650099
