SELECT SUM(HI_A_RBA),DATA                                               00010023
FROM DB2ADM.HSTVSAM                                                     00020023
GROUP BY DATA                                                           00030023
FOR READ ONLY WITH UR;                                                  00100016
