                                                                        00010008
 SELECT  'GRANT'||                                                      00040008
         CASE WHEN SELECTAUTH='Y' THEN ' SELECT' ELSE '' END||          00050008
         CASE WHEN INSERTAUTH='Y' THEN ',INSERT' ELSE '' END||          00060008
         CASE WHEN DELETEAUTH='Y' THEN ',DELETE' ELSE '' END||          00070008
         CASE WHEN UPDATEAUTH='Y' THEN ',UPDATE' ELSE '' END||          00080008
         ' ON '||STRIP(TCREATOR)||'.'||STRIP(TTNAME)||                  00090008
         ' TO '||STRIP(GRANTEE)||';'                                    00100008
   FROM SYSIBM.SYSTABAUTH                                               00110008
  WHERE TCREATOR = 'TECINFOR'                                           00120008
    AND TTNAME   = 'CONDICAOGERENQ3'                                    00121008
    AND GRANTEETYPE = ' '                                               00122008
    AND GRANTEE <> 'PUBLIC'                                             00123008
    AND (SELECTAUTH = 'Y' OR                                            00130008
         INSERTAUTH = 'Y' OR                                            00140008
         DELETEAUTH = 'Y' OR                                            00150008
         UPDATEAUTH = 'Y')                                              00160008
--FETCH FIRST 50 ROWS ONLY                                              00170008
FOR READ ONLY WITH UR;                                                  00180008
--                                                                      00181008
 SELECT  *                                                              00190009
   FROM SYSIBM.SYSTABAUTH                                               00260009
  WHERE TCREATOR = 'TECINFOR'                                           00270009
    AND TTNAME   = 'CONDICAOGERENQ3'                                    00280009
    AND GRANTEETYPE = ' '                                               00281009
--  AND GRANTEE <> 'PUBLIC'                                             00282009
    AND (SELECTAUTH = 'Y' OR                                            00290009
         INSERTAUTH = 'Y' OR                                            00300009
         DELETEAUTH = 'Y' OR                                            00310009
         UPDATEAUTH = 'Y')                                              00320009
--FETCH FIRST 50 ROWS ONLY                                              00330009
FOR READ ONLY WITH UR;                                                  00340009
