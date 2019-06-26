SELECT                                                                  00010001
CHAR('SELECT CHAR('||''''||STRIP(NAME)||''''||                          00010105
',20), DIGITS(COUNT(*))',80),NAME,1                                     00010206
  FROM SYSIBM.SYSTABLES                                                 00011000
 WHERE CREATOR = 'DB2PDPRC' AND TYPE = 'T'                              00020000
UNION ALL                                                               00031003
SELECT                                                                  00032006
CHAR('FROM '||                                                          00034006
STRIP(CREATOR)||'.'||STRIP(NAME),80),                                   00035006
NAME,2                                                                  00036006
  FROM SYSIBM.SYSTABLES                                                 00037006
 WHERE CREATOR = 'DB2PDPRC' AND TYPE = 'T'                              00038006
UNION ALL                                                               00039006
SELECT                                                                  00040003
CHAR('FOR READ ONLY WITH UR;',80),NAME,3                                00060006
  FROM SYSIBM.SYSTABLES                                                 00070003
 WHERE CREATOR = 'DB2PDPRC' AND TYPE = 'T'                              00080003
ORDER BY 2,3                                                            00081003
 FOR READ ONLY WITH UR;                                                 00090003
