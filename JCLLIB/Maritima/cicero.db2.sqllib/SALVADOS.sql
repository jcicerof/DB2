-- LISTA TRIGGERS                                                       00001003
SELECT * FROM SYSIBM.SYSTRIGGERS                                        00002003
-- WHERE TBOWNER    = 'MARITIMA'                                        00003004
--   AND TBNAME     LIKE 'WRS%'                                         00004004
;                                                                       00005003
--                                                                      00006003
FIM                                                                     00007003
SELECT B.CREATOR, B.NAME, A.ICTYPE, B.CARD,                             00010002
       MAX(A.TIMESTAMP) AS TIMESTAMP                                    00011002
  FROM SYSIBM.SYSCOPY A,                                                00020000
       SYSIBM.SYSTABLES B                                               00030000
 WHERE B.TYPE = 'T'                                                     00040000
   AND B.TSNAME LIKE 'WRS%'                                             00050000
   AND A.DBNAME = B.DBNAME                                              00060000
   AND A.TSNAME = B.TSNAME                                              00070000
   AND A.ICTYPE = 'W'                                                   00080000
 GROUP BY B.CREATOR, B.NAME, A.ICTYPE, B.CARD                           00090002
;                                                                       00100000
--                                                                      00110003
-- CHANGE TABLE NAME AND CREATOR                                        00120003
--                                                                      00130003
                                                                        00140003
-- LISTA TABLESPACES                                                    00150003
  SELECT * FROM SYSIBM.SYSTABLESPACE A,                                 00160003
                SYSIBM.SYSTABLES     B                                  00170003
   WHERE B.NAME = 'SSATUCADPES'                                         00180003
     AND B.CREATOR  = 'MARITIMA'                                        00190003
     AND B.TYPE ='T'                                                    00200003
     AND A.NAME = B.TSNAME                                              00210003
     AND A.DBNAME  = B.DBNAME                                           00220003
  WITH UR;                                                              00230003
                                                                        00240003
-- LISTA PARTICOES DO TABLESPACE                                        00250003
  SELECT * FROM SYSIBM.SYSTABLEPART  A,                                 00260003
                SYSIBM.SYSTABLES     B                                  00270003
   WHERE B.NAME = 'SSATUCADPES'                                         00280003
     AND B.CREATOR  = 'MARITIMA'                                        00290003
     AND B.TYPE ='T'                                                    00300003
     AND A.TSNAME = B.TSNAME                                            00310003
     AND A.DBNAME  = B.DBNAME                                           00320003
  WITH UR;                                                              00330003
                                                                        00340003
-- LISTA TABELAS                                                        00350003
  SELECT * FROM SYSIBM.SYSTABLES                                        00360003
   WHERE NAME = 'SSATUCADPES'                                           00370003
     AND CREATOR  = 'MARITIMA'                                          00380003
     AND TYPE ='T'                                                      00390003
  WITH UR;                                                              00400003
                                                                        00410003
-- LISTA COLUNAS                                                        00420003
  SELECT * FROM SYSIBM.SYSCOLUMNS                                       00430003
   WHERE TBNAME = 'SSATUCADPES'                                         00440003
     AND TBCREATOR = 'MARITIMA'                                         00450003
   ORDER BY COLNO                                                       00460003
  WITH UR;                                                              00470003
                                                                        00480003
-- LISTA INDICES                                                        00490003
  SELECT * FROM SYSIBM.SYSINDEXES                                       00500003
   WHERE TBNAME = 'SSATUCADPES'                                         00510003
     AND TBCREATOR = 'MARITIMA'                                         00520003
  WITH UR;                                                              00530003
                                                                        00540003
-- LISTA INDEXPART                                                      00550003
  SELECT * FROM SYSIBM.SYSINDEXES A                                     00560003
              , SYSIBM.SYSINDEXPART B                                   00570003
   WHERE A.TBNAME = 'SSATUCADPES'                                       00580003
     AND A.TBCREATOR = 'MARITIMA'                                       00590003
     AND B.IXNAME = A.NAME                                              00600003
     AND B.IXCREATOR = A.CREATOR                                        00610003
  WITH UR;                                                              00620003
                                                                        00630003
-- LISTA PRIMARY KEYS                                                   00640003
  SELECT                                                                00650003
       A.IXNAME, B.UNIQUERULE,                                          00660003
       A.IXCREATOR, A.COLNAME, A.COLNO, A.COLSEQ, A.ORDERING,           00670003
       B.CLUSTERING, B.CLUSTERED, B.INDEXSPACE,                         00680003
       B.CLUSTERRATIO, B.STATSTIME                                      00690003
    FROM SYSIBM.SYSKEYS    A                                            00700003
       , SYSIBM.SYSINDEXES B                                            00710003
       , SYSIBM.SYSTABLES  C                                            00720003
   WHERE C.CREATOR = 'MARITIMA'                                         00730003
     AND C.NAME    = 'SSATUCADPES'                                      00740003
     AND C.TYPE    = 'T'                                                00750003
     AND B.TBNAME  = C.NAME                                             00760003
     AND B.TBCREATOR  = C.CREATOR                                       00770003
     AND A.IXNAME  = B.NAME                                             00780003
     AND A.IXCREATOR  = B.CREATOR                                       00790003
   ORDER BY A.IXNAME, A.COLSEQ                                          00800003
  WITH UR;                                                              00810003
                                                                        00820003
-- LISTA FOREIGN KEYS                                                   00830003
SELECT * FROM SYSIBM.SYSRELS                                            00840003
 WHERE RELNAME IN (SELECT RELNAME FROM SYSIBM.SYSFOREIGNKEYS            00850003
                    WHERE CREATOR = 'MARITIMA'                          00860003
                      AND TBNAME  = 'SSATUCADPES')                      00870003
  ORDER BY CREATOR,TBNAME,RELNAME                                       00880003
WITH UR;                                                                00890003
                                                                        00900003
-- LISTA COLUNAS FOREIGN KEYS                                           00910003
SELECT * FROM SYSIBM.SYSFOREIGNKEYS                                     00920003
 WHERE CREATOR = 'MARITIMA'                                             00930003
   AND TBNAME  = 'SSATUCADPES'                                          00940003
 ORDER BY CREATOR,TBNAME,RELNAME,COLSEQ                                 00950003
WITH UR;                                                                00960003
                                                                        00970003
-- LISTA CONSTRAINTS                                                    00980003
SELECT * FROM SYSIBM.SYSCHECKS                                          00990003
 WHERE TBOWNER = 'MARITIMA'                                             01000003
   AND TBNAME  = 'SSATUCADPES'                                          01010003
WITH UR;                                                                01020003
                                                                        01030003
SELECT * FROM SYSIBM.SYSCHECKDEP                                        01040003
 WHERE TBOWNER = 'MARITIMA'                                             01050003
   AND TBNAME  = 'SSATUCADPES'                                          01060003
WITH UR;                                                                01070003
                                                                        01080003
SELECT * FROM SYSIBM.SYSKEYCOLUSE                                       01090003
 WHERE TBCREATOR = 'MARITIMA'                                           01100003
   AND TBNAME  = 'SSATUCADPES'                                          01110003
WITH UR;                                                                01120003
                                                                        01130003
-- LISTA IDENTITY                                                       01140003
SELECT * FROM SYSIBM.SYSSEQUENCESDEP A,                                 01150003
              SYSIBM.SYSSEQUENCES B                                     01160003
 WHERE A.DCREATOR = 'MARITIMA'                                          01170003
   AND A.DNAME    = 'SSATUCADPES'                                       01180003
   AND B.SEQUENCEID = A.BSEQUENCEID                                     01190003
;                                                                       01200003
                                                                        01210003
-- LISTA TRIGGERS                                                       01220003
SELECT * FROM SYSIBM.SYSTRIGGERS                                        01230003
 WHERE TBOWNER    = 'MARITIMA'                                          01240003
   AND TBNAME     = 'SSATUCADPES'                                       01250003
;                                                                       01260003
