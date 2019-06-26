SELECT CDFONET, COUNT(*)                                                00010000
  FROM MARITIMA.SEGURADO                                                00020000
GROUP BY CDFONET                                                        00030000
ORDER BY 2 DESC                                                         00040000
FOR FETCH ONLY WITH UR                                                  00050000
