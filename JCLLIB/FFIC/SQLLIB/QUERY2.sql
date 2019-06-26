--SELECT CREATOR,NAME,DBNAME,TSNAME                                     00010004
--SELECT COUNT(*) FROM DB2TEST.UCST_MRB_CLM WITH UR;                    00010106
--SELECT COUNT(*) FROM DB2TEST.UCST_MRB_LOSS WITH UR;                   00010206
--SELECT COUNT(*) FROM DB2TEST.UCST_MRB_TRAN WITH UR;                   00010306
SELECT *                                                                00010505
  FROM SYSIBM.SYSTABLES                                                 00011003
 WHERE CREATOR IN ('CSDPROD', 'DB2TEST')                                00020002
   AND NAME IN ('UCST_MRB_CLM','UCST_MRB_LOSS','UCST_MRB_TRAN')         00030002
   AND TYPE = 'T';                                                      00040001
