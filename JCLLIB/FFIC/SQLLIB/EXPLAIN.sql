SET CURRENT SQLID='DB2CERT';                                            00010000
DELETE FROM PLAN_TABLE         WHERE QUERYNO=99999;                     00020000
COMMIT;                                                                 00040000
EXPLAIN ALL SET QUERYNO=99999 FOR                                       00050000
 SELECT CLIENT_ID                                                       00060009
 FROM CLT_CLT_RELATION                                                  00070008
 WHERE CLIENT_ID = ? AND CLT_TYP_CD = 'CUST' AND XRF_TYP_CD IN (        00080008
'SAME'                                                                  00090008
 , 'NCHG' ) AND HISTORY_VLD_NBR = 0 AND CICR_EFF_DT <= '9999-12-31' AND 00100008
 CICR_EXP_DT = ? ORDER BY CICR_EFF_ACY_TS DESC                          00101008
 OPTIMIZE FOR 1 ROW FETCH FIRST 1 ROW ONLY                              00101108
;                                                                       00102004
COMMIT;                                                                 00110000
SELECT *                                                                00120002
  FROM PLAN_TABLE                                                       00130002
 WHERE QUERYNO = 99999                                                  00150003
 ORDER BY QBLOCKNO, PLANNO, MIXOPSEQ;                                   00170002
