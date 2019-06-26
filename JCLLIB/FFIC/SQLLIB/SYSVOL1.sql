SELECT DISTINCT '-STO DB('||STRIP(DBNAME)||') SPACE(*)'                 00010001
  FROM SYSIBM.SYSTABLEPART                                              00020000
 WHERE VCATNAME = 'MACDE'                                               00030000
