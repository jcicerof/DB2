SELECT DISTINCT                                                         00010010
CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,                      00011023
JOBNAME                                                                 00020025
  FROM SYSIBM.SYSCOPY                                                   00030000
 WHERE ICDATE BETWEEN '161001' AND '170601'                             00040023
   AND ICTYPE = 'F'                                                     00050000
-- AND DAYOFWEEK(TIMESTAMP) IN (1,7)                                    00060026
   AND SUBSTR(JOBNAME,1,4) <> 'IBM1';                                   00070025
                                                                        00071025
SELECT DISTINCT                                                         00080025
CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,                      00090025
DBNAME,TSNAME,JOBNAME,                                                  00100025
CASE DAYOFWEEK(TIMESTAMP)                                               00110025
 WHEN 1 THEN 'SUN'                                                      00120025
 WHEN 7 THEN 'SAT'                                                      00130025
END AS "DAYOFWEEK"                                                      00140025
  FROM SYSIBM.SYSCOPY                                                   00150025
 WHERE ICDATE BETWEEN '161001' AND '170601'                             00160025
   AND ICTYPE = 'F'                                                     00170025
-- AND DAYOFWEEK(TIMESTAMP) IN (1,7)                                    00180026
   AND SUBSTR(JOBNAME,1,4) <> 'IBM1'                                    00190025
