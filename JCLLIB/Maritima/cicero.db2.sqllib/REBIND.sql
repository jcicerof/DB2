--REBIND PACKAGE(AUTODC.SQL62423) ISOLATION(CS) EXPLAIN(YES)            00001000
SELECT DISTINCT                                                         00002000
'REBIND PACKAGE('||STRIP(DCOLLID)||'.'||STRIP(DNAME)||                  00003000
      ') ISOLATION(CS) EXPLAIN(YES)'                                    00004000
  FROM SYSIBM.SYSPACKDEP WHERE BNAME IN ('RSSCOM');                     00005001
