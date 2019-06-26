   SELECT DISTINCT GRANTEE                                              00001011
     FROM SYSIBM.SYSTABAUTH                                             00002010
    WHERE TTNAME  = 'GRUPOCATAUTO'                                      00003010
      AND (SELECTAUTH = 'Y' OR                                          00004010
           INSERTAUTH = 'Y' OR                                          00005010
           DELETEAUTH = 'Y' OR                                          00006010
           UPDATEAUTH = 'Y')                                            00007010
      AND GRANTEETYPE <> 'P'                                            00008011
   FOR READ ONLY WITH UR;                                               00009010
                                                                        00009110
-- GRANT SELECT,INSERT,DELETE,UPDATE ON CREATOR.TABLE TO PROSISE;       00010000
-- GRANT SELECT,INSERT,DELETE,UPDATE ON CREATOR.TABLE TO PROSISE;       00011000
-- SELECT TCREATOR,TTNAME,SELECTAUTH,INSERTAUTH,DELETEAUTH,UPDATEAUTH   00020001
--   FROM SYSIBM.SYSTABAUTH                                             00050001
--  WHERE GRANTEE = 'PROSISE'                                           00060001
--    AND (SELECTAUTH = 'Y' OR                                          00061001
--         INSERTAUTH = 'Y' OR                                          00062001
--         DELETEAUTH = 'Y' OR                                          00063001
--         UPDATEAUTH = 'Y')                                            00064001
-- FETCH FIRST 50 ROWS ONLY                                             00070001
-- FOR READ ONLY WITH UR;                                               00080001
                                                                        00081000
-- SELECT  'GRANT'||                                                    00090010
--       CASE WHEN SELECTAUTH='Y' THEN ' SELECT' ELSE '' END||          00100010
--       CASE WHEN INSERTAUTH='Y' THEN ',INSERT' ELSE '' END||          00110010
--       CASE WHEN DELETEAUTH='Y' THEN ',DELETE' ELSE '' END||          00120010
--       CASE WHEN UPDATEAUTH='Y' THEN ',UPDATE' ELSE '' END||          00130010
--       ' ON '||STRIP(TCREATOR)||'.'||STRIP(TTNAME)||                  00140010
--       ' TO AUTOCIR;'                                                 00141010
-- FROM SYSIBM.SYSTABAUTH                                               00150010
--WHERE GRANTEE = 'AUTOMAR'                                             00160009
--WHERE TTNAME  = 'GRUPOCATAUTO'                                        00161010
--  AND (SELECTAUTH = 'Y' OR                                            00162010
--       INSERTAUTH = 'Y' OR                                            00163010
--       DELETEAUTH = 'Y' OR                                            00164010
--       UPDATEAUTH = 'Y')                                              00165010
--FETCH FIRST 50 ROWS ONLY                                              00170000
--FOR READ ONLY WITH UR;                                                00180010
