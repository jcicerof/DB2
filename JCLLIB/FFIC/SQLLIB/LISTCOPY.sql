SELECT                                                                  00010000
'//DSN1COPY EXEC PGM=DSN1COPY,PARM=''CHECK,FULLCOPY'''                  00020017
,DBNAME,1                                                               00021017
  FROM SYSIBM.SYSCOPY                                                   00030000
 WHERE ICDATE >= '120101'                                               00040018
   AND ICTYPE ='F'                                                      00050002
   AND SUBSTR(DSNAME,4,1) <> 'X'                                        00060002
   AND SUBSTR(DSNAME,6,3) = 'DB2'                                       00070005
 GROUP BY DBNAME                                                        00080017
UNION ALL                                                               00081009
SELECT                                                                  00082010
'//STEPLIB  DD DISP=SHR,DSN=DB2K.DB2LOAD'                               00083012
,DBNAME,2                                                               00084017
  FROM SYSIBM.SYSCOPY                                                   00085010
 WHERE ICDATE >= '120101'                                               00086018
   AND ICTYPE ='F'                                                      00087010
   AND SUBSTR(DSNAME,4,1) <> 'X'                                        00088010
   AND SUBSTR(DSNAME,6,3) = 'DB2'                                       00089010
 GROUP BY DBNAME                                                        00089117
UNION ALL                                                               00089212
SELECT                                                                  00089312
'//SYSPRINT DD SYSOUT=*'                                                00089412
,DBNAME,3                                                               00089517
  FROM SYSIBM.SYSCOPY                                                   00089612
 WHERE ICDATE >= '120101'                                               00089718
   AND ICTYPE ='F'                                                      00089812
   AND SUBSTR(DSNAME,4,1) <> 'X'                                        00089912
   AND SUBSTR(DSNAME,6,3) = 'DB2'                                       00090012
 GROUP BY DBNAME                                                        00090117
UNION ALL                                                               00090212
SELECT                                                                  00091012
--MIN('//SYSUT1 DD DISP=OLD,DSN='||STRIP(DSNAME))                       00100016
MAX('//SYSUT1 DD DISP=OLD,DSN='||STRIP(DSNAME))                         00101016
,DBNAME,4                                                               00110017
  FROM SYSIBM.SYSCOPY                                                   00120009
 WHERE ICDATE >= '120101'                                               00130018
   AND ICTYPE ='F'                                                      00140009
   AND SUBSTR(DSNAME,4,1) <> 'X'                                        00150009
   AND SUBSTR(DSNAME,6,3) = 'DB2'                                       00160009
 GROUP BY DBNAME                                                        00170017
UNION ALL                                                               00180010
SELECT                                                                  00190010
'//SYSUT2   DD DUMMY'                                                   00200010
,DBNAME,5                                                               00210017
  FROM SYSIBM.SYSCOPY                                                   00220010
 WHERE ICDATE >= '120101'                                               00230018
   AND ICTYPE ='F'                                                      00240010
   AND SUBSTR(DSNAME,4,1) <> 'X'                                        00250010
   AND SUBSTR(DSNAME,6,3) = 'DB2'                                       00260010
 GROUP BY DBNAME                                                        00270017
 ORDER BY 2,3                                                           00280017
