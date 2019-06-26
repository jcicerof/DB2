SELECT 'DB2A' AS SSID,                                                  00050099
       A.DBNAME,A.NAME,A.PARTITIONS,A.SEGSIZE,A.DSSIZE,A.NTABLES,       00060099
       A.TYPE,A.MAXPARTITIONS,                                          00061099
       B.CREATOR,B.NAME                                                 00070099
  FROM SYSIBM.SYSTABLESPACE A,                                          00080099
       SYSIBM.SYSTABLES B                                               00090099
 WHERE                                                                  00100099
       SUBSTR(A.DBNAME,1,3) NOT IN ('DSN','DSQ')                        00120099
   AND A.DBNAME IN ('DDBA0T00'                                          00121099
                   ,'DLCDB'                                             00122099
                   ,'DRTL0P00')                                         00123099
   AND B.DBNAME = A.DBNAME                                              00130099
   AND B.TSNAME = A.NAME                                                00140099
 ORDER BY A.PARTITIONS DESC;                                            00150099
                                                                        00151099
SELECT 'DB2A' AS SSID,                                                  00160099
       A.DBNAME,A.NAME,A.PARTITIONS,A.SEGSIZE,A.DSSIZE,A.NTABLES,       00170099
       A.TYPE,A.MAXPARTITIONS,                                          00180099
       B.CREATOR,B.NAME                                                 00190099
  FROM SYSIBM.SYSTABLESPACE A,                                          00200099
       SYSIBM.SYSTABLES B                                               00210099
 WHERE A.SEGSIZE =0                                                     00220099
   AND B.TYPE = 'T'                                                     00230099
   AND SUBSTR(A.DBNAME,1,3) NOT IN ('DSN','DSQ')                        00240099
   AND B.DBNAME = A.DBNAME                                              00250099
   AND B.TSNAME = A.NAME                                                00260099
 ORDER BY A.PARTITIONS DESC;                                            00270099
