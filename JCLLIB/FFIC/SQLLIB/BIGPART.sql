-- CLIENT_TAB, CLT_OBJ_RELATION, CLT_ADR_RELATION, AND CLIENT_POLICY    00010000
-- AND TBCREATOR = 'DB2CERT';                                           00020000
SELECT A.CREATOR, A.NAME, LEAFFAR, NLEAF                                00030000
      , ((LEAFFAR*1.0000)/(NLEAF))*100 AS "%"                           00031000
      , A.CLUSTERRATIO, C.DBNAME, C.TSNAME                              00032000
  FROM SYSIBM.SYSINDEXPART B, SYSIBM.SYSINDEXES A,                      00033000
       SYSIBM.SYSTABLES C                                               00034000
 WHERE                                                                  00035000
       ((LEAFFAR*1.0000)/(NLEAF))*100 >  0.0                            00036000
-- AND A.TBNAME IN ('CLFT_POLICY_TERM'                                  00037000
--                 ,'CLIENT_ADDRESS'                                    00038000
--                 ,'CLIENT_POLICY'                                     00039000
--                 ,'CLIENT_TAB'                                        00040000
--                 ,'CLT_ADR_RELATION'                                  00050000
--                 ,'CLT_CLT_RELATION'                                  00051000
--                 ,'CLT_OBJ_RELATION'                                  00052000
--                 ,'CLT_REF_RELATION'                                  00053000
--                 ,'CLT_OTHER_OBJECTS'                                 00054000
--                 ,'CLT_ADR_SEARCH')                                   00055000
   AND A.TBCREATOR = 'ERSPROD'                                          00056000
   AND SUBSTR(A.DBNAME,1,4) IN ('DMAA','DMAC','DMAP')                   00057000
   AND A.NAME = B.IXNAME                                                00058000
   AND A.CREATOR = B.IXCREATOR                                          00059000
   AND B.PARTITION   BETWEEN 17 AND 64                                  00059102
-- AND NLEAF > 0                                                        00060000
   AND A.TBCREATOR = C.CREATOR                                          00070000
   AND A.TBNAME = C.NAME                                                00080000
 ORDER BY 5 DESC;                                                       00090000
                                                                        00100000
--                                                                      00110000
SELECT P.FAROFFPOSF, T.CARDF,                                           00120000
       INTEGER(((P.FAROFFPOSF*1.0000)/T.CARDF)*100) AS "%",             00121000
       T.CREATOR,T.NAME,I.CREATOR,I.NAME,P.PARTITION,                   00122000
       T.DBNAME,T.TSNAME                                                00123000
 FROM SYSIBM.SYSINDEXPART P, SYSIBM.SYSTABLES T,                        00124000
      SYSIBM.SYSINDEXES I                                               00125000
 WHERE T.CARDF > 0                                                      00126000
   AND INTEGER(((P.FAROFFPOSF*1.0000)/T.CARDF)*100) > 0.0               00127000
   AND T.CREATOR = I.TBCREATOR                                          00128000
   AND T.NAME    = I.TBNAME                                             00129000
   AND I.CREATOR = P.IXCREATOR                                          00130000
   AND I.NAME    = P.IXNAME                                             00140000
   AND SUBSTR(T.DBNAME,1,4) IN ('DMAA','DMAC','DMAP')                   00150000
-- AND T.NAME IN (  'CLFT_POLICY_TERM'                                  00160000
--               ,  'CLIENT_ADDRESS'                                    00170000
--               ,  'CLIENT_POLICY'                                     00180000
--               ,  'CLIENT_TAB'                                        00190000
--               ,  'CLT_ADR_RELATION'                                  00191000
--               ,  'CLT_CLT_RELATION'                                  00192000
--               ,  'CLT_OBJ_RELATION'                                  00193000
--               ,  'CLT_REF_RELATION'                                  00194000
--               ,  'CLT_OTHER_OBJECTS'                                 00195000
--               ,  'CLT_ADR_SEARCH')                                   00196000
   AND T.TYPE = 'T'                                                     00197000
   AND T.CREATOR = 'ERSPROD'                                            00198000
 ORDER BY 3 DESC;                                                       00199000
--                                                                      00200000
--                                                                      00210000
SELECT P.FAROFFPOSF, T.CARDF,                                           00220000
       INTEGER(((P.FAROFFPOSF*1.0000)/T.CARDF)*100) AS "%",             00230000
       T.CREATOR,T.NAME,I.CREATOR,I.NAME,P.PARTITION,                   00240000
       T.DBNAME,T.TSNAME                                                00250000
 FROM SYSIBM.SYSINDEXPART P, SYSIBM.SYSTABLES T,                        00260000
      SYSIBM.SYSINDEXES I                                               00270000
 WHERE T.CARDF > 0                                                      00280000
   AND INTEGER(((P.FAROFFPOSF*1.0000)/T.CARDF)*100) > 0.0               00290000
   AND T.CREATOR = I.TBCREATOR                                          00300000
   AND T.NAME    = I.TBNAME                                             00310000
   AND I.CREATOR = P.IXCREATOR                                          00320000
   AND I.NAME    = P.IXNAME                                             00330000
   AND SUBSTR(T.DBNAME,1,4) IN ('DMAA','DMAC','DMAP')                   00340000
-- AND T.NAME IN (  'CLFT_POLICY_TERM'                                  00350000
--               ,  'CLIENT_ADDRESS'                                    00360000
--               ,  'CLIENT_POLICY'                                     00370000
--               ,  'CLIENT_TAB'                                        00380000
--               ,  'CLT_ADR_RELATION'                                  00390000
--               ,  'CLT_CLT_RELATION'                                  00400000
--               ,  'CLT_OBJ_RELATION'                                  00410000
--               ,  'CLT_REF_RELATION'                                  00420000
--               ,  'CLT_OTHER_OBJECTS'                                 00430000
--               ,  'CLT_ADR_SEARCH')                                   00440000
   AND T.TYPE = 'T'                                                     00450000
   AND T.CREATOR = 'ERSPROD'                                            00460000
 ORDER BY 3 DESC;                                                       00470000
