SELECT DISTINCT                                                         00010008
'DB2P',                                                                 00020023
STRIP(A.VCATNAME)||'.DSNDBD.'||STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME),   00030027
MAX(A.PARTITION)                                                        00040027
,B.TYPE, B.DSSIZE                                                       00050020
  FROM SYSIBM.SYSTABLEPART A                                            00060011
     , SYSIBM.SYSTABLESPACE B                                           00070011
     , SYSIBM.SYSTABLES C                                               00080030
 WHERE A.DBNAME = B.DBNAME                                              00090011
   AND A.TSNAME = B.NAME                                                00100011
   AND C.DBNAME = B.DBNAME                                              00110030
   AND C.TSNAME = B.NAME                                                00120030
-- AND B.PARTITIONS > 0                                                 00130030
   AND C.CREATOR = 'PERPROD'                                            00140030
   AND C.NAME IN ('CLT_ADR_RELATION'                                    00150030
                 ,'CLIENT_ADDRESS'                                      00160030
                 ,'CLIENT_TAB'                                          00170030
                 ,'CLT_CLT_RELATION'                                    00180030
                 ,'INDIVIDUAL_CLIENT'                                   00190030
                 ,'CLIENT_LICENSE'                                      00200030
                 ,'CLT_OTHER_OBJECTS'                                   00210030
                 ,'CLT_OBJ_RELATION'                                    00220030
                 ,'CLIENT_PHONE'                                        00230030
                 ,'CLIENT_POLICY'                                       00240030
                 ,'CLFT_POLICY_TERM')                                   00250030
GROUP BY 'DB2P',                                                        00260023
STRIP(A.VCATNAME)||'.DSNDBD.'||STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME),   00270028
         B.TYPE, B.DSSIZE, B.PARTITIONS                                 00280015
;                                                                       00290014
FIM;                                                                    00300014
SELECT DISTINCT                                                         00310030
'DB2P',                                                                 00320030
STRIP(A.VCATNAME)||'.DSNDBD.'||STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME),   00330030
MAX(A.PARTITION)                                                        00340030
,B.TYPE, B.DSSIZE                                                       00350030
  FROM SYSIBM.SYSTABLEPART A                                            00360030
     , SYSIBM.SYSTABLESPACE B                                           00370030
 WHERE A.DBNAME = B.DBNAME                                              00380030
   AND A.TSNAME = B.NAME                                                00390030
-- AND B.PARTITIONS > 0                                                 00400030
   AND B.DBNAME IN ('DCLI0U00'                                          00410030
                   ,'DCLI0U01')                                         00420030
   AND B.NAME   IN ('SEBN0U00'                                          00430030
                   ,'SECN0U00'                                          00440030
                   ,'SEEN0U00'                                          00450030
                   ,'SEHN0U00'                                          00460030
                   ,'SEKN0U00'                                          00470030
                   ,'SEPN0U00'                                          00480030
                   ,'SEVN0U00'                                          00490030
                   ,'SEWN0U00'                                          00500030
                   ,'SEZN0U00'                                          00510030
                   ,'SPTN0U00'                                          00520030
                   ,'SEJN0U00'                                          00530030
                   ,'SERN0U00'                                          00540030
                   ,'SEYN0U00'                                          00550030
                   ,'SFAN0U00')                                         00560030
GROUP BY 'DB2P',                                                        00570030
STRIP(A.VCATNAME)||'.DSNDBD.'||STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME),   00580030
         B.TYPE, B.DSSIZE, B.PARTITIONS                                 00590030
;                                                                       00600030
FIM;                                                                    00610030
SELECT DISTINCT                                                         00620030
STRIP(A.VCATNAME)||'.DSNDBD.'||STRIP(A.DBNAME),MAX(A.PARTITION)         00630014
,B.TYPE, B.DSSIZE                                                       00640014
  FROM SYSIBM.SYSTABLEPART A                                            00650014
     , SYSIBM.SYSTABLESPACE B                                           00660014
 WHERE A.DBNAME = B.DBNAME                                              00670014
   AND A.TSNAME = B.NAME                                                00680014
   AND A.DBNAME IN ('DMAAAP01',                                         00690014
                  'DMACAP01',                                           00700014
                  'DMACAP02',                                           00710014
                  'DMACAP03',                                           00720014
                  'DMACAP04',                                           00730014
                  'DMACAP05',                                           00740014
                  'DMACAP06',                                           00750014
                  'DMACAP07',                                           00760014
                  'DMACAP08',                                           00770014
                  'DMACAP09',                                           00780014
                  'DMACAP10',                                           00790014
                  'DMACAP11',                                           00800014
                  'DMACAP12',                                           00810014
                  'DMACAP13',                                           00820014
                  'DMAPAP00',                                           00830014
                  'DMAPAP01',                                           00840014
                  'DMAPAP02',                                           00850014
                  'DMAPAP03',                                           00860014
                  'DMAPAP04',                                           00870014
                  'DMAPAP05',                                           00880014
                  'DMAPAP06',                                           00890014
                  'DMAPAP07',                                           00900014
                  'DMAPAP08',                                           00910014
                  'DMAPAP09',                                           00920014
                  'DMAPAP10',                                           00930014
                  'DMAPAP11',                                           00940014
                  'DMAPAP12',                                           00950014
                  'DMAPAP13')                                           00960014
GROUP BY STRIP(A.VCATNAME)||'.DSNDBD.'||STRIP(A.DBNAME),                00970014
B.TYPE, B.DSSIZE                                                        00980014
