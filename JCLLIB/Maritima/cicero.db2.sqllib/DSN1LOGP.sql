-- LISTA TABLESPACES                                                    00005000
  SELECT B.CREATOR,B.NAME,B.DBNAME,B.TSNAME,A.DBID,A.PSID,B.DBID,       00006000
         HEX(A.DBID) AS HEX_DBID, HEX(A.PSID) AS HEX_PSID               00006101
    FROM SYSIBM.SYSTABLESPACE A,                                        00006200
         SYSIBM.SYSTABLES     B                                         00007000
   WHERE B.NAME = 'PROPOSTAONBASE'                                      00008000
     AND B.CREATOR  = 'TECINFOR'                                        00009000
     AND B.TYPE ='T'                                                    00009100
     AND A.NAME = B.TSNAME                                              00009200
     AND A.DBNAME  = B.DBNAME                                           00009300
  WITH UR;                                                              00009400
                                                                        00009500
