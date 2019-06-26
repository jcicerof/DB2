--                                                                      00000100
-- GRANTS PARA GRUPOS ZZ%                                               00000204
--                                                                      00000300
SELECT DISTINCT B.GRANTEE,COUNT(*)                                      00000414
--SELECT A.CREATOR, A.NAME, B.GRANTEE,                                  00002112
--       B.INSERTAUTH,B.UPDATEAUTH,B.DELETEAUTH,B.SELECTAUTH            00002212
  FROM SYSIBM.SYSTABLES A,                                              00002304
       SYSIBM.SYSTABAUTH B                                              00002404
 WHERE A.TYPE ='T'                                                      00002504
   AND A.CREATOR = B.TCREATOR                                           00002604
   AND A.CREATOR = B.TCREATOR                                           00002704
   AND A.NAME    = B.TTNAME                                             00002804
   AND B.GRANTEETYPE = ' '                                              00002904
   AND A.CREATOR IN ('DB2ACP4')                                         00003011
   AND B.GRANTEE LIKE 'ZZ%'                                             00003111
   AND B.SELECTAUTH = 'Y'                                               00003213
GROUP BY B.GRANTEE                                                      00003314
-- AND A.DBNAME  = ( 'XXXXX',                                           00003411
--                  'DMMM1P00',                                         00003509
--                  'DMMM2P00',                                         00003609
--                  'DMMM3P00',                                         00003709
--                  'DMMM5P00',                                         00003809
--                  'DMMM6P00');                                        00003909
;                                                                       00004009
FIM;                                                                    00004109
SELECT DISTINCT B.GRANTEE                                               00004209
  FROM SYSIBM.SYSTABLES A,                                              00004309
       SYSIBM.SYSTABAUTH B                                              00004409
 WHERE A.TYPE ='T'                                                      00004509
   AND A.CREATOR = B.TCREATOR                                           00004609
   AND A.CREATOR = B.TCREATOR                                           00004709
   AND A.NAME    = B.TTNAME                                             00004809
   AND B.GRANTEETYPE = ' '                                              00004909
   AND B.GRANTEE LIKE 'ZZ%'                                             00005009
   AND A.DBNAME IN ('DMMM0P00',                                         00005109
                    'DMMM1P00',                                         00005209
                    'DMMM2P00',                                         00005309
                    'DMMM3P00',                                         00005409
                    'DMMM5P00',                                         00005509
                    'DMMM6P00');                                        00005609
SELECT COUNT(*)                                                         00005709
--SELECT A.CREATOR, A.NAME, B.GRANTEE,                                  00005809
--       B.INSERTAUTH,B.UPDATEAUTH,B.DELETEAUTH,B.SELECTAUTH            00005909
  FROM SYSIBM.SYSTABLES A,                                              00006009
       SYSIBM.SYSTABAUTH B                                              00006109
 WHERE A.TYPE ='T'                                                      00006201
   AND A.CREATOR = B.TCREATOR                                           00007001
   AND A.CREATOR = B.TCREATOR                                           00008001
   AND A.NAME    = B.TTNAME                                             00009001
   AND B.GRANTEETYPE = ' '                                              00010001
   AND NOT (B.GRANTEE  LIKE 'ZZ%' OR                                    00011008
            B.GRANTEE = 'NALPROD')                                      00012008
   AND A.DBNAME IN ('DMMM0P00',                                         00020001
                    'DMMM1P00',                                         00030001
                    'DMMM2P00',                                         00040001
                    'DMMM3P00',                                         00050001
                    'DMMM5P00',                                         00060001
                    'DMMM6P00');                                        00070003
SELECT A.CREATOR, A.NAME, B.GRANTEE,                                    00081006
       B.INSERTAUTH,B.UPDATEAUTH,B.DELETEAUTH,B.SELECTAUTH              00090006
  FROM SYSIBM.SYSTABLES A,                                              00100003
       SYSIBM.SYSTABAUTH B                                              00110003
 WHERE A.TYPE ='T'                                                      00120003
   AND A.CREATOR = B.TCREATOR                                           00130003
   AND A.CREATOR = B.TCREATOR                                           00140003
   AND A.NAME    = B.TTNAME                                             00150003
   AND B.GRANTEETYPE = 'P'                                              00160003
   AND A.DBNAME IN ('DMMM0P00',                                         00180003
                    'DMMM1P00',                                         00190003
                    'DMMM2P00',                                         00200003
                    'DMMM3P00',                                         00210003
                    'DMMM5P00',                                         00220003
                    'DMMM6P00')                                         00230003
