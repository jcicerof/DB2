 SELECT 'DB2A' AS SUBSYS, 'PLN' AS TYPE,                                00010107
       A.NAME AS PLNAME, B.NAME AS DBRM,                                00011008
       A.CREATOR, A.QUALIFIER,                                          00020000
       A.VALID, A.OPERATIVE,                                            00021004
       A.PLENTRIES,                                                     00030000
       B.VERSION, B.QUOTE,                                              00040000
       SUBSTR(C.TEXT, 47, 1) AS STMT47,                                 00050000
       SUBSTR(C.TEXT, 43, 1) AS STMT43                                  00060000
  FROM SYSIBM.SYSPLAN A, SYSIBM.SYSDBRM B,                              00070000
       SYSIBM.SYSSTMT C                                                 00080000
 WHERE A.NAME=B.PLNAME AND B.PLNAME=C.PLNAME                            00090000
   AND B.NAME=C.NAME AND A.DBPROTOCOL='P'                               00100000
   AND (C.STMTNO=0 AND C.STMTNOI=0                                      00110000
        AND C.SECTNO=0 AND C.SEQNO=0)                                   00120000
-- ORDER BY 1, 2 FOR READ ONLY WITH UR                                  00130000
;                                                                       00140000
