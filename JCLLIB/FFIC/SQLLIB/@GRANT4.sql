--SELECT A.GRANTEE, B.DBNAME, B.CREATOR, B.NAME,                        00010014
--       A.SELECTAUTH,A.INSERTAUTH,A.UPDATEAUTH,A.DELETEAUTH            00011014
SELECT COUNT(*)                                                         00012014
  FROM SYSIBM.SYSTABAUTH A,                                             00020002
       SYSIBM.SYSTABLES B                                               00021005
 WHERE --GRANTEE LIKE 'ZZ%'                                             00030015
       B.DBNAME IN (                                                    00031015
                  'DSRU0P00',                                           00040000
                  'DUDT2P00',                                           00050000
                  'DUDT2P00',                                           00060000
                  'DCEI0P00',                                           00070000
                  'DPER0P00',                                           00080000
                  'DROS0P00',                                           00090000
                  'DUOLRDB0',                                           00100000
                  'DUBS0P00',                                           00110000
                  'DCEI0P00',                                           00120000
                  'DCDI0P00',                                           00130000
                  'DROF0P00',                                           00140000
                  'DSIS0P00',                                           00150000
                  'DPAN0P00',                                           00160000
                  'DCIZ0P00')                                           00170005
   AND A.TCREATOR = B.CREATOR                                           00180005
   AND A.TTNAME   = B.NAME                                              00190002
   AND B.TYPE     = 'T'                                                 00200002
   AND A.GRANTEETYPE = ' '                                              00210009
