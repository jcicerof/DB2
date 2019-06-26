SELECT DDD, TELEFONE, COUNT(*) FROM SQLUSER.CORRETOR                    00010000
GROUP BY DDD, TELEFONE                                                  00020000
ORDER BY 3 DESC                                                         00030000
FOR FETCH ONLY WITH UR;                                                 00040000
