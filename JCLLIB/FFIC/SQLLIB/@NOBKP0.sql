SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,      00010023
       S.DBNAME                                                         00011023
  FROM SYSIBM.SYSTABLESPACE S                                           00020012
WHERE SUBSTR(S.NAME,1,3) NOT IN ('BMC','EDI')                           00031017
  AND S.NAME NOT LIKE '%8K'                                             00032012
  AND SUBSTR(S.DBNAME,1,3) NOT IN ('DSN','SYS','KTC','BMC','DB2',       00033020
                                   'DBA','DSQ','ADB')                   00034021
  AND NOT EXISTS (                                                      00040008
          SELECT '1'                                                    00050010
            FROM SYSIBM.SYSCOPY C                                       00060010
           WHERE S.DBNAME = C.DBNAME                                    00070010
             AND S.NAME = C.TSNAME                                      00080012
--           AND C.ICDATE BETWEEN '160701' AND '160716'                 00090014
             AND C.ICDATE >= '160701'                                   00091014
             AND C.TIMESTAMP >=(CURRENT_TIMESTAMP - 30 DAYS)            00110015
             AND C.ICTYPE = 'F'                                         00120014
        );                                                              00130010
--                                                                      00131022
SELECT DISTINCT                                                         00140025
       CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,               00141025
       S.DBNAME, S.NAME                                                 00150022
  FROM SYSIBM.SYSTABLESPACE S                                           00160022
--WHERE SUBSTR(S.NAME,1,3) NOT IN ('BMC','EDI')                         00170027
--  AND S.NAME NOT LIKE '%8K'                                           00180027
--  AND SUBSTR(S.DBNAME,1,3) NOT IN ('DSN','SYS','DB2','DBA','BMC',     00181027
--                                   'KTC','DSQ','ADB')                 00182027
WHERE NOT EXISTS (                                                      00210027
          SELECT '1'                                                    00220022
            FROM SYSIBM.SYSCOPY C                                       00230022
           WHERE S.DBNAME = C.DBNAME                                    00240022
             AND S.NAME = C.TSNAME                                      00250022
             AND C.TIMESTAMP >=(CURRENT_TIMESTAMP - 30 DAYS)            00280022
             AND C.ICTYPE = 'F'                                         00290022
--AND SUBSTR(S.DBNAME,1,3) NOT IN ('DSN','SYS','DB2','DBA','BMC',       00290127
--                                 'KTC','DSQ','ADB')                   00290227
        );                                                              00300022
