--                                                                      00001013
-- LISTA OBJETOS PARA CALCULAR SE ELES ESTAO NO LIMITE DE TAMANHO       00002013
-- DOS ARQUIVOS VSAM                                                    00003013
--                                                                      00004013
--                                                                      00005013
--                                                                      00006013
SELECT                                                                  00007047
       STRIP(B.VCATNAME)||'.DSNDBD.'||STRIP(A.DBNAME)||'.'||            00007247
       STRIP(A.NAME)||'.'||B.IPREFIX||'0001' AS PARTIALNAME,            00007347
       'DB2D' AS SUBSYS, 'TS' AS TIPO,                                  00007585
       A.DBNAME, A.NAME, A.PARTITIONS,                                  00008020
       A.PGSIZE, A.SEGSIZE,                                             00009079
       CASE                                                             00009179
          WHEN A.TYPE = ' ' THEN '-'                                    00009279
          ELSE A.TYPE                                                   00009679
       END AS TYPE,                                                     00009779
       A.DSSIZE, A.AVGROWLEN,                                           00009979
       B.PARTITION, B.VCATNAME, B.COMPRESS                              00010057
   --  , B.DSNUM, B.AVGROWLEN, B.IPREFIX, B.STORNAME                    00021057
  FROM SYSIBM.SYSTABLESPACE A,                                          00030020
       SYSIBM.SYSTABLEPART B                                            00040038
 WHERE A.DBNAME = B.DBNAME                                              00050020
   AND A.NAME   = B.TSNAME                                              00051020
UNION ALL                                                               00052020
SELECT                                                                  00052147
       STRIP(B.VCATNAME)||'.DSNDBD.'||STRIP(A.DBNAME)||'.'||            00053047
       STRIP(A.INDEXSPACE)||'.'||B.IPREFIX||'0001' AS PARTIALNAME,      00054047
       'DB2D' AS SUBSYS, 'IX' AS TIPO,                                  00060085
       A.DBNAME, A.INDEXSPACE, D.PARTITIONS,                            00070049
       A.PGSIZE/1024 AS PGSIZE, -1 AS SEGSIZE, '-' AS TYPE,             00080079
       A.PIECESIZE, A.AVGKEYLEN,                                        00080122
       B.PARTITION, B.VCATNAME, A.COMPRESS                              00090057
   --  , B.DSNUM, B.AVGKEYLEN, B.IPREFIX, B.STORNAME                    00101057
  FROM SYSIBM.SYSINDEXES A,                                             00110013
       SYSIBM.SYSINDEXPART B,                                           00120013
       SYSIBM.SYSTABLES C,                                              00121013
       SYSIBM.SYSTABLESPACE D                                           00122038
 WHERE A.CREATOR   = B.IXCREATOR                                        00130016
   AND A.NAME      = B.IXNAME                                           00140016
   AND A.TBCREATOR = C.CREATOR                                          00150013
   AND A.TBNAME    = C.NAME                                             00160013
   AND C.TYPE      = 'T'                                                00170013
   AND C.DBNAME    = D.DBNAME                                           00180013
   AND C.TSNAME    = D.NAME                                             00190013
;                                                                       00191014
