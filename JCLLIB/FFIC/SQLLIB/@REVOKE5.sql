-- TABLE_NAME, GRANTEE, DBNAME                                          00001000
-- REVOKE SELECT                                                        00002000
--     ON CREATOR.NAME FROM USER BY ALL;                                00003000
                                                                        00004000
SELECT DISTINCT                                                         00005002
A.TCREATOR, A.TTNAME,                                                   00006000
A.GRANTEE, B.DBNAME,                                                    00007003
STRIP(A.TTNAME)||'.'||STRIP(A.GRANTEE)||'.'||STRIP(B.DBNAME)            00008003
  FROM SYSIBM.SYSTABAUTH A,                                             00009000
       SYSIBM.SYSTABLES B                                               00010000
 WHERE A.TCREATOR = B.CREATOR                                           00020000
   AND A.TTNAME   = B.NAME                                              00030000
   AND B.TYPE ='T'                                                      00040000
   AND STRIP(A.TTNAME)||'.'||STRIP(A.GRANTEE)||'.'||STRIP(B.DBNAME)     00060000
    IN    ('PLAN_TABLE.DOMV2702.BMCPERF')                               00070006
  ORDER BY 5                                                            00160003
