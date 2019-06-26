SELECT DISTINCT JOBNAME                                                 00010006
  FROM SYSIBM.SYSCOPY                                                   00020002
 WHERE ICTYPE='F'                                                       00030002
   AND ICDATE BETWEEN '110917' AND '110918'                             00040002
;                                                                       00050007
SELECT DISTINCT JOBNAME                                                 00051008
  FROM (                                                                00052008
SELECT JOBNAME,TIMESTAMP                                                00060008
  FROM SYSIBM.SYSCOPY                                                   00070007
 WHERE ICTYPE='F'                                                       00080007
   AND TIMESTAMP BETWEEN '2011-09-17-21.00.00.000000' AND               00091007
                         '2011-09-18-11.00.00.000000') AS T1            00092009
;                                                                       00100007
