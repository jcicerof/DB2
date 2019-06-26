SELECT *                                                                00010000
  FROM SYSIBM.SYSSEQUENCESDEP                                           00020003
   WHERE DNAME  = 'CEDED_RECPAY'                                        00021004
-- WHERE SCHEMA = 'CEDED_RECPAY'                                        00030002
;                                                                       00031003
SELECT *                                                                00040003
  FROM SYSIBM.SYSSEQUENCES                                              00050003
   WHERE SEQUENCEID IN (300, 305)                                       00060005
-- WHERE SCHEMA = 'CEDED_RECPAY'                                        00070005
