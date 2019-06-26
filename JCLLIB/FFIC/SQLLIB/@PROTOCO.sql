SELECT 'DB2A' AS SUBSYS, 'PKG' AS TYPE,                                 00001034
       PK.COLLID, PK.NAME,                                              00001127
  --     PK.CONTOKEN,                                                   00002027
       PK.VERSION,                                                      00002127
       STRIP(PK.OWNER) AS OWNER,                                        00003027
       STRIP(PK.QUALIFIER) AS QUALIFIER,                                00003127
       PK.QUOTE,                                                        00004027
       SUBSTR(PS.STMT, 47, 1) AS STMT47,                                00005027
       SUBSTR(PS.STMT, 43, 1) AS STMT43                                 00006027
  FROM SYSIBM.SYSPACKAGE PK,                                            00007027
       SYSIBM.SYSPACKSTMT PS                                            00008027
 WHERE PK.LOCATION=PS.LOCATION                                          00009027
   AND PK.COLLID=PS.COLLID                                              00009127
   AND PK.NAME=PS.NAME                                                  00009227
   AND PK.CONTOKEN=PS.CONTOKEN                                          00009327
   AND PS.LOCATION=' '                                                  00009427
   AND PK.DBPROTOCOL='P' AND PK.TYPE=' '                                00009527
   AND (PS.SEQNO=0 AND PS.STMTNO=0                                      00009627
   AND PS.SECTNO=0)                                                     00009727
-- ORDER BY 1, 2, 3 FOR READ ONLY WITH UR                               00009827
;                                                                       00009927
--                                                                      00010007
 SELECT 'DB2A' AS SUBSYS, 'PLN' AS TYPE,                                00010134
       A.NAME, B.NAME,                                                  00011025
       A.CREATOR, A.QUALIFIER,                                          00020025
       A.PLENTRIES,                                                     00030025
       B.VERSION, B.QUOTE,                                              00040025
       SUBSTR(C.TEXT, 47, 1) AS STMT47,                                 00050025
       SUBSTR(C.TEXT, 43, 1) AS STMT43                                  00060025
  FROM SYSIBM.SYSPLAN A, SYSIBM.SYSDBRM B,                              00070025
       SYSIBM.SYSSTMT C                                                 00080025
 WHERE A.NAME=B.PLNAME AND B.PLNAME=C.PLNAME                            00090025
   AND B.NAME=C.NAME AND A.DBPROTOCOL='P'                               00100025
   AND (C.STMTNO=0 AND C.STMTNOI=0                                      00110025
        AND C.SECTNO=0 AND C.SEQNO=0)                                   00120025
-- ORDER BY 1, 2 FOR READ ONLY WITH UR                                  00130007
;                                                                       00140025
