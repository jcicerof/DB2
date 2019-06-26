--DROP SYNONYM                                                          00001003
SELECT 'DROP SYNONYM '||STRIP(B.NAME)||';'                              00010005
  FROM SYSIBM.SYSTABLES A,                                              00020000
       SYSIBM.SYSSYNONYMS B                                             00030000
 WHERE B.TBCREATOR = A.CREATOR                                          00040000
   AND B.TBNAME    = A.NAME                                             00050001
   AND A.DBNAME    = 'DEDI0A00'                                         00060001
   AND A.TYPE      = 'T'                                                00070001
