SELECT * FROM DBA1ADM.HSTVSAM                                           00010000
 WHERE DATA = (SELECT MAX(DATA) FROM DBA1ADM.HSTVSAM)                   00020000
