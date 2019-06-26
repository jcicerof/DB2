--SELECT MAX(EXPLAIN_TIME),MAX(BIND_TIME)                               00010009
SELECT *                                                                00011009
  FROM CSPPUSER.PLAN_TABLE A,                                           00020000
       CSPPUSER.DSN_STATEMNT_TABLE B                                    00030000
 WHERE                                                                  00040000
       B.QUERYNO = A.QUERYNO                                            00050000
   AND A.COLLID   = 'MAPCCOLE'                                          00060000
   AND A.PROGNAME = 'NM100D1'                                           00070000
   AND A.PROGNAME = B.PROGNAME                                          00080000
   AND A.COLLID   = B.COLLID                                            00090000
   AND EXPLAIN_TIME = '2009-05-31-14.46.16.387772'                      00100009
-- AND A.TIMESTAMP = '2008090704021988'                                 00101000
   AND BIND_TIME >= '2009-05-31-14.46.16.387772'                        00110009
   ORDER BY A.QUERYNO, A.QBLOCKNO, A.PLANNO, A.MIXOPSEQ;                00120009
