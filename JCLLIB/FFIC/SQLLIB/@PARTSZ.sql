SELECT U.OBJTYPE, U.DBNAME, U.NAME, U.SPACE, U.TYPE, U.DSSIZE,
       U.PART, U.PARTITIONS, U.PIECESIZE
  FROM ( SELECT 'TS', RTS.DBNAME, RTS.NAME, RTS.SPACE,
               TS.TYPE, TS.DSSIZE, RTS.PARTITION,
               TS.PARTITIONS, -1
          FROM SYSIBM.SYSTABLESPACE   TS   ,
               SYSIBM.TABLESPACESTATS    RTS
          WHERE RTS.SPACE        IS NOT NULL
            AND RTS.DBNAME       = TS.DBNAME
            AND RTS.NAME         = TS.NAME
      AND ((RTS.SPACE > 3600000 AND TS.TYPE = 'L' AND RTS.PARTITION > 0
           AND RTS.SPACE > (TS.DSSIZE * 0.9))
           OR TS.TYPE <> 'L'
       AND (((RTS.SPACE > 3600000 AND RTS.SPACE > (TS.DSSIZE * 0.9)
               AND TS.PARTITIONS BETWEEN 1 and 16)
          OR (RTS.SPACE > 1800000 AND RTS.SPACE > (TS.DSSIZE * 0.9)
              AND TS.PARTITIONS BETWEEN 17 and 32)
          OR (RTS.SPACE > 900000 AND RTS.SPACE > (TS.DSSIZE * 0.9)
              AND TS.PARTITIONS > 32)) OR RTS.SPACE > 50000000))
      UNION ALL
        SELECT 'IX', RTS.DBNAME, RTS.INDEXSPACE, RTS.SPACE,
               TS.TYPE, TS.DSSIZE, RTS.PARTITION,
               TS.PARTITIONS, IX.PIECESIZE
        FROM SYSIBM.INDEXSPACESTATS RTS,
               SYSIBM.SYSINDEXES      IX,
               SYSIBM.SYSTABLES       TB,
               SYSIBM.SYSTABLESPACE   TS
          WHERE RTS.SPACE        IS NOT NULL
            AND RTS.INDEXSPACE   = IX.INDEXSPACE
            AND RTS.DBNAME       = IX.DBNAME
            AND IX.TBCREATOR     = TB.CREATOR
            AND IX.TBNAME        = TB.NAME
            AND TB.DBNAME        = TS.DBNAME
            AND TB.TSNAME        = TS.NAME
       AND ((RTS.SPACE > 3600000 AND TS.TYPE = 'L' AND RTS.PARTITION > 0
           AND RTS.SPACE > (TS.DSSIZE * 0.9))
           OR TS.TYPE <> 'L'
       AND (((RTS.SPACE > 3600000 AND RTS.SPACE > (TS.DSSIZE * 0.9)
           AND TS.PARTITIONS BETWEEN 1 and 16 AND RTS.PARTITION > 0)
           OR (RTS.SPACE > 1800000 AND RTS.SPACE > (TS.DSSIZE * 0.9)
           AND TS.PARTITIONS BETWEEN 17 and 32 AND RTS.PARTITION > 0)
           OR (RTS.SPACE > 900000 AND RTS.SPACE > (TS.DSSIZE * 0.9)
           AND TS.PARTITIONS > 32 AND RTS.PARTITION > 0))
           OR RTS.SPACE > 50000000))
       ) AS U(OBJTYPE, DBNAME, NAME, SPACE, TYPE, DSSIZE, PART,
              PARTITIONS, PIECESIZE )
  ORDER BY U.DBNAME, U.NAME, U.PART