-- DB2J (OWNER: ERSPROD) AND DB2D (OWNER: DB2ACPT,                      00001000
-- DB2TEST, ERSPROD AND DB2BTS)                                         00002000
--SELECT COUNT(*)                                                       00010001
--SELECT WO_WO_NM                                                       00010105
SELECT *                                                                00011006
  FROM ERSPROD.MART_WO_WKORD                                            00020000
 WHERE LENGTH(STRIP(WO_WO_NM)) > 28                                     00030006
