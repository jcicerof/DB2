SELECT DISTINCT 'DB2Q',
STRIP(A.VCATNAME)||'.DSNDBD.'||STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME),
     MAX(A.PARTITION),B.TYPE, B.DSSIZE, A.COMPRESS
  FROM SYSIBM.SYSTABLEPART A
           , SYSIBM.SYSTABLESPACE B
 WHERE A.DBNAME = B.DBNAME
   AND A.TSNAME = B.NAME
   AND B.PARTITIONS > 0
GROUP BY 'DB2P',
STRIP(A.VCATNAME)||'.DSNDBD.'||STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME),
B.TYPE,B.DSSIZE, B.PARTITIONS, A.COMPRESS
;