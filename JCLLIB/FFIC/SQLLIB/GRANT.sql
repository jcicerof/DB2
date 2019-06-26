SET CURRENT SQLID='DB2CERT';                                            00010000
COMMIT;                                                                 00020000
--                                                                      00020103
--DROP VIEW DB2CERT.CLT_ADD_NAME_TYP_V ;                                00020204
--COMMIT;                                                               00020304
--                                                                      00020403
--CREATE VIEW DB2CERT.CLT_ADD_NAME_TYP_V(ADD_NAME_TYP_CD, CTR_NBR_CD,   00021004
--    CINT_NAME_TYP_DES) AS                                             00022004
--  SELECT CICU_UCT_CD, CTR_NBR_CD, CICU_UCT_DES                        00023004
--    FROM DB2CERT.CLIENT_UCT                                           00024004
--    WHERE CICU_VIEW_NM = 'CLT_ADD_NAME_TYP_V' ;                       00025004
--COMMIT;                                                               00025104
--                                                                      00026003
GRANT SELECT, DELETE, UPDATE                                            00030004
   ON DB2CERT.CLT_ADD_NAME_TYP_V                                        00040001
   TO ZZPMXAP                                                           00050001
;                                                                       00060001
