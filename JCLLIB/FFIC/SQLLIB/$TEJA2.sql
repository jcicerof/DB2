--
-- LISTA DE UTILITARIOS
--
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       A.DBNAME,A.NAME,
       C.JOBNAME,MAX(C.TIMESTAMP),
       CASE C.ICTYPE
            WHEN 'I' THEN 'COPY'
            WHEN 'F' THEN 'COPY'
            WHEN 'M' THEN 'MODIFY'
            WHEN 'Q' THEN 'QUIESCE'
            WHEN 'R' THEN 'LOAD REPLACE'
            WHEN 'S' THEN 'LOAD REPLACE'
            WHEN 'W' THEN 'REORG'
            WHEN 'X' THEN 'REORG'
            WHEN 'Y' THEN 'LOAD RESUME'
            WHEN 'Z' THEN 'LOAD RESUME'
       END AS JOBTYPE
  FROM SYSIBM.SYSTABLESPACE A,
       SYSIBM.SYSCOPY   C
 WHERE A.DBNAME = C.DBNAME
   AND A.NAME = C.TSNAME
   AND C.ICTYPE IN ('I','F','M','Q','R','S','W','X','Y','Z')
   AND A. DBNAME IN ('DPER0P00'
                    ,'DPUT0P00'
                    ,'DSRE0P00'
                    ,'DUDTCP00'
                    ,'DPOL0PZZ'
                    ,'DUDT2KEF'
                    ,'DCLI0P00'
                    ,'DSRE0PR0'
                    ,'DUDT0P00'
                    ,'DPOL0P00'
                    ,'DCLI0P01'
                    ,'DQSTAP00'
                    ,'DSRS1CCK'
                    ,'DQSTBP00'
                    ,'DUDT1P00'
                    ,'DUDT3P00'
                    ,'DQST0P00'
                    ,'DSRU0P00'
                    ,'DUDT2P00'
                    ,'DPER0PZZ'
                    ,'DSRS1JNB'
                    ,'DSRU0PR0'
                    ,'DFLS0P00'
                    ,'DPAN0P00'
                    ,'DPER0M00')
GROUP BY CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4),
       A.DBNAME,A.NAME,
       C.JOBNAME,C.ICTYPE;
