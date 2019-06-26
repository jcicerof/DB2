SELECT TTNAME,                                                          00010020
       GRANTEE, DELETEAUTH, INSERTAUTH, SELECTAUTH, UPDATEAUTH          00010120
  FROM SYSIBM.SYSTABAUTH                                                00011008
WHERE TTNAME IN ('SNVISTOR', 'SNPRESTA', 'SNSERVICO', 'SNPRESTASER')    00020019
  AND GRANTEETYPE <> 'P'                                                00030005
ORDER BY 1                                                              00040009
