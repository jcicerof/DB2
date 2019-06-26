SELECT A.CDPRM, COUNT(*) FROM TECINFOR.CONDICAOGERENQ2 A,               00010085
                            TECINFOR.CNDGERENQCLS B                     00011085
WHERE A.CDPRM = B.CDPRM                                                 00012085
GROUP BY A.CDPRM                                                        00020086
ORDER BY 2 DESC                                                         00030083
FOR FETCH ONLY WITH UR;                                                 00040083
SELECT CDPRM, COUNT(*) FROM TECINFOR.CONDICAOGERENQ2                    00090085
GROUP BY CDPRM                                                          00100085
ORDER BY 2 DESC                                                         00110085
FOR FETCH ONLY WITH UR;                                                 00120085
SELECT CDPRM, COUNT(*) FROM TECINFOR.CNDGERENQCLS                       00130085
GROUP BY CDPRM                                                          00140085
ORDER BY 2 DESC                                                         00150085
FOR FETCH ONLY WITH UR;                                                 00160085
