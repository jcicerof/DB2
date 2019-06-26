  SELECT *                                                              00010000
    FROM SYSIBM.SYSVIEWS                                                00011000
   WHERE NAME = 'V_SSCARERR_SUMPLAN'                                    00020003
  WITH UR;                                                              00021000
  SELECT *                                                              00030000
    FROM SYSIBM.SYSVIEWDEP                                              00040000
   WHERE DNAME = 'V_SSCARERR_SUMPLAN'                                   00050003
  WITH UR;                                                              00060000
