SELECT                                                                  00001003
CHAR('GRANT SELECT, INSERT, DELETE, UPDATE ON '||                       00002006
STRIP(A.CREATOR)||'.'||STRIP(A.NAME),80),                               00003006
A.CREATOR,A.NAME, 1                                                     00004009
FROM SYSIBM.SYSTABLES A                                                 00005005
 WHERE A.TYPE = 'T'                                                     00020000
   AND SUBSTR(A.CREATOR,1,3) IN ('ANO','TEC','MAR')                     00021002
   AND NOT EXISTS (SELECT 1 FROM SYSIBM.SYSTABAUTH B                    00030000
                    WHERE A.CREATOR = B.TCREATOR                        00040000
                      AND A.NAME    = B.TTNAME                          00050000
                      AND B.GRANTEE IN ('MVSPUSER','CSPPUSER','CA7ONL', 00060000
                                        'INFORMIX','IFXPUSER')          00070000
                  )                                                     00080001
UNION ALL                                                               00081003
SELECT                                                                  00180003
CHAR('   TO CSPPUSER, MVSPUSER,INFORMIX,IFXPUSER,CA7ONL;',80),          00190008
A.CREATOR,A.NAME, 2                                                     00191009
FROM SYSIBM.SYSTABLES A                                                 00210003
 WHERE A.TYPE = 'T'                                                     00211003
   AND SUBSTR(A.CREATOR,1,3) IN ('ANO','TEC','MAR')                     00212003
   AND NOT EXISTS (SELECT 1 FROM SYSIBM.SYSTABAUTH B                    00213003
                    WHERE A.CREATOR = B.TCREATOR                        00214003
                      AND A.NAME    = B.TTNAME                          00215003
                      AND B.GRANTEE IN ('MVSPUSER','CSPPUSER','CA7ONL', 00216003
                                        'INFORMIX','IFXPUSER')          00217003
                  )                                                     00218003
ORDER BY 2,3,4                                                          00219009
