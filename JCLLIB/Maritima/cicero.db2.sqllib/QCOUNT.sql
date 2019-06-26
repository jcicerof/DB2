SELECT TPPRM,                                                           00010000
       CDPRM ,                                                          00020000
       TPPRMCND ,                                                       00030000
       COUNT(*)                                                         00040000
 FROM TECINFOR.CONDICAOGERENQ1                                          00050000
GROUP BY  TPPRM,                                                        00060000
          CDPRM ,                                                       00070000
          TPPRMCND                                                      00080000
ORDER BY 4 DESC WITH UR;                                                00090000
