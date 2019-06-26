--                                                                      00001000
-- CHANGE TABLE NAME AND CREATOR                                        00002000
--                                                                      00003000
--                                                                      00004000
  SELECT * FROM SYSIBM.SYSTABLESPACE A,                                 00005000
                SYSIBM.SYSTABLES     B                                  00006000
   WHERE B.NAME LIKE  'CONDICAOGERENQ%'                                 00007001
     AND B.CREATOR  = 'TECINFOR'                                        00008000
     AND B.TYPE ='T'                                                    00009000
     AND A.NAME = B.TSNAME                                              00010000
     AND A.DBNAME  = B.DBNAME                                           00020000
  WITH UR;                                                              00030000
