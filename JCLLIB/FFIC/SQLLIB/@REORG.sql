SELECT B.CREATOR,B.NAME,A.DBNAME,A.TSNAME,A.ICTYPE,
       A.JOBNAME,A.TIMESTAMP
  FROM SYSIBM.SYSCOPY A,
       SYSIBM.SYSTABLES B
 WHERE A.ICTYPE IN ('W', 'X')
   AND A.DBNAME = B.DBNAME
   AND A.TSNAME = B.TSNAME
   AND B.TYPE    = 'T'
   AND B.CREATOR = 'ERSPROD'
   AND B.NAME  IN ('TBBDATTRIBS'
                  ,'TBPSATTRIBS'
                  ,'TBDMATTRIBS'
                  ,'TBREMRKS')
;
FIM;
SELECT B.CREATOR,B.NAME,A.DBNAME,A.TSNAME,A.ICTYPE,
       A.JOBNAME,A.TIMESTAMP
  FROM SYSIBM.SYSCOPY A,
       SYSIBM.SYSTABLES B
 WHERE A.ICTYPE IN ('W', 'X')
   AND A.DBNAME = B.DBNAME
   AND A.TSNAME = B.TSNAME
   AND B.TYPE    = 'T'
   AND B.CREATOR = 'ERSPROD'
   AND B.NAME  IN ('TBREMRKS'
                  ,'TBREMRKS'
                  ,'TBBDATTRIBS'
                  ,'TBBDATTRIBS'
                  ,'TBBDATTRIBS'
                  ,'TBBDATTRIBS'
                  ,'TBDMATTRIBS'
                  ,'TBDMATTRIBS'
                  ,'TBDMATTRIBS'
                  ,'TBDMATTRIBS'
                  ,'TBPSATTRIBS'
                  ,'TBPSATTRIBS'
                  ,'TBPSATTRIBS'
                  ,'TBPSATTRIBS')
