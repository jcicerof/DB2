SELECT DBNAME,NAME,MAX(STATSTIME)                                       00010022
  FROM SYSIBM.SYSTABLESPACE                                             00020020
 WHERE SUBSTR(DBNAME,1,4) IN ('DCLI', 'DIAP', 'DFMS', 'DPMX', 'DBCW')   00030010
 GROUP BY DBNAME, NAME                                                  00031022
;                                                                       00091008
SELECT DBNAME,TSNAME,SUBSTR(DBNAME,1,4),ICTYPE,MAX(TIMESTAMP)           00091120
  FROM SYSIBM.SYSCOPY                                                   00091220
 WHERE SUBSTR(DBNAME,1,4) IN ('DCLI', 'DIAP', 'DFMS', 'DPMX', 'DBCW')   00091320
   AND ICTYPE IN ('W', 'X')                                             00091420
  GROUP BY DBNAME, TSNAME, ICTYPE                                       00091520
;                                                                       00091620
SELECT SUBSTR(DBNAME,1,4) AS DBNAME,                                    00092017
       COUNT(*) AS "#TABLESPACES"                                       00092118
  FROM SYSIBM.SYSTABLESPACE                                             00093013
 WHERE SUBSTR(DBNAME,1,4) IN ('DCLI', 'DIAP', 'DFMS', 'DPMX', 'DBCW')   00094013
  GROUP BY SUBSTR(DBNAME,1,4)                                           00095014
;                                                                       00097013
SELECT                                                                  00098019
       COUNT(*) AS "#TABLESPACES"                                       00099019
  FROM SYSIBM.SYSTABLESPACE                                             00100019
 WHERE SUBSTR(DBNAME,1,4) IN ('DCLI', 'DIAP', 'DFMS', 'DPMX', 'DBCW')   00110019
;                                                                       00130019
