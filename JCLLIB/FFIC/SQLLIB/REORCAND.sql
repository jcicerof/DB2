-- REORG INDEX                                                          00020067
SELECT A.CREATOR, A.NAME                                                00030069
      , ((LEAFFAR*1.0000)/(NLEAF)) AS "LEAFFAR/NLEAF"                   00031077
      , A.CLUSTERRATIO, C.DBNAME, C.TSNAME                              00032064
  FROM SYSIBM.SYSINDEXPART B, SYSIBM.SYSINDEXES A,                      00040062
       SYSIBM.SYSTABLES C                                               00041062
 WHERE                                                                  00050047
       (LEAFFAR*1.0000)/NLEAF > 0.1                                     00050168
   AND A.DBNAME IN ('DUCS0PBE')                                         00061067
   AND A.NAME = B.IXNAME                                                00070009
   AND A.CREATOR = B.IXCREATOR                                          00080009
   AND NLEAF > 0                                                        00090058
   AND A.TBCREATOR = C.CREATOR                                          00090162
   AND A.TBNAME = C.NAME                                                00090262
-- AND A.TBNAME IN ('CLFT_POLICY_TERM')                                 00090367
-- AND A.TBCREATOR = 'ERSPROD'                                          00090467
 ORDER BY 5 DESC;                                                       00091059
                                                                        00100048
-- REORG TABLESPACE                                                     00110067
SELECT T.DBNAME,T.TSNAME,                                               00120079
       ((P.FAROFFPOSF)/T.CARDF)*1.000 AS "FAROFFPOSF/CARDF",            00121079
       T.CREATOR,T.NAME,I.CREATOR,I.NAME,P.PARTITION                    00122079
 FROM SYSIBM.SYSINDEXPART P, SYSIBM.SYSTABLES T,                        00130041
      SYSIBM.SYSINDEXES I                                               00131041
 WHERE T.CARDF > 0                                                      00140041
   AND (P.FAROFFPOSF*1.0000)/T.CARDF > 0.1                              00141070
   AND T.CREATOR = I.TBCREATOR                                          00150041
   AND T.NAME    = I.TBNAME                                             00160041
   AND I.CREATOR = P.IXCREATOR                                          00170041
   AND I.NAME    = P.IXNAME                                             00180041
   AND T.DBNAME IN ('DUCS0PBE')                                         00190167
   AND T.TYPE = 'T'                                                     00200042
-- AND T.NAME IN (  'CLFT_POLICY_TERM')                                 00201067
-- AND T.CREATOR = 'ERSPROD'                                            00210066
 ORDER BY 3 DESC;                                                       00220061
