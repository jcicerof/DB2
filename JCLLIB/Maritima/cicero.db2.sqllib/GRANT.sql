--                                                                      00000116
-- SELECT * FROM SYSIBM.SYSTABAUTH                                      00000216
-- WHERE SCREATOR = 'MARITIMA'                                          00000316
--   AND STNAME   = 'MOVIMENTOAPOL'                                     00000416
--   AND GRANTEETYPE  <> 'P'                                            00000516
-- WITH UR;                                                             00000616
                                                                        00000716
 SELECT DISTINCT B.CREATOR, B.NAME FROM SYSIBM.SYSTABLES B,             00001013
               SYSIBM.SYSTABAUTH C                                      00001104
  WHERE C.SCREATOR = B.CREATOR                                          00001204
    AND C.STNAME   = B.NAME                                             00001304
    AND B.TYPE = 'T'                                                    00002004
    AND C.GRANTOR <> 'PUBLIC'                                           00002107
    AND C.GRANTEE <> 'PUBLIC'                                           00002208
    AND C.GRANTEETYPE  <> 'P'                                           00002312
    AND B.CREATOR NOT IN                                                00002414
        ('SYSIBM', 'PTI', 'LANDMARK', 'DSNACC', 'DSNRGCOL', 'ASN',      00002517
         'DB2PDPRC')                                                    00002617
    AND NOT EXISTS (SELECT '1' FROM SYSIBM.SYSTABAUTH A                 00002717
                     WHERE A.SCREATOR = B.CREATOR                       00002817
                       AND A.STNAME   = B.NAME                          00002917
                       AND A.GRANTEETYPE  <> 'P'                        00003017
                       AND A.GRANTOR <> 'PUBLIC'                        00003117
                       AND A.GRANTEE IN (                               00003217
  'MVSPUSER', 'CSPPUSER', 'INFORMIX', 'IFXPUSER', 'CA7ONL')             00003317
                    )                                                   00004003
 WITH UR;                                                               00005003
 FIM                                                                    00006003
SELECT * FROM SYSIBM.SYSTABAUTH A                                       00010002
 WHERE NOT EXISTS (SELECT '1' FROM SYSIBM.SYSTABLES B                   00011002
                    WHERE A.SCREATOR = B.CREATOR                        00012002
                      AND A.STNAME   = B.NAME                           00013002
                      AND B.TYPE = 'T')                                 00014002
WITH UR;                                                                00015002
SELECT * FROM SYSIBM.SYSTABAUTH A                                       00016003
 WHERE NOT EXISTS (SELECT '1' FROM SYSIBM.SYSTABLES B                   00017003
                    WHERE A.SCREATOR = B.CREATOR                        00018003
                      AND A.STNAME   = B.NAME                           00019003
                      AND B.TYPE = 'T')                                 00019103
WITH UR;                                                                00019203
  'MVSPUSER', 'CSPPUSER', 'INFORMIX', 'IFXPUSER', 'CA7ONL')             00020001
SELECT * FROM SYSIBM.SYSTABAUTH                                         00040002
 WHERE GRANTEE IN (                                                     00050002
  'MVSPUSER', 'CSPPUSER', 'INFORMIX', 'IFXPUSER', 'CA7ONL')             00060002
WITH UR;                                                                00070002
