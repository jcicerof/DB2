SELECT D.*                                                              00010002
FROM  SYSIBM.SYSTABLES A RIGHT OUTER JOIN SYSIBM.SYSCOLUMNS B           00020002
                    ON  A.NAME = B.TBNAME                               00030003
                    AND A.CREATOR = B.TBCREATOR                         00040003
      RIGHT JOIN SYSIBM.SYSTABLESPACE C                                 00041003
                    ON  A.TSNAME = C.NAME                               00042003
                    AND A.DBNAME  = C.DBNAME                            00043003
      RIGHT JOIN SYSIBM.SYSDATABASE   D                                 00044003
                    ON  A.DBNAME  = D.NAME                              00046003
WHERE A.NAME = 'SSCOREPE'                                               00050000
