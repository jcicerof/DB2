SELECT DISTINCT  CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,     00010011
       S.DBNAME,S.NAME,ST.PARTITION,                                    00010111
       ST.COPYLASTTIME                                                  00011001
  FROM SYSIBM.SYSTABLESPACE S,                                          00020001
       SYSIBM.SYSTABLESPACESTATS ST                                     00030001
 WHERE S.DBNAME = ST.DBNAME                                             00040001
   AND S.NAME = ST.NAME                                                 00050001
   AND SUBSTR(S.DBNAME,1,3) NOT IN ('DSN','SYS','DB2','DBA','BMC',      00060010
                                    'KTC','DSQ','ADB','DDB')            00070012
   AND S.NAME NOT LIKE '%8K'                                            00071012
   AND (ST.COPYLASTTIME <= CURRENT TIMESTAMP - 30 DAYS OR               00080005
        ST.COPYLASTTIME IS NULL)                                        00090005
