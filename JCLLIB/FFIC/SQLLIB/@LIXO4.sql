SELECT DBNAME,TSNAME,CREATOR,NAME
  FROM SYSIBM.SYSTABLES
 WHERE TYPE = 'T'
   AND CREATOR = 'CSDPROD'
   AND NAME IN ('UCST_ARCHIVE')
