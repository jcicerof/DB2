--SELECT 'ALTER INDEX '||STRIP(I.CREATOR)||'.'||STRIP(I.NAME)||         00001011
--     ' BUFFERPOOL BP26;'                                              00002011
SELECT I.DBNAME,I.INDEXSPACE,I.BPOOL                                    00003012
           FROM SYSIBM.SYSTABLESPACE A,                                 00010008
                SYSIBM.SYSTABLES     B,                                 00010104
                SYSIBM.SYSINDEXES    I                                  00010204
   WHERE                                                                00011005
         B.TYPE ='T'                                                    00012005
     AND A.NAME = B.TSNAME                                              00013004
     AND A.DBNAME  = B.DBNAME                                           00015004
     AND B.NAME = I.TBNAME                                              00016004
     AND B.CREATOR = I.TBCREATOR                                        00017004
     AND A.BPOOL   = 'BP25'                                             00018011
--   AND A.DBNAME = 'DBEETA'                                            00019011
--   AND A.NAME IN ( 'CDGEQCLS',                                        00019111
--                   'CDGEQFIL',                                        00020011
--                   'CDGEQPRR',                                        00021011
--                   'CNDGEANE',                                        00022011
--                   'CNDGEVAL',                                        00023011
--                   'CNGEQTAC',                                        00024011
--                   'CONGENQ1',                                        00025011
--                   'CONGENQ2',                                        00026011
--                   'CONGENQ3',                                        00027011
--                   'PARAMGER',                                        00028011
--                   'PARGERSQ')                                        00029011
  WITH UR;                                                              00030004
                                                                        00090004
