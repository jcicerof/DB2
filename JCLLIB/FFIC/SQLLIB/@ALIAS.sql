SELECT A.CREATOR, A.NAME, A.TYPE, A.TBCREATOR, A.TBNAME                 00111016
  FROM SYSIBM.SYSTABLES A                                               00120016
     , SYSIBM.SYSTABLES T                                               00121016
 WHERE T.DBNAME IN ('DIRB0TTR')                                         00130016
   AND A.TYPE = 'A'                                                     00170016
   AND T.TYPE = 'T'                                                     00180016
;                                                                       00190006
