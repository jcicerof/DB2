SELECT DTLANCAM,COUNT(*)                                                00010000
FROM MARITIMA.TBMVCONT                                                  00020000
GROUP BY DTLANCAM                                                       00030000
ORDER BY 2 DESC                                                         00040000
FOR READ ONLY WITH UR;                                                  00050001
