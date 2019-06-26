SELECT DISTINCT A.DBNAME, A.JOBNAME, MAX(TIMESTAMP) AS TIMESTAMP
--SELECT DISTINCT A.DBNAME, A.TSNAME, A.JOBNAME
--       ,STRIP(B.CREATOR)||'.'||STRIP(B.NAME)
  FROM SYSIBM.SYSCOPY A,
       SYSIBM.SYSTABLES B
 WHERE B.TYPE = 'T'
   AND B.DBNAME = A.DBNAME
   AND B.TSNAME = A.TSNAME
   AND A.ICTYPE = 'F'
   AND STRIP(B.CREATOR)||'.'||STRIP(B.NAME) IN (
       'DB2TEST.PRIDE_AUDIT'
     , 'DB2TEST.PRIDE_EMF_DATA'
     , 'DB2TEST.PRIDE_EMF_STATUS'
     , 'DB2TEST.PRO_LICNSE_ACTIVTY'
     , 'DB2ACPT.PRIDE_AUDIT'
     , 'DB2BTS.PRIDE_AUDIT'
     , 'DB2ACPT.PRIDE_EMF_DATA'
     , 'DB2ACPT.PRIDE_EMF_STATUS'
     , 'DB2ACPT.PRO_LICNSE_ACTIVTY'
       )
 GROUP BY A.DBNAME, A.JOBNAME
 ORDER BY 3 DESC
;
SELECT DISTINCT A.JOBNAME, MAX(A.ICDATE)
--SELECT DISTINCT A.DBNAME, A.TSNAME, A.JOBNAME
--       ,STRIP(B.CREATOR)||'.'||STRIP(B.NAME)
  FROM SYSIBM.SYSCOPY A
 WHERE A.DBNAME IN (
                             'D7ATDV01',
                             'DPRO0T01',
                             'DPRO0T01',
                             'D7ATDV01',
                             'D7ATDV01',
                             'D7AADV01',
                             'D7ABDV01'
                 )
 GROUP BY A.JOBNAME
;
SELECT DBNAME,COUNT(*)
  FROM SYSIBM.SYSTABLESPACE
 WHERE DBNAME IN (
                             'D7ATDV01',
                             'DPRO0T01',
                             'DPRO0T01',
                             'D7ATDV01',
                             'D7ATDV01',
                             'D7AADV01',
                             'D7ABDV01'
                 )
 GROUP BY DBNAME
