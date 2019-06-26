SELECT A.DBNAME, A.TSNAME, A.CREATOR, A.NAME,                           00010019
       B.PQTY, B.SQTY, C.PGSIZE,                                        00011024
       C.PARTITIONS,                                                    00012033
       B.PQTY* C.PGSIZE,B.COMPRESS                                      00013034
  FROM SYSIBM.SYSTABLES A,                                              00020019
       SYSIBM.SYSTABLEPART B,                                           00020121
       SYSIBM.SYSTABLESPACE C                                           00020221
 WHERE A.DBNAME = B.DBNAME                                              00021019
   AND A.TSNAME = B.TSNAME                                              00021119
   AND A.DBNAME = C.DBNAME                                              00021221
   AND A.TSNAME = C.NAME                                                00021340
   AND A.TYPE = 'T'                                                     00021421
   AND A.CREATOR = 'DB2CERT'                                            00021537
   AND ((A.NAME ='CLT_ADR_RELATION'  AND A.TSNAME='SECN0R00') OR        00021637
        (A.NAME ='CLIENT_ADDRESS'    AND A.TSNAME='SEEN0R00') OR        00021737
        (A.NAME ='CLIENT_TAB'        AND A.TSNAME='SEHN0R00') OR        00021837
        (A.NAME ='CLT_CLT_RELATION'  AND A.TSNAME='SEKN0R00') OR        00021937
        (A.NAME ='CLT_OBJ_RELATION'  AND A.TSNAME='SEWN0R00') OR        00022037
        (A.NAME ='CLIENT_POLICY'     AND A.TSNAME='SEZN0R00') OR        00022137
        (A.NAME ='CLT_ADR_SEARCH'    AND A.TSNAME='SFEN0R00') OR        00022237
        (A.NAME ='INDIVIDUAL_CLIENT' AND A.TSNAME='SEPN0R00') OR        00022337
        (A.NAME ='CLFT_POLICY_TERM'  AND A.TSNAME='SPTN0R00') OR        00022437
        (A.NAME ='CLT_REF_RELATION'  AND A.TSNAME='SFAN0R01'))          00022537
;                                                                       00100026
                                                                        00110026
SELECT C.CREATOR,C.NAME,A.NAME,                                         00120039
       B.VCATNAME, C.DBNAME, C.INDEXSPACE,                              00121030
       B.PQTY, B.SQTY, C.PGSIZE                                         00130027
  FROM SYSIBM.SYSTABLES A,                                              00150026
       SYSIBM.SYSINDEXPART B,                                           00160026
       SYSIBM.SYSINDEXES    C                                           00170026
 WHERE A.CREATOR= C.TBCREATOR                                           00180026
   AND A.NAME   = C.TBNAME                                              00190026
   AND C.CREATOR = B.IXCREATOR                                          00200028
   AND C.NAME = B.IXNAME                                                00210028
   AND A.TYPE = 'T'                                                     00220026
   AND A.CREATOR = 'DB2CERT'                                            00220137
   AND ((A.NAME ='CLT_ADR_RELATION'  AND A.TSNAME='SECN0R00') OR        00220237
        (A.NAME ='CLIENT_ADDRESS'    AND A.TSNAME='SEEN0R00') OR        00220337
        (A.NAME ='CLIENT_TAB'        AND A.TSNAME='SEHN0R00') OR        00220437
        (A.NAME ='CLT_CLT_RELATION'  AND A.TSNAME='SEKN0R00') OR        00220537
        (A.NAME ='CLT_OBJ_RELATION'  AND A.TSNAME='SEWN0R00') OR        00220637
        (A.NAME ='CLIENT_POLICY'     AND A.TSNAME='SEZN0R00') OR        00220737
        (A.NAME ='CLT_ADR_SEARCH'    AND A.TSNAME='SFEN0R00') OR        00220837
        (A.NAME ='INDIVIDUAL_CLIENT' AND A.TSNAME='SEPN0R00') OR        00220937
        (A.NAME ='CLFT_POLICY_TERM'  AND A.TSNAME='SPTN0R00') OR        00221037
        (A.NAME ='CLT_REF_RELATION'  AND A.TSNAME='SFAN0R01'))          00221137
;                                                                       00230231
