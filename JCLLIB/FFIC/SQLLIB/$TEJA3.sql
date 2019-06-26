--
-- LISTA DE PLANS/PACKAGES
--
SELECT DISTINCT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID,
       A.DBNAME,A.CREATOR,A.NAME,
       B.DCOLLID, B.DNAME
  FROM SYSIBM.SYSTABLES A,
       SYSIBM.SYSPACKDEP B
 WHERE B.BQUALIFIER = A.CREATOR
   AND B.BNAME = A.NAME
   AND A.TYPE = 'T'
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
                    ,'DPER0M00');
