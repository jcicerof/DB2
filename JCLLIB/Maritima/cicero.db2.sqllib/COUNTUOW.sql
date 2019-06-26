--SELECT * FROM SYSIBM.SYSTABLES                                        00001003
--WHERE TSNAME = 'DTSTSUOW'                                             00002003
--;                                                                     00003003
--FIM                                                                   00004003
  SELECT COUNT(*) FROM ASN.IBMSNAP_UOW                                  00006000
  FOR READ ONLY WITH UR;                                                00007000
--FIM                                                                   00040003
--  SELECT * FROM SYSIBM.SYSCOPY A                                      00050003
--   WHERE A.TSNAME IN ('DTSTSUOW')                                     00070003
--   ORDER BY A.TSNAME, A.TIMESTAMP DESC                                00130003
--     FOR READ ONLY WITH UR;                                           00131003
