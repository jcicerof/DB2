  INCLUDE COND=(02,8,CH,EQ,C'DSNU112I',OR,                         X
                02,8,CH,EQ,C'DSNU100I',OR,                         X
                02,8,CH,EQ,C'DSNU105I',OR,                         X
                18,8,CH,EQ,C'UTILITY ',OR,                         X
                28,8,CH,EQ,C'LOAD    ',OR,                         X
                28,8,CH,EQ,C'REORG   ',OR,                         X
                28,8,CH,EQ,C'RECOVERY')                            X
  OPTION COPY
