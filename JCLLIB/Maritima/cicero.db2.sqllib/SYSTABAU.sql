--SELECT * FROM SYSIBM.SYSTABAUTH                                       00010001
-- WHERE GRANTEE = 'REAU900A'                                           00020001
-- WITH UR;                                                             00030001
--SELECT A.GRANTEE,A.TCREATOR,A.TTNAME,B.CARD,A.DELETEAUTH              00040015
SELECT DISTINCT STRIP(TCREATOR)||'.'||STRIP(TTNAME),                    00040120
'INCLUDE TABLESPACE '||STRIP(B.DBNAME)||'.'||STRIP(B.TSNAME),           00040223
                B.CARD                                                  00040322
  FROM SYSIBM.SYSTABAUTH A,                                             00040419
       SYSIBM.SYSTABLES B                                               00041003
 WHERE --B.NAME LIKE 'SENH%'                                            00050014
       A.TCREATOR = B.CREATOR                                           00051014
   AND A.TTNAME = B.NAME                                                00052001
--   AND A.GRANTEE = 'ADMDADOS'                                         00052114
   AND A.GRANTEETYPE = 'P'                                              00052214
   AND A.GRANTEE IN ('REMK010X'                                         00052317
                    ,'REMK020A'                                         00052417
                    ,'REMK010R'                                         00052517
                    ,'REMK015R'                                         00052617
                    ,'GD001B1'                                          00052717
                    ,'REMK101R'                                         00052817
                    ,'REMK100R'                                         00052917
                    ,'REMK102R')                                        00053018
   AND B.TYPE = 'T'                                                     00054001
 WITH UR;                                                               00060001
