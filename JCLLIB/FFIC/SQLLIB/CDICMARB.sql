SELECT COUNT(*)                                                         00010000
  FROM DB2CERT.CLT_ADR_RELATION                                         00020001
 WHERE HISTORY_VLD_NBR = 0                                              00030000
   AND CIAR_EFF_DT <= '9999-12-31'                                      00031000
   AND CIAR_EXP_DT > '2010-06-25'                                       00040000
   AND CIAR_SER_PST_CD LIKE '85087%'                                    00050000
 OPTIMIZE FOR 500 ROWS WITH UR;                                         00060000
                                                                        00070000
