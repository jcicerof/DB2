SELECT                                                                  00010007
CHAR('GRANT SELECT, INSERT, DELETE, UPDATE ON '||                       00011021
STRIP(CREATOR)||'.'||STRIP(A.NAME),80),                                 00011121
A.NAME, 1                                                               00012008
FROM SYSIBM.SYSTABLES A                                                 00020006
WHERE A.CREATEDTS >= '2009-02-18-00.00.00.000000'                       00021028
  AND A.TYPE = 'T'                                                      00030012
  AND A.CREATOR <> 'DMRPR'                                              00030125
--AND A.CREATOR = 'MARITIMA'                                            00030225
UNION                                                                   00031008
SELECT                                                                  00040008
CHAR('TO CSPPUSER, MVSPUSER,INFORMIX,IFXPUSER,CA7ONL;',80),             00060021
A.NAME, 2                                                               00061008
FROM SYSIBM.SYSTABLES A                                                 00070008
WHERE A.CREATEDTS >= '2009-02-18-00.00.00.000000'                       00080028
  AND A.TYPE = 'T'                                                      00081012
  AND A.CREATOR <> 'DMRPR'                                              00081125
--AND A.CREATOR = 'MARITIMA'                                            00082016
ORDER BY 2,3                                                            00100008
