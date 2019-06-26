SELECT * FROM DBA1ADM.MYVIEW ;                                          00000103
FIM;                                                                    00000203
SET CURRENT SQLID='DBA1ADM';                                            00000301
CREATE VIEW DBA1ADM.MYVIEW AS (                                         00000401
SELECT CHAR(DATA) AS C1 , CHAR(HORA) AS C2 ,                            00000502
       CHAR(DSNAME) AS C3                                               00000602
  FROM DBA1ADM.HSTVSAM )                                                00000701
;                                                                       00000800
