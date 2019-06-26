--
-- UTILITY GUIDE AND REFERENCE - DB2 10 FOR Z/OS (SC19-2984-03)
-- DETERMINING PAGE SIZE AND DSSIZE (PG.871)
--
--
--
SELECT T.CREATOR,T.NAME,S.DBNAME,
       S.NAME AS TABLESPACE,S.PARTITIONS,S.PGSIZE,
       CASE S.DSSIZE
        WHEN 0 THEN
               CASE WHEN S.TYPE = 'G' THEN 4194304
                    WHEN S.TYPE = 'O' THEN 4194304
                    WHEN S.TYPE = 'P' THEN 4194304
                    WHEN S.TYPE = 'R' THEN 4194304
               ELSE
                    CASE WHEN S.PARTITIONS > 254 THEN
                         CASE WHEN S.PGSIZE = 4 THEN 4194304
                              WHEN S.PGSIZE = 8 THEN 8388608
                              WHEN S.PGSIZE = 16 THEN 16777216
                              WHEN S.PGSIZE = 32 THEN 33554432
                         ELSE NULL
                         END
                         WHEN S.PARTITIONS > 64 THEN 4194304
                         WHEN S.PARTITIONS > 32 THEN 1048576
                         WHEN S.PARTITIONS > 16 THEN 2097152
                         WHEN S.PARTITIONS > 0 THEN 4194304
                    ELSE 2097152
                    END
               END
        ELSE S.DSSIZE
        END
        AS DSSIZE
  FROM SYSIBM.SYSTABLES T,
       SYSIBM.SYSTABLESPACE S
 WHERE
     --T.NAME = 'DEPT' AND
       T.DBNAME = S.DBNAME
   AND T.TSNAME = S.NAME;
