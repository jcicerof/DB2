-- TABLE_NAME, GRANTEE, DBNAME                                          00001000
-- REVOKE SELECT                                                        00010000
--     ON CREATOR.NAME FROM USER BY ALL;                                00020000
                                                                        00030000
SELECT                                                                  00031001
'REVOKE ALTER ON '||STRIP(A.TCREATOR)||'.'||STRIP(A.TTNAME)||           00032002
' FROM '||STRIP(A.GRANTEE)||' BY ALL;'                                  00033001
--SELECT A.TCREATOR, A.TTNAME, A.GRANTEE                                00040001
  FROM SYSIBM.SYSTABAUTH A,                                             00050000
       SYSIBM.SYSTABLES B                                               00060000
 WHERE A.TCREATOR = B.CREATOR                                           00070000
   AND A.TTNAME   = B.NAME                                              00080000
   AND B.TYPE ='T'                                                      00090000
   AND A.ALTERAUTH ='Y'                                                 00091000
   AND STRIP(A.TTNAME)||'.'||STRIP(A.GRANTEE)||'.'||STRIP(B.DBNAME)     00100000
    IN    ('DW_CONTROL.AZL6HRM.DMMM1A00'                                00120000
          ,'DW_CONTROL.AZL6HRM.DMMM1T00'                                00130000
          ,'MMM0_CTOT.AZL6M09.DMMM0A00'                                 00140000
          ,'DW_CONTROL.AZL6M36.DMMM1A00'                                00150000
          ,'DW_CONTROL.AZL6M36.DMMM1T00'                                00160000
          ,'MMM0_PACT.AZL6RBS.DMMM0A00'                                 00170000
          ,'MDU_PROCESS_SEQ.HIP2DAS.DQSTBT00'                           00180000
          ,'MDU_PROCESS_SEQ.HIP2DAS.DQSTBA00'                           00190000
          ,'PLAN_TABLE_EBCDIC.SEE1BAO.DQSTXB00')                        00200000
UNION ALL                                                               00210003
SELECT                                                                  00220003
'REVOKE DELETE ON '||STRIP(A.TCREATOR)||'.'||STRIP(A.TTNAME)||          00230003
' FROM '||STRIP(A.GRANTEE)||' BY ALL;'                                  00240003
--SELECT A.TCREATOR, A.TTNAME, A.GRANTEE                                00250003
  FROM SYSIBM.SYSTABAUTH A,                                             00260003
       SYSIBM.SYSTABLES B                                               00270003
 WHERE A.TCREATOR = B.CREATOR                                           00280003
   AND A.TTNAME   = B.NAME                                              00290003
   AND B.TYPE ='T'                                                      00300003
   AND A.DELETEAUTH ='Y'                                                00310003
   AND STRIP(A.TTNAME)||'.'||STRIP(A.GRANTEE)||'.'||STRIP(B.DBNAME)     00320003
    IN    ('DW_CONTROL.AZL6HRM.DMMM1A00'                                00330003
          ,'DW_CONTROL.AZL6HRM.DMMM1T00'                                00340003
          ,'MMM0_CTOT.AZL6M09.DMMM0A00'                                 00350003
          ,'DW_CONTROL.AZL6M36.DMMM1A00'                                00360003
          ,'DW_CONTROL.AZL6M36.DMMM1T00'                                00370003
          ,'MMM0_PACT.AZL6RBS.DMMM0A00'                                 00380003
          ,'MDU_PROCESS_SEQ.HIP2DAS.DQSTBT00'                           00390003
          ,'MDU_PROCESS_SEQ.HIP2DAS.DQSTBA00'                           00400003
          ,'PLAN_TABLE_EBCDIC.SEE1BAO.DQSTXB00')                        00410003
UNION ALL                                                               00420003
SELECT                                                                  00430003
'REVOKE INSERT ON '||STRIP(A.TCREATOR)||'.'||STRIP(A.TTNAME)||          00440003
' FROM '||STRIP(A.GRANTEE)||' BY ALL;'                                  00450007
--SELECT A.TCREATOR, A.TTNAME, A.GRANTEE                                00460003
  FROM SYSIBM.SYSTABAUTH A,                                             00470003
       SYSIBM.SYSTABLES B                                               00480003
 WHERE A.TCREATOR = B.CREATOR                                           00490003
   AND A.TTNAME   = B.NAME                                              00500003
   AND B.TYPE ='T'                                                      00510003
   AND A.INSERTAUTH ='Y'                                                00520003
   AND STRIP(A.TTNAME)||'.'||STRIP(A.GRANTEE)||'.'||STRIP(B.DBNAME)     00530003
    IN    ('DW_CONTROL.AZL6HRM.DMMM1A00'                                00540003
          ,'DW_CONTROL.AZL6HRM.DMMM1T00'                                00550003
          ,'MMM0_CTOT.AZL6M09.DMMM0A00'                                 00560003
          ,'DW_CONTROL.AZL6M36.DMMM1A00'                                00570003
          ,'DW_CONTROL.AZL6M36.DMMM1T00'                                00580003
          ,'MMM0_PACT.AZL6RBS.DMMM0A00'                                 00590003
          ,'MDU_PROCESS_SEQ.HIP2DAS.DQSTBT00'                           00600003
          ,'MDU_PROCESS_SEQ.HIP2DAS.DQSTBA00'                           00610003
          ,'PLAN_TABLE_EBCDIC.SEE1BAO.DQSTXB00')                        00620003
UNION ALL                                                               00630003
SELECT                                                                  00640003
'REVOKE SELECT ON '||STRIP(A.TCREATOR)||'.'||STRIP(A.TTNAME)||          00650003
' FROM '||STRIP(A.GRANTEE)||' BY ALL;'||'    '||STRIP(B.DBNAME)         00660007
--SELECT A.TCREATOR, A.TTNAME, A.GRANTEE                                00670003
  FROM SYSIBM.SYSTABAUTH A,                                             00680003
       SYSIBM.SYSTABLES B                                               00690003
 WHERE A.TCREATOR = B.CREATOR                                           00700003
   AND A.TTNAME   = B.NAME                                              00710003
   AND B.TYPE ='T'                                                      00720003
   AND A.SELECTAUTH ='Y'                                                00730003
   AND STRIP(A.TTNAME)||'.'||STRIP(A.GRANTEE)||'.'||STRIP(B.DBNAME)     00740003
    IN    ('DW_CONTROL.AZL6HRM.DMMM1A00'                                00750003
          ,'DW_CONTROL.AZL6HRM.DMMM1T00'                                00760003
          ,'MMM0_CTOT.AZL6M09.DMMM0A00'                                 00770003
          ,'DW_CONTROL.AZL6M36.DMMM1A00'                                00780003
          ,'DW_CONTROL.AZL6M36.DMMM1T00'                                00790003
          ,'MMM0_PACT.AZL6RBS.DMMM0A00'                                 00800003
          ,'MDU_PROCESS_SEQ.HIP2DAS.DQSTBT00'                           00810003
          ,'MDU_PROCESS_SEQ.HIP2DAS.DQSTBA00'                           00820003
          ,'PLAN_TABLE_EBCDIC.SEE1BAO.DQSTXB00')                        00830003
UNION ALL                                                               00840003
SELECT                                                                  00850003
'REVOKE UPDATE ON '||STRIP(A.TCREATOR)||'.'||STRIP(A.TTNAME)||          00860004
' FROM '||STRIP(A.GRANTEE)||' BY ALL;'                                  00870003
--SELECT A.TCREATOR, A.TTNAME, A.GRANTEE                                00880003
  FROM SYSIBM.SYSTABAUTH A,                                             00890003
       SYSIBM.SYSTABLES B                                               00900003
 WHERE A.TCREATOR = B.CREATOR                                           00910003
   AND A.TTNAME   = B.NAME                                              00920003
   AND B.TYPE ='T'                                                      00930003
   AND A.UPDATEAUTH ='Y'                                                00940004
   AND STRIP(A.TTNAME)||'.'||STRIP(A.GRANTEE)||'.'||STRIP(B.DBNAME)     00950003
    IN    ('DW_CONTROL.AZL6HRM.DMMM1A00'                                00960003
          ,'DW_CONTROL.AZL6HRM.DMMM1T00'                                00970003
          ,'MMM0_CTOT.AZL6M09.DMMM0A00'                                 00980003
          ,'DW_CONTROL.AZL6M36.DMMM1A00'                                00990003
          ,'DW_CONTROL.AZL6M36.DMMM1T00'                                01000003
          ,'MMM0_PACT.AZL6RBS.DMMM0A00'                                 01010003
          ,'MDU_PROCESS_SEQ.HIP2DAS.DQSTBT00'                           01020003
          ,'MDU_PROCESS_SEQ.HIP2DAS.DQSTBA00'                           01030003
          ,'PLAN_TABLE_EBCDIC.SEE1BAO.DQSTXB00')                        01040003
UNION ALL                                                               01041004
SELECT                                                                  01042004
'REVOKE TRIGGER ON '||STRIP(A.TCREATOR)||'.'||STRIP(A.TTNAME)||         01043004
' FROM '||STRIP(A.GRANTEE)||' BY ALL;'                                  01044004
--SELECT A.TCREATOR, A.TTNAME, A.GRANTEE                                01045004
  FROM SYSIBM.SYSTABAUTH A,                                             01046004
       SYSIBM.SYSTABLES B                                               01047004
 WHERE A.TCREATOR = B.CREATOR                                           01048004
   AND A.TTNAME   = B.NAME                                              01049004
   AND B.TYPE ='T'                                                      01049104
   AND A.TRIGGERAUTH ='Y'                                               01049204
   AND STRIP(A.TTNAME)||'.'||STRIP(A.GRANTEE)||'.'||STRIP(B.DBNAME)     01049304
    IN    ('DW_CONTROL.AZL6HRM.DMMM1A00'                                01049404
          ,'DW_CONTROL.AZL6HRM.DMMM1T00'                                01049504
          ,'MMM0_CTOT.AZL6M09.DMMM0A00'                                 01049604
          ,'DW_CONTROL.AZL6M36.DMMM1A00'                                01049704
          ,'DW_CONTROL.AZL6M36.DMMM1T00'                                01049804
          ,'MMM0_PACT.AZL6RBS.DMMM0A00'                                 01049904
          ,'MDU_PROCESS_SEQ.HIP2DAS.DQSTBT00'                           01050004
          ,'MDU_PROCESS_SEQ.HIP2DAS.DQSTBA00'                           01050104
          ,'PLAN_TABLE_EBCDIC.SEE1BAO.DQSTXB00')                        01050204
UNION ALL                                                               01051004
SELECT                                                                  01060003
'REVOKE REFERENCES ON '||STRIP(A.TCREATOR)||'.'||STRIP(A.TTNAME)||      01070003
' FROM '||STRIP(A.GRANTEE)||' BY ALL;'                                  01080003
--SELECT A.TCREATOR, A.TTNAME, A.GRANTEE                                01090003
  FROM SYSIBM.SYSTABAUTH A,                                             01100003
       SYSIBM.SYSTABLES B                                               01110003
 WHERE A.TCREATOR = B.CREATOR                                           01120003
   AND A.TTNAME   = B.NAME                                              01130003
   AND B.TYPE ='T'                                                      01140003
   AND A.REFERENCESAUTH ='Y'                                            01150003
   AND STRIP(A.TTNAME)||'.'||STRIP(A.GRANTEE)||'.'||STRIP(B.DBNAME)     01160003
    IN    ('DW_CONTROL.AZL6HRM.DMMM1A00'                                01170003
          ,'DW_CONTROL.AZL6HRM.DMMM1T00'                                01180003
          ,'MMM0_CTOT.AZL6M09.DMMM0A00'                                 01190003
          ,'DW_CONTROL.AZL6M36.DMMM1A00'                                01200003
          ,'DW_CONTROL.AZL6M36.DMMM1T00'                                01210003
          ,'MMM0_PACT.AZL6RBS.DMMM0A00'                                 01220003
          ,'MDU_PROCESS_SEQ.HIP2DAS.DQSTBT00'                           01230003
          ,'MDU_PROCESS_SEQ.HIP2DAS.DQSTBA00'                           01240003
          ,'PLAN_TABLE_EBCDIC.SEE1BAO.DQSTXB00')                        01250003
UNION ALL                                                               01260003
SELECT                                                                  01270003
'REVOKE INDEX ON '||STRIP(A.TCREATOR)||'.'||STRIP(A.TTNAME)||           01280003
' FROM '||STRIP(A.GRANTEE)||' BY ALL;'                                  01290003
--SELECT A.TCREATOR, A.TTNAME, A.GRANTEE                                01300003
  FROM SYSIBM.SYSTABAUTH A,                                             01310003
       SYSIBM.SYSTABLES B                                               01320003
 WHERE A.TCREATOR = B.CREATOR                                           01330003
   AND A.TTNAME   = B.NAME                                              01340003
   AND B.TYPE ='T'                                                      01350003
   AND A.INDEXAUTH ='Y'                                                 01360003
   AND STRIP(A.TTNAME)||'.'||STRIP(A.GRANTEE)||'.'||STRIP(B.DBNAME)     01370003
    IN    ('DW_CONTROL.AZL6HRM.DMMM1A00'                                01380003
          ,'DW_CONTROL.AZL6HRM.DMMM1T00'                                01390003
          ,'MMM0_CTOT.AZL6M09.DMMM0A00'                                 01400003
          ,'DW_CONTROL.AZL6M36.DMMM1A00'                                01410003
          ,'DW_CONTROL.AZL6M36.DMMM1T00'                                01420003
          ,'MMM0_PACT.AZL6RBS.DMMM0A00'                                 01430003
          ,'MDU_PROCESS_SEQ.HIP2DAS.DQSTBT00'                           01440003
          ,'MDU_PROCESS_SEQ.HIP2DAS.DQSTBA00'                           01450003
          ,'PLAN_TABLE_EBCDIC.SEE1BAO.DQSTXB00')                        01460003
