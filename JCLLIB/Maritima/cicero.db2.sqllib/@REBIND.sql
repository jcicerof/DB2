--REBIND PACKAGE(AUTODC.SQL62423) ISOLATION(CS) EXPLAIN(YES)            00001003
SELECT DISTINCT                                                         00010005
'REBIND PACKAGE('||STRIP(DCOLLID)||'.'||STRIP(DNAME)||                  00011004
      ') ISOLATION(CS) EXPLAIN(YES)'                                    00012003
  FROM SYSIBM.SYSPACKDEP WHERE BNAME = 'ORCAMENTOITECOB';               00020002
