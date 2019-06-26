SELECT* FROM SYSIBM.SYSTABLES                                           00001001
 WHERE  NAME = 'CLT_ADR_SEARCH'                                         00002001
   AND TYPE = 'T'                                                       00002101
;                                                                       00003001
SELECT *                                                                00003102
  FROM SYSIBM.SYSCOPY                                                   00003202
 WHERE DBNAME = 'DCLI0T00' AND TSNAME LIKE 'SFEN0T%'                    00003302
 ORDER BY DBNAME,TSNAME, TIMESTAMP DESC;                                00003402
FIM;                                                                    00004000
SELECT A.CREATOR, A.NAME, A.DBNAME, A.TSNAME, B.PARTITIONS              00010000
  FROM SYSIBM.SYSTABLES A,                                              00020000
       SYSIBM.SYSTABLESPACE B                                           00021000
 WHERE A.NAME IN ('CLIENT_TAB'        ,                                 00030000
                'CLT_REF_RELATION'  ,                                   00040000
                'CLT_CLT_RELATION'  ,                                   00050000
                'CLIENT_POLICY'     ,                                   00060000
                'CLT_OBJ_RELATION'  ,                                   00070000
                'CLIENT_POLICY'     ,                                   00080000
                'CLIENT_ADDRESS'    ,                                   00090000
                'CLT_ADR_REALATION' ,                                   00100000
                'INDIVIDUAL_CLIENT' ,                                   00110000
                'CLIENT_LICENSE')                                       00120000
   AND A.TYPE = 'T'                                                     00130000
   AND A.CREATOR = 'CERT'                                               00140000
   AND A.DBNAME = B.DBNAME                                              00141000
   AND A.TSNAME = B.NAME                                                00142000
;                                                                       00150000
SELECT DBNAME,TSNAME,DSNAME                                             00160000
  FROM SYSIBM.SYSCOPY                                                   00170000
 WHERE JOBNAME = 'DAACPMX0'                                             00180000
   AND ICDATE = '100612'                                                00190000
   AND ((DBNAME ='DCLI0R00' AND TSNAME='SEEN0R00') OR                   00191000
        (DBNAME ='DCLI0R00' AND TSNAME='SEHN0R00') OR                   00200000
        (DBNAME ='DCLI0R00' AND TSNAME='SEKN0R00') OR                   00210000
        (DBNAME ='DCLI0R00' AND TSNAME='SEPN0R00') OR                   00220000
        (DBNAME ='DCLI0R00' AND TSNAME='SEWN0R00') OR                   00230000
        (DBNAME ='DCLI0R00' AND TSNAME='SEZN0R00') OR                   00240000
        (DBNAME ='DCLI0R01' AND TSNAME='SERN0R01') OR                   00250000
        (DBNAME ='DCLI0R01' AND TSNAME='SFAN0R01'))                     00260000
