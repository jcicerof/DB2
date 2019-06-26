-- LISTA DURANTE O INTERVALO DE DATAS QUEM SOFREU LOAD,RECOVER          00010016
-- APOS O IMAGE COPY DE DR                                              00020016
--                                                                      00030016
SELECT A.DBNAME, A.TSNAME,                                              00090013
       A.ICTYPE AS ICLOAD,                                              00091014
       B.TIMESTAMP AS TSCOPY, A.TIMESTAMP AS TSLOAD,                    00100015
       SUBSTR(B.DSNAME,6,4) AS SUBSYS, A.JOBNAME AS LOADJOB             00101020
  FROM SYSIBM.SYSCOPY A                                                 00110004
     , SYSIBM.SYSCOPY B                                                 00120004
 WHERE A.ICTYPE IN ('R', 'S', 'Y', 'Z', 'E', 'P')                       00130006
   AND A.TIMESTAMP BETWEEN '2011-10-15-00.00.00.000000' AND             00140008
                           '2011-10-18-19.00.00.000000'                 00150008
   AND A.TIMESTAMP >  B.TIMESTAMP                                       00160006
   AND B.TIMESTAMP BETWEEN '2011-10-15-00.00.00.000000' AND             00160110
                           '2011-10-18-19.00.00.000000'                 00160210
   AND B.DSNAME LIKE '%X.DB2%'                                          00161006
   AND B.ICTYPE = 'F'                                                   00162007
   AND A.DBNAME = B.DBNAME                                              00170004
   AND A.TSNAME = B.TSNAME                                              00180004
   AND NOT EXISTS (SELECT '1' FROM SYSIBM.SYSCOPY C                     00190017
                    WHERE C.DBNAME = A.DBNAME                           00200017
                      AND C.TSNAME = A.TSNAME                           00210017
                      AND C.ICTYPE = 'F'                                00220017
             AND C.TIMESTAMP BETWEEN '2011-10-15-00.00.00.000000' AND   00230017
                           '2011-10-18-19.00.00.000000'                 00240017
                      AND C.DSNAME LIKE '%X.DB2%'                       00250017
                      AND C.TIMESTAMP >  A.TIMESTAMP)                   00260017
