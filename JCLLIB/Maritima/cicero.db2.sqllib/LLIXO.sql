-- GRANT SELECT,INSERT,DELETE,UPDATE ON CREATOR.TABLE TO PROSISE;       00010059
-- GRANT SELECT,INSERT,DELETE,UPDATE ON CREATOR.TABLE TO PROSISE;       00011059
 SELECT TCREATOR,TTNAME,SELECTAUTH,INSERTAUTH,DELETEAUTH,UPDATEAUTH     00020064
   FROM SYSIBM.SYSTABAUTH                                               00050054
  WHERE GRANTEE = 'PROSISE'                                             00060056
    AND (SELECTAUTH = 'Y' OR                                            00061066
         INSERTAUTH = 'Y' OR                                            00062066
         DELETEAUTH = 'Y' OR                                            00063066
         UPDATEAUTH = 'Y')                                              00064066
--FETCH FIRST 50 ROWS ONLY                                              00070056
FOR READ ONLY WITH UR;                                                  00080055
                                                                        00081063
 SELECT  'GRANT '||                                                     00090063
         CASE WHEN SELECTAUTH='Y' THEN ' SELECT' ELSE '' END||          00100069
         CASE WHEN INSERTAUTH='Y' THEN ',INSERT' ELSE '' END||          00110069
         CASE WHEN DELETEAUTH='Y' THEN ',DELETE' ELSE '' END||          00120069
         CASE WHEN UPDATEAUTH='Y' THEN ',UPDATE' ELSE '' END||          00130069
         ' ON '||STRIP(TCREATOR)||'.'||STRIP(TTNAME)||' TO PROSISE;'    00140063
   FROM SYSIBM.SYSTABAUTH                                               00150063
  WHERE GRANTEE = 'PROSISE'                                             00160063
    AND (SELECTAUTH = 'Y' OR                                            00162067
         INSERTAUTH = 'Y' OR                                            00163067
         DELETEAUTH = 'Y' OR                                            00164067
         UPDATEAUTH = 'Y')                                              00165067
--FETCH FIRST 50 ROWS ONLY                                              00170063
FOR READ ONLY WITH UR;                                                  00180063
