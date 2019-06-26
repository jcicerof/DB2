 SELECT COUNT(*), DBPROTOCOL, CREATOR                                   00001722
  FROM SYSIBM.SYSPLAN                                                   00001820
 WHERE DBPROTOCOL IN ('P', 'D')                                         00001920
   AND BINDTIME  >= '2014-08-04-00.00.00.000000'                        00002025
 GROUP BY DBPROTOCOL,CREATOR                                            00002122
;                                                                       00002220
SELECT COUNT(*),DBPROTOCOL,OWNER                                        00002325
  FROM SYSIBM.SYSPACKAGE                                                00002411
 WHERE DBPROTOCOL = 'D' --IN ('D', 'P')                                 00002523
   AND BINDTIME  >= '2014-08-04-00.00.00.000000'                        00002623
 GROUP BY DBPROTOCOL,OWNER                                              00002725
;                                                                       00002816
SELECT 'DB2J' AS SUBSYS, 'PKG' AS TYPE,                                 00003009
       PK.COLLID, PK.NAME,                                              00003100
  --     PK.CONTOKEN,                                                   00003200
       PK.VERSION,                                                      00003300
       PK.VALID, PK.OPERATIVE,                                          00003404
       STRIP(PK.OWNER) AS OWNER,                                        00003500
       STRIP(PK.QUALIFIER) AS QUALIFIER,                                00003600
       PK.QUOTE,                                                        00004000
       SUBSTR(PS.STMT, 47, 1) AS STMT47,                                00005000
       SUBSTR(PS.STMT, 43, 1) AS STMT43                                 00006000
  FROM SYSIBM.SYSPACKAGE PK,                                            00007000
       SYSIBM.SYSPACKSTMT PS                                            00008000
 WHERE PK.LOCATION=PS.LOCATION                                          00009000
   AND PK.COLLID=PS.COLLID                                              00009100
   AND PK.NAME=PS.NAME                                                  00009200
   AND PK.CONTOKEN=PS.CONTOKEN                                          00009300
   AND PS.LOCATION=' '                                                  00009400
   AND PK.DBPROTOCOL='P' AND PK.TYPE=' '                                00009511
   AND (PS.SEQNO=0 AND PS.STMTNO=0                                      00009600
   AND PS.SECTNO=0)                                                     00009700
-- ORDER BY 1, 2, 3 FOR READ ONLY WITH UR                               00009800
;                                                                       00009900
