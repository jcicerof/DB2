SELECT COUNT(*)                                                         00211034
  FROM ERSPROD.MAPA_S3_COMM_LIAB                                        00216035
 WHERE S3_BA_BK_DT = '201009'                                           00217035
;                                                                       00218119
FIM;                                                                    00218219
SELECT S3_BA_BK_DT                                                      00218334
     , S3_BA_ID                                                         00218434
     , S3_BA_SEQ_NBR                                                    00218534
     , COUNT(*) AS "COUNT(*)"                                           00218634
     , HEX(S3_BA_ID) AS "HEX(S3_BA_ID)"                                 00218734
 FROM DBA1ADM.TEST0                                                     00218834
  WHERE -- S3_BA_BK_DT = '201009' OR 0=1)                               00218934
       HEX(S3_BA_ID) = '20235F192900001965681F'                         00219034
   -- AND S3_BA_SEQ_NBR = 9                                             00219134
   GROUP BY S3_BA_BK_DT, S3_BA_ID, S3_BA_SEQ_NBR                        00219234
   HAVING COUNT(*) > 1                                                  00219334
;                                                                       00219434
FIM;                                                                    00219534
SELECT DISTINCT                                                         00219634
       S3_BA_ID                                                         00219734
 FROM DBA1ADM.TEST0 ;                                                   00219834
FIM;                                                                    00219934
SELECT S3_BA_BK_DT                                                      00220017
     , S3_BA_ID                                                         00230017
     , S3_BA_SEQ_NBR                                                    00240017
     , COUNT(*) AS "COUNT(*)"                                           00250017
     , HEX(S3_BA_ID) AS "HEX(S3_BA_ID)"                                 00260017
 FROM DBA1ADM.TEST0                                                     00270017
 GROUP BY S3_BA_BK_DT, S3_BA_ID, S3_BA_SEQ_NBR                          00280017
 HAVING COUNT(*) > 1                                                    00290017
