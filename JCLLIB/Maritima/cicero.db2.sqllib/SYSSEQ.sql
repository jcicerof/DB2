SELECT 'ALTER SEQUENCE '||STRIP(NAME)||' RESTART WITH '||               00001004
       STRIP(DIGITS(MAXASSIGNEDVAL+1),L,'0')                            00002006
  FROM SYSIBM.SYSSEQUENCES                                              00003004
WHERE SEQTYPE='I';                                                      00004004
FIM;                                                                    00005004
SELECT * FROM SYSIBM.SYSSEQUENCESDEP                                    00010001
WHERE DTYPE='I';                                                        00020001
SELECT * FROM SYSIBM.SYSSEQUENCES                                       00030001
WHERE SEQTYPE='I';                                                      00040001
