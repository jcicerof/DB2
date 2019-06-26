-- VERIFICAR SE EH BATCH (MVSPUSER) OU ONLINE (CSPPUSER)                00000100
--                                                                      00000200
--SELECT * FROM SYSIBM.SYSPACKAGE WHERE NAME = 'SQL36475';              00000327
                                                                        00000422
SELECT DISTINCT                                                         00000508
       A.QUERYNO,A.QBLOCKNO, A.APPLNAME, A.PROGNAME, A.MIXOPSEQ,        00000608
       A.PLANNO, A.METHOD, A.CREATOR,  A.TNAME,                         00000708
       A.TABNO,  A.ACCESSTYPE,  A.MATCHCOLS,                            00000808
       A.ACCESSCREATOR,  A.ACCESSNAME, A.INDEXONLY,                     00000908
       B.STMT_TYPE,B.COST_CATEGORY,B.PROCMS, B.PROCSU                   00001012
       ,A.BIND_TIME,D.BINDTIME                                          00001124
  FROM REFSAUD.PLAN_TABLE A,                                            00001200
       REFSAUD.DSN_STATEMNT_TABLE B,                                    00001300
       SYSIBM.SYSINDEXES           C                                    00001417
      ,SYSIBM.SYSPACKAGE D                                              00001518
 WHERE B.QUERYNO = A.QUERYNO                                            00001600
   AND B.APPLNAME = A.APPLNAME                                          00001700
   AND B.PROGNAME = A.PROGNAME                                          00001800
   AND A.COLLID = D.COLLID                                              00001918
   AND B.PROGNAME = D.NAME                                              00002019
   AND A.BIND_TIME = D.BINDTIME                                         00002126
   AND D.VALID = 'Y'                                                    00002218
   AND D.OPERATIVE = 'Y'                                                00002318
   AND B.PROGNAME = 'SQL36475'                                          00002415
   AND D.COLLID = 'SSRF'                                                00002521
--                                                                      00002615
-- AND B.PROGNAME IN ( SELECT EXTERNAL_NAME                             00002715
--                       FROM SYSIBM.SYSROUTINES                        00002815
--                     WHERE NAME IN ('SSSPSEHODGL01'                   00002915
--                                   ,'SSSPCBOL01'                      00003015
--                                   ,'SSSPESPMDCL01'                   00003115
--                                   ,'SSSPSERL01'                      00003215
--                                   ,'SSSPPROAMBL02'                   00003315
--                                   ,'SSSPPROAMBL03'                   00003415
--                                   ,'SSSPPROAMBL04'                   00003515
--                                   ,'SSSPCARGOL01'                    00003615
--                                   ,'SSSPSEGDEPL01'                   00003715
--                                   ,'SSSPSEGDEPL02'                   00003815
--                                   ,'SSSPORGAOEMISSL01')              00003915
--                   )                                                  00004015
-- AND A.TNAME    = 'SSPGMSEG'                                          00004115
   AND C.CREATOR = A.ACCESSCREATOR                                      00004215
   AND C.NAME    = A.ACCESSNAME                                         00004315
-- AND A.QUERYNO = 4096                                                 00004415
   ORDER BY A.BIND_TIME DESC,                                           00004525
            A.QUERYNO, A.QBLOCKNO, A.PLANNO, A.MIXOPSEQ                 00004615
WITH UR;                                                                00004715
FIM                                                                     00004815
SELECT *                                                                00004915
  FROM CSPPUSER.PLAN_TABLE A,                                           00005015
       CSPPUSER.DSN_STATEMNT_TABLE B,                                   00005115
       SYSIBM.SYSINDEXES           C                                    00005215
 WHERE B.QUERYNO = A.QUERYNO                                            00005315
   AND B.APPLNAME = A.APPLNAME                                          00005415
   AND B.PROGNAME = A.PROGNAME                                          00005515
-- AND B.PROGNAME = 'SB407A'                                            00005615
   AND A.TNAME    = 'SSPGMSEG'                                          00005715
   AND C.CREATOR = A.ACCESSCREATOR                                      00005815
   AND C.NAME    = A.ACCESSNAME                                         00005915
   AND A.ACCESSCREATOR = 'MARITIMA'                                     00006015
   AND A.ACCESSNAME = 'SSPGMSEG_IX3'                                    00006115
-- AND A.QUERYNO = 4096                                                 00006215
-- ORDER BY A.QUERYNO, A.QBLOCKNO, A.PLANNO, A.MIXOPSEQ                 00006315
WITH UR;                                                                00007015
